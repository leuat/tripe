#ifndef ABSTRACTCPU_H
#define ABSTRACTCPU_H

#include <vector>
#include <map>
#include <string>
#include "util.h"
#include <sstream>
using namespace std;


class Param {
public:
    static const int VAR = 0;
    static const int CONST = 1;
    string str;
    int type;
    Param() {
        str = "";
        type = 0;        
    }
    Param(string s, int t) {
        str = s;
        type = t;
    }
};


class AbstractCPU {
public:


    AbstractCPU() {
    }
    void Init(string opcodes);

    virtual string ParseFromBinary(vector<uint8_t>& data, int& pos) = 0;

    protected:
    string m_opcodeFile = "";
    string m_hexprefix = "0x";


    map<string, uint8_t> m_asmToOpcode;
    map<uint8_t, string> m_opcodeToAsm;
    map<uint8_t, vector<string>> m_opcodeToParams;
    Param getNextParam(vector<uint8_t>& data, int& pos);
};

#endif