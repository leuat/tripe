#include "lorgasm.h"
#include "resources/p6502.h"
#include "tinyexpr.h"

namespace tripe {

OrgAsm::OrgAsm(string defs) {
    if (defs == "mos6502")
        LoadDefs(string((char *)resources_orgasm_p6502_txt));
}
void OrgAsm::LoadDefs(string s) {
    vector<string> l;
    l = Util::split(s, '\n', l);
    //   cout << "loading defs" << endl;
    for (auto &s : l) {
        s = Util::trim(s);
        if (s == "")
            continue;
        if (s.starts_with("#"))
            continue;

        auto ops = Util::clean_split(s, ':');
        // instructions
        if (ops[0] == "i") {
            bool isLocal = false;
            if (ops.size() >= 6)
                isLocal = ops[5] == "local";
            Opcode op(ops[1], Util::fromNumber("0x" + ops[2]),
                      +Util::fromNumber(ops[3]), +Util::fromNumber(ops[4]),
                      isLocal);

            m_opcodes[op.m_ins].push_back(op);
        }
        // commands
        if (ops[0] == "c") {
            m_cmd[ops[1]] = ops[2];
            if (ops[1] == "hex")
                m_hex = ops[2];
            if (ops[1] == "endian")
                m_isLittleEndian = ops[2] == "0";
        }
    }
    //    cout << "done." << endl;
}

void OrgAsm::Assemble(string in, string out) {
    string s = Util::load_text_file(in);
    m_curFile = in;
    m_src.clear();
    m_src = Util::split(s, '\n', m_src);

    cout << " *** pass 1" << endl;
    Pass(0);

    cout << " *** pass 2" << endl;
    Pass(2);

    cout << " *** done" << endl;
    /*    for (auto &s : m_symtab) {
            cout << s.first << ", " << s.second << endl;
        }*/
    Util::save_text("test.asm", m_src);
    Util::save_binary(out, m_data);
}
void OrgAsm::LoadData(string type, vector<string> &l) {
    int itype = 1; // byte
    if (type == m_cmd["i16"])
        itype = 2;
    if (type == m_cmd["i32"])
        itype = 4;
    //    cout << "DATA TYOE " << m_cmd[type] << " " << itype << endl;

    for (int i = 1; i < l.size(); i++) {
        auto lst = Util::clean_split(l[i], ',');
        for (auto d : lst) {
            //            cout << " data: " << d << endl;
            uint64_t ival = Util::fromNumber(d);
            //            cout << ival << endl;
            if (addData())
                if (m_isLittleEndian) {
                    if (itype >= 1)
                        m_data.push_back((uint8_t)(ival & 0xff));
                    if (itype >= 2) {
                        m_data.push_back((uint8_t)((ival >> 8) & 0xff));
                    }
                } else
                    throw string("Big endian not supported yet");

            m_pc += itype;
        }
    }
    //    cout << Util::toHex(m_pc) << " : " <<
    //    (Util::toHex((int)m_data.back()))
    //         << endl;
}
void OrgAsm::IncBin(string s) { cout << "incbin" << endl; }

void OrgAsm::Parse(string s) {

    // cout << s << endl;

    // consts
    if (s.find("=") != string::npos) {

        auto l = Util::clean_split(Util::trim(s), '=');
        if (m_pass == 0) {
            auto var = Util::trim(l[0]);
            m_symtab[var] = Util::fromNumber(l[1]);
            /*            cout << "defining const '" << var << "' : " <<
               m_symtab[var]
                             << "     - '" << l[1] << "'" << endl;
                             */
        }
        return;
    }

    // labels
    if ((!s.starts_with(" ") && !s.starts_with("\t"))) {
        string lbl = "";
        string cl = Util::trim(s);
        // replace ":" with " "
        if (cl.find(":") != string::npos)
            cl = Util::ReplaceString(cl, ":", " ");

        // split with ' '
        auto lst = Util::clean_split(cl, ' ');
        // move everything after a label one line down
        if (m_pass == 0) {
            auto var = Util::trim(lst[0]);
            m_symtab[var] = m_pc;
            m_src[m_curLine] = var;

            if (lst.size() >= 2) {
                string moveLine = "\t";
                for (int i = 1; i < lst.size(); i++) {
                    if (lst[i] != "")
                        moveLine += lst[i];
                    if (i != lst.size() - 1)
                        moveLine += " ";
                }
                // cout << "Curline: " << m_curLine << endl;
                m_src.insert(m_src.begin() + (m_curLine + 1), moveLine);
            }
        }
        return;
    }

    auto l = Util::clean_split(s, ' ');
    if (l.size() == 0)
        return;

    /*    for (auto &c : l)
            cout << "'" << c << "'";
        cout << endl;
    */
    if (l[0] == m_cmd["pc"]) {
        uint64_t org = m_pc;
        m_pc = Util::fromNumber(l[1]);

        if (!m_firstOrg) {
            // pad with 0xff
            for (int i = 0; i < m_pc - org; i++)
                m_data.push_back((uint8_t)0xff);
        }

        if (m_firstOrg) {
            m_firstOrg = false;
            m_data.push_back((uint8_t)(m_pc & 0xff));
            m_data.push_back((uint8_t)((m_pc >> 8) & 0xff));
        }

        return;
    }
    // read data
    if (l[0] == m_cmd["i8"] || l[0] == m_cmd["i16"]) {
        LoadData(l[0], l);
        return;
    }
    if (l[0] == m_cmd["incbin"]) {
        IncBin(s);
        return;
    }
    //    cout << "contains : " << m_opcodes.contains(l[0]) << " : " << s <<
    //    endl;
    if (m_opcodes.contains(l[0])) {
        string var = "";  // variable p
        string varg = ""; // arg like +1 + someConst
        if (l.size() == 1) {
            // nop, brk, clc etc
            addInstructionData(m_opcodes[l[0]][0], var, varg);
        }
        if (l.size() > 1) {
            string args = "";
            for (int i = 1; i < l.size(); i++) {
                args += l[i];
                if (i != l.size() - 1)
                    args += " ";
            }
            auto opcode = matchPattern(l[0], args, var, varg);
            addInstructionData(opcode, var, varg);
        }
        //        cout << "Found var: " << var << endl;
    } else {
        throw string(err() + "Unknown or non-impmented instruction :" + s);
    }
}
void OrgAsm::addInstructionData(const Opcode &op, string val, string varg) {
    if (addData()) {
        m_data.push_back((uint8_t)op.m_opcode);
        // cout << Util::toHex(op.m_opcode) << endl;
    }

    // define the symbol
    if (m_pass == 0 && !Util::isPureNumber(val)) {
        // m_symtab[val] = m_pc;
    }

    // Increase pc
    m_pc += op.m_size;

    if (!addData())
        return;

    if (!m_symtab.contains(val) && !Util::isPureNumber(val))
        throw string(err() + "OrgAsm symbol not defined :" + val);

    int ival = 0;
    if (m_symtab.contains(val))
        ival = m_symtab[val];
    else // #imm
        ival = Util::fromNumber(val);

    // We have arguments like p+1+3*20 etc
    if (varg != "") {
        varg = Util::ReplaceString(varg, "$", "0x");
        int error = 0;
        ival += te_interp(varg.data(), &error);
        if (error != 0) {
            throw string("Error in expression : " + val + " " + varg);
        }
    }
    // Local branch or whatever
    if (op.m_isLocal) {
        ival -= m_pc;
        cout << "Branch size: " << Util::toHex(ival) << endl;
        if (ival >= 128 || ival <= -127)
            throw string("Local branch out of range");
    }
    /*
        cout << op.m_ins << " " << val << "  ival:" << Util::toHex(ival)
             << " with opcode " << op.m_org << endl;
    */
    if (m_isLittleEndian)
        for (int i = 0; i < op.m_size - 1; i++) {
            m_data.push_back((uint8_t)(ival & 0xff));
            ival >>= 8;
        }
    else
        throw string(err() + "Big endian not supported yet!");
}

Opcode OrgAsm::matchPattern(string op, string s, string &var, string &varg) {
    //   cout << "Pattern: " << s << endl;
    bool found = false;
    for (auto opcode : m_opcodes[op]) {
        //      cout << "compare : " << s << " to " << opcode.m_arg << endl;
        int posInData = 0;
        int posInArg = 0;
        string arg = opcode.m_arg;

        bool found = true;
        while (posInData < s.size() || posInArg < arg.size()) {
            if (arg[posInArg] == '%') {
                posInArg++;
                var = getVariable(alNum, s, posInData);
                /*                cout << "VAR : '" << var << "'   itype:" <<
                   opcode.m_type
                                     << endl;*/
                int ival = 0x1000;
                if (Util::isPureNumber(var))
                    ival = Util::fromNumber(var);

                if (m_symtab.contains(var)) {
                    ival = m_symtab[var];
                }
                /*
                cout << "Setting " << Util::toHex(ival) << " for var " << var
                     << endl;
*/
                if (ival <= 0xff && opcode.m_type == "i16")
                    found = false;
                if (ival > 0xff && opcode.m_type == "i08")
                    found = false;

                varg = getVariable(alNumOrExpr, Util::trim(s), posInData);

                /*                if (varg != "")
                                    cout << "var found : " << var << "
                   args:"
                   << varg
                                         << "   in opcode " << opcode.m_org
                                         << " accepted: " << found << endl;
                */
                //                cout << "Variable: " << var << "    pos:"
                //                << pos << endl;
                posInArg += 3;
                continue;
            }
            // 8 vs )
            //            cout << arg[posInArg] << " vs " << s[posInData] <<
            //            endl;
            if (posInData >= s.size() || posInArg >= arg.size() ||
                (s[posInData] != arg[posInArg]))
                found = false;

            posInArg++;
            posInData++;
        }
        if (found) {
            return opcode;
        }
        //     if (found)
        //       cout << "Found : " << s << " is " << opcode.m_org << endl;
    }

    throw string(err() + "Unknown or non-impmented instruction pattern " + op +
                 " " + s);
    return Opcode("NONE", 0, 0, 0, false);
}

void OrgAsm::Pass(int pass) {
    m_pass = pass;
    m_pc = 0;
    m_data.clear();
    m_firstOrg = true;
    m_curLine = 0;
    for (auto s : m_src) {
        string cl = Util::trim(s);
        if (cl == "" || cl.starts_with(";")) {
            m_curLine++;

            continue;
        }
        Parse(s);
        m_curLine++;
    }
}

} // namespace tripe