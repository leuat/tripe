#ifndef OPCODES_H
#define OPCODES_H

#include "abstractcpu.h"
#include "data.h"
#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;

class Opcodes : public AbstractCPU {
  public:
    void ParseToBinary(vector<string> &line, vector<uint8_t> &m_data);
    string ParseFromBinary(int &pos);
    bool m_inRawAsm = false;
    Opcodes() { Init(Data::s_opcodes); }
};

#endif