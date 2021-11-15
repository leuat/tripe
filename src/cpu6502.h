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
    int m_curZp=10;
    int m_tmpZp=80;
    CPU6502();

    string ParseFromBinary(vector<uint8_t>& m_data, int& pos) override;
    void InsertTempValues(vector<string>& lst) override;

};

#endif