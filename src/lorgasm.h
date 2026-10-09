#pragma once

#include "tripeutil.h"
#include <map>
#include <string>

using namespace std;

namespace tripe {

class Opcode {
  public:
    uint16_t m_opcode, m_size, m_cycles;
    string m_ins, m_org, m_arg, m_type = "";
    bool m_isLocal = false;

    Opcode(string instruction, uint16_t opcode, uint16_t size, uint16_t cycles,
           bool isLocal)
        : m_org(instruction), m_opcode(opcode), m_size(size), m_cycles(cycles),
          m_isLocal(isLocal) {
        auto l = Util::clean_split(m_org, ' ');
        m_ins = l[0];
        if (l.size() >= 2)
            m_arg = l[1];
        else
            m_arg = "";

        // extract %i08 etc
        if (m_arg.size() > 0) {
            int cnt = 0;
            while (cnt < m_arg.size() && m_arg[cnt] != '%')
                cnt++;
            if (cnt < m_arg.size())
                m_type = m_arg.substr(cnt + 1,
                                      3); // + m_arg[cnt + 1] + m_arg[cnt + 2];
            if (m_type != "i08" && m_type != "i16")
                throw string(
                    "Orgasm internal error in opcode definitions for " + m_ins +
                    ", incorrect type :" + m_type);
        }
    }
    Opcode() {}
};

class OrgAsm {
  public:
    OrgAsm(string defs);
    void Assemble(string in, string out);
    map<string, vector<Opcode>> m_opcodes;
    map<string, string> m_cmd, m_dataTypes;

    string m_curFile = "";

    bool m_isLittleEndian = true;
    int m_pass = 0;
    uint64_t m_pc = 0;
    map<string, int> m_symtab;
    vector<string> m_src;
    vector<uint8_t> m_data;
    string m_hex = "";
    int m_curLine = 0;
    bool m_firstOrg = true;
    const string alNum =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ$0123456789_$";
    const string alNumOrExpr = alNum + "#+-*/ ";

    string getVariable(const string &tst, string s, int &pos) {
        string ret = "";
        while (tst.find(s[pos]) != string::npos && pos < s.size()) {
            ret += s[pos++];
        }
        return ret;
    }

  private:
    void LoadDefs(string s);
    void Pass(int type);
    void Parse(string s);
    void LoadData(string s, vector<string> &l);
    void IncBin(string s);
    Opcode matchPattern(string op, string s, string &var, string &varArg);
    bool addData() { return m_pass == 2; }

    void addInstructionData(const Opcode &op, string val, string varg);
    string err() {
        return "\nOrgAsm error in " + m_curFile + " on line " +
               std::to_string(m_curLine) + ":\n";
    }
};

} // namespace tripe