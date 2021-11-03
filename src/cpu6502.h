#ifndef CPU6502_H
#define CPU6502_H

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include "abstractcpu.h"
#include "util.h"
using namespace std;

class CPU6502 : public AbstractCPU {
public:
    CPU6502() {
        
        Init("opcodes.txt");
        m_hexprefix = "$";
    }
    string ParseFromBinary(vector<uint8_t>& m_data, int& pos) override;

};

#endif