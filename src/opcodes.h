#ifndef OPCODES_H
#define OPCODES_H

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include "abstractcpu.h"
#include "data.h"
using namespace std;

class Opcodes : public AbstractCPU {
public: 
    void ParseToBinary(vector<string>& line,vector<uint8_t>& m_data);
    string ParseFromBinary(vector<uint8_t>& m_data, int& pos) override;
    bool m_inRawAsm = false;
    Opcodes() {
        Init(Data::s_opcodes);
    }


    

};


#endif