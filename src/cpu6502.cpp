#include "cpu6502.h"
#include "data.h"
#include "error.h"
#include "resources/div8_6502.h"
#include "resources/mul8_6502.h"
#include <algorithm>

CPU6502::CPU6502() : AbstractCPU() {
    Init(Data::s_opcodes);
    m_symtab.clear();
    m_hexprefix = "$";
    m_typeTripeToNative["uint8"] = "dc.b";
    m_typeTripeToNative["uint16"] = "dc.w";

    m_typeTripeToNative["add"] = "adc";
    m_typeTripeToNative["sub"] = "sbc";
    m_typeTripeToNative["or"] = "ora";
    m_typeTripeToNative["and"] = "and";
    m_typeTripeToNative["xor"] = "eor";

    m_typeTripeToNative["bne"] = "bne";
    m_typeTripeToNative["beq"] = "beq";
    m_typeTripeToNative["bgtu"] = "bcc";
    m_typeTripeToNative["bltu"] = "bcs";
    m_typeTripeToNative["shr"] = "lsr";
    m_typeTripeToNative["shl"] = "asl";

    m_typeTripeToNative["jump"] = "jmp";
    m_typeTripeToNative["call"] = "jsr";
    m_typeTripeToNative["fcall"] = "jsr";

    m_typeTripeToNative["return"] = "rts";
    m_typeTripeToNative["rti"] = "rti";

    m_typeTripeToNative["bcc"] = "bcc";
    m_typeTripeToNative["bcs"] = "bcs";

    m_similarBinops = {"add", "sub", "or", "and", "xor", "mulu", "shl", "shr"};
    m_singleParamOpcodes = {"bne",  "beq",  "bgts", "blts", "bgs",
                            "bls",  "bgtu", "bltu", "bgu",  "blu",
                            "call", "jump", "bcc",  "bcs"};

    m_code["mul8"] = string((char *)resources_6502_mul8_asm);
    m_code["div8"] = string((char *)resources_6502_div8_asm);
}

void CPU6502::InsertTempValues(vector<string> &lst, int pos) {
    for (auto s : m_registersUsed) {
        lst.insert(lst.begin() + pos, s + " = $" + Util::toHex(m_tmpZp));
        pos += 1;
        m_tmpZp += m_symtab[s] == "uint8" ? 1 : 2;
    }
}

string CPU6502::loadIndex(string &s, string idx, string type) {
    string xy = "x";
    if (type.starts_with("ptr"))
        xy = "y";

    if (type == "ptr16" || type == "uint16") {
        Asm("lda " + idx);
        Asm("asl");
        Asm("ta" + xy);
    } else
        Asm("ld" + xy + " " + idx);
    return xy;
}
/*
string CPU6502::ParseFromBinary(vector<uint8_t>& data, int& pos) {
}
*/

vector<string> CPU6502::stub(map<string, string> params) {
    vector<string> src;
    string startAddress = "";
    string printAddress = "";

    bool print = false;
    int istart = 0;
    if (params.contains("start_address"))
        startAddress = params["start_address"];

    if (params.contains("sys"))
        if (params["sys"] == "c64") {
            if (startAddress == "")
                istart = m_foundStartPos;
            print = true;

            string s = Util::toDec(istart);
            for (auto c : s) {
                printAddress += "$" + Util::toHex(c) + ",";
            }
            // add missing spaces
            while (printAddress.size() < 4)
                printAddress += "$20, ";
        }

    if (print) {
        src.push_back("\torg $801");
        src.push_back("\tdc.b $b, $8, $a, $0, $9e, $20," + printAddress +
                      " $0, $0, $0");
    }

    return src;
}

void CPU6502::LoadStore(int &pos, int opcode) {
    string s = "";
    auto res = getNextParam(m_data, pos);
    auto idx = getNextParam(m_data, pos);
    auto val = getNextParam(m_data, pos);

    if (opcode == m_asmToOpcode["store"]) {
        // store_p ptr idx val
        auto type = m_symtab[res.str];
        string y = loadIndex(s, idx.prefix(), type);
        Asm("lda " + val.lo());
        if (y == "y")
            Asm("sta (" + res.str + ")," + y);
        else
            Asm("sta " + res.str + "," + y);

        if (type == "uint16") {
            Asm("lda " + val.hi());
            if (y == "y") {
                Asm("iny");
                Asm("sta (" + res.str + ")," + y);
            } else
                Asm("sta " + res.str + "+1," + y);

            Asm("sta " + val.prefix() + "+1");
        }
    }
    if (opcode == m_asmToOpcode["load"]) {
        // store_p ptr idx val
        auto type = m_symtab[res.str];
        string y = loadIndex(s, idx.prefix(), type);
        //        Asm(" ; type : " + type);
        if (y == "y")
            Asm("lda (" + res.str + ")," + y);
        else
            Asm("lda " + res.str + "," + y);

        Asm("sta " + val.prefix());
        if (type == "uint16") {
            if (y == "y") {
                Asm("iny");
                Asm("lda (" + res.str + ")," + y);
            } else
                Asm("lda " + res.str + "+1," + y);

            Asm("sta " + val.prefix() + "+1");
        }
    }
}

void CPU6502::Declare(int &pos) {
    auto name = getNextParam(m_data, pos);
    auto value = getNextParam(m_data, pos);
    if (isRegister(name.str)) {
        m_symtab[name.str] = m_opcodeToAsm[value.type];
        return;
    }
    if (m_symtab[name.str].starts_with("ptr")) {
        Asm(name.str + "\t=\t" + to_string(m_curZp));
        m_curZp += 2;

    } else {
        Label(name.str, m_typeTripeToNative[m_opcodeToAsm[value.type]] + "\t" +
                            "$" + value.str);
    }
    m_symtab[name.str] = m_opcodeToAsm[value.type];
}

void CPU6502::Mulu(int &pos) {
    addCode("mul8");
    auto ret = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);
    Asm("ldx " + b.prefix());
    Asm("lda " + a.prefix());
    Asm("jsr mul_8bit_");
    Asm("stx " + ret.prefix());
    //        Asm( "ldy #0");
}
void CPU6502::Divu(int &pos) {
    addCode("div8");
    auto ret = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);
    Asm("lda " + a.prefix());
    Asm("sta div8x8_d");
    Asm("lda " + b.prefix());
    Asm("sta div8x8_c");
    Asm("jsr div_8bit_");
    Asm("sta " + ret.prefix());
}

void CPU6502::Binop(int &pos, int opcode) {
    auto res = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);

    string op = m_typeTripeToNative[m_opcodeToAsm[opcode]];
    // Inc / dec
    if (op == "adc" && res.str == a.str && b.str == "1") {
        Asm("inc " + res.str);
        return;
    }
    if (op == "sbc" && res.str == a.str && b.str == "1") {
        Asm("dec " + res.str);
        return;
    }

    Asm("lda " + a.lo());

    //        std::cout << " tst " << (int)opcode  <<  " " <<op<< " "
    //        <<m_opcodeToAsm[opcode] << " " << (int)a.ival << " " << b.prefix()
    //        <<std::endl;
    if (op == "asl") {
        //          std::cout << "shlll  " << b.ival<<std::endl;
        for (int i = 0; i < b.ival; i++)
            Asm("asl");
        Asm("sta " + res.prefix());
        return;
    }
    if (op == "lsr") {
        //          std::cout << "shlll  " << b.ival<<std::endl;
        for (int i = 0; i < b.ival; i++)
            Asm("lsr");
        Asm("sta " + res.prefix());
        return;
    }

    if (op == "adc")
        Asm("clc");
    if (op == "sbc")
        Asm("sec");

    Asm(op + " " + b.prefix());
    Asm("sta " + res.prefix());
    //        std::cout << "BINOP : " <<a.prefix() << " " <<b.prefix() << " " <<
    //        (int)(a.type==m_asmToOpcode["uint16"])<< " "
    //        <<(int)(b.type==m_asmToOpcode["uint16"]) << endl; std::cout << "
    //        Type : " << m_symtab[a.prefix()] << " "
    //        <<(int)(b.type==m_asmToOpcode["uint16"]) << endl;

    if (is16bit(a.str) || is16bit(b.str) || a.isRef() || b.isRef()) {

        //          Error::RaiseError("Add / sub doesn't work with 16 bit yet");
        Asm("lda " + a.hi());
        if (m_symtab[b.prefix()] == "uint8") {
            Asm(op + " #0");

        } else {
            if (b.type == 1)
                Asm(op + " " + b.prefix() + "+1");
            else
                Asm(op + " " + b.hi());
        }

        Asm("sta " + res.prefix() + "+1");
    }
}

void CPU6502::Mov(int &pos) {
    auto res = getNextParam(m_data, pos);
    auto val = getNextParam(m_data, pos);

    if (m_symtab.contains(res.str) && is16bit(res.str) || val.isRef() ||
        is16bit(val.str)) {
        //            cout << "16 bit load: address? " << (int)val.type <<" :"
        //            <<val.prefix() << endl;
        //          cout << m_symtab[val.prefix()] <<endl;

        Asm("ldx " + val.hi());
        Asm("stx " + res.str + "+1");

        Asm("lda " + val.lo());
        Asm("sta " + res.str);

    } else {

        Asm("lda " + val.prefix());
        Asm("sta " + res.str);
    }
}

void CPU6502::Cmp(int &pos) {
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);

    Asm("lda " + a.str);
    Asm("cmp " + b.prefix());
}