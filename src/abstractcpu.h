#ifndef ABSTRACTCPU_H
#define ABSTRACTCPU_H

#include <vector>
#include <map>
#include <string>
#include "util.h"
#include <sstream>
#include "error.h"

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
        std::istringstream ( str ) >> hex >>ival;
    }
    string lo() { 
        if (type==1)
            return str;
         return "#$"+Util::toHex(ival&255);       
    }
    string hi() { 
        if (type==1)
            return str+"+1";
         return "#$"+Util::toHex((ival>>8)&255);       
    }

    string prefix() {
        if (type==1)
            return str;

        return "#$"+str;
    }

};


class AbstractCPU {
public:

    int m_curPos = 0;
    AbstractCPU() {

    }
    void Init(string opcodes);
    virtual void InsertTempValues(vector<string>& lst) {}

    virtual string ParseFromBinary(vector<uint8_t>& data, int& pos) = 0;

    map<string, uint8_t> m_asmToOpcode;
    map<uint8_t, string> m_opcodeToAsm;


protected:
    string m_opcodeFile = "";
    string m_hexprefix = "0x";

    void Asm(string&s, string t) {
        s += "\t"+t+"\n";
    }
    void Label(string&s, string t) {
        s += t+":\n";
    }
    void Label(string&s, string t, string v) {
        s += t+":\t" + v+"\n";
    }


    Param getNextParam(vector<uint8_t>& data, int& pos);
    bool isBinaryOpOpcode(int code);
    bool isBranchOpcode(int code);
    bool isSingleParamOpcode(int code);

    int m_currentRegister;

    map<uint8_t, vector<string>> m_opcodeToParams;
    map<string,string> m_typeTripeToNative;
    vector<string> m_similarBinops;
    vector<string> m_singleParamOpcodes;
    vector<string> m_registersUsed;
    vector<string> m_registers;
    map<string, string> m_symtab;


    string pushReg() {
        return m_registers[m_currentRegister++];
    }
    void popReg() {
        m_currentRegister--;
        if (m_currentRegister<0)
            Error::RaiseError("Cannot pop register from 0");

    }

};

#endif