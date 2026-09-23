#ifndef CPU6502_H
#define CPU6502_H

#include "abstractcpu.h"
#include "util.h"
#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;

class CPU6502 : public AbstractCPU {
  public:
    int m_curZp = 10;
    int m_tmpZp = 80;
    CPU6502();

    //    string ParseFromBinary(vector<uint8_t>& m_data, int& pos) override;
    void InsertTempValues(vector<string> &lst) override;
    string loadIndex(string &s, string idx, string type);
    vector<string> stub(map<string, string> params) override;

    void LoadStore(int &pos, int opcode) override;
    void Declare(int &pos) override;
    void Mulu(int &pos) override;
    void Divu(int &pos) override;
    void Binop(int &pos, int opcode) override;
    void Mov(int &pos) override;
    void Cmp(int &pos) override;
    //    void triplet(vector<uint8_t>& data, int& pos, bool isPtr, bool
    //    isLoad);
};

#endif