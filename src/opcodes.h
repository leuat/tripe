#ifndef OPCODES_H
#define OPCODES_H

#include <iostream>
#include <string>
#include <vector>
#include <map>

using namespace std;

class Opcodes {
public: 
    Opcodes() {
        Init();
    }
    void Init();
    void ParseToBinary(vector<string>& line,vector<uint8_t>& m_data);
    string ParseFromBinary(vector<uint8_t>& m_data, int& pos);
    map<string, uint8_t> m_asmToOpcode;
    map<uint8_t, string> m_opcodeToAsm;
    map<uint8_t, vector<string>> m_opcodeToParams;



    

};


#endif