#ifndef ABSTRACTCPU_H
#define ABSTRACTCPU_H

#include <cstdint>
#include <map>
#include <sstream>
#include <string>
#include <vector>

#include "error.h"
#include "opts/phopt.h"
#include "util.h"

using namespace std;

class Param {
  public:
    static const int VAR = 1;
    string str;
    uint64_t ival;
    int type;
    Param() {
        str = "";
        type = 0;
        ival = 0;
    }
    Param(string s, int t) {
        str = s;
        type = t;
        std::istringstream(str) >> hex >> ival;
    }
    string lo() {
        if (type == 1) {
            if (isRef())
                return "#<" + clean();
            else
                return str;
        }
        return "#$" + Util::toHex(ival & 255);
    }
    string hi() {
        if (type == 1) {
            if (isRef())
                return "#>" + clean();
            else
                return str + "+1";
        }
        return "#$" + Util::toHex((ival >> 8) & 255);
    }

    string prefix() {
        if (type == 1)
            return str;

        return "#$" + str;
    }

    bool isRef() { return str.starts_with("#"); }

    string clean() {
        string s = str;
        return s.erase(0, 1);
    }
};

class AbstractCPU {
  public:
    bool m_initialized = false;
    int m_curPos = 0;
    int m_foundStartPos = -1;
    vector<uint8_t> m_data;
    Phopt *m_phopt = 0;
    string m_line;
    AbstractCPU() {}
    void Init(string opcodes);

    map<string, string> m_code;
    vector<string> m_usedCode;

    bool isRegister(string &s) { return s.starts_with("_r"); }

    void addCode(string s) {
        int cnt = count(m_usedCode.begin(), m_usedCode.end(), s);
        if (cnt == 0)
            m_usedCode.push_back(s);
    }

    virtual void InsertTempValues(vector<string> &lst, int pos) {}

    string ParseFromBinary(int &pos);

    virtual vector<string> stub(map<string, string> params) {
        return vector<string>();
    }

    std::string ParseInlineAsm(vector<uint8_t> &data, int &pos);

    map<string, uint8_t> m_asmToOpcode;
    map<uint8_t, string> m_opcodeToAsm;

    Param getNextParam(vector<uint8_t> &data, int &pos);
    vector<string> m_registersUsed;

  protected:
    string m_opcodeFile = "";
    string m_hexprefix = "0x";

    void Asm(string t) { m_line += "\t" + t + "\n"; }
    void Label(string t) { m_line += t + ":\n"; }
    void Label(string t, string v) { m_line += t + ":\t" + v + "\n"; }

    virtual void LoadStore(int &pos, int opcode) {}
    virtual void Declare(int &pos) {}
    virtual void Mulu(int &pos) {}
    virtual void Divu(int &pos) {}
    virtual void Binop(int &pos, int opcode) {}
    virtual void Mov(int &pos) {}
    virtual void Cmp(int &pos) {}
    bool isBinaryOpOpcode(int code);
    bool isBranchOpcode(int code);
    bool isSingleParamOpcode(int code);

    bool is16bit(string val);

    int m_currentRegister;

    map<uint8_t, vector<string>> m_opcodeToParams;
    map<string, string> m_typeTripeToNative;
    vector<string> m_similarBinops;
    vector<string> m_singleParamOpcodes;
    vector<string> m_registers;
    map<string, string> m_symtab;

    string pushReg() { return m_registers[m_currentRegister++]; }
    void popReg() {
        m_currentRegister--;
        if (m_currentRegister < 0)
            Error::RaiseError("Cannot pop register from 0");
    }
};

#endif
