#include "cpu6502.h"

string CPU6502::ParseFromBinary(vector<uint8_t>& data, int& pos) {
    string s = "";
    uint8_t opcode = data[pos];
    pos++;
    int type=0;
    if (opcode==m_asmToOpcode[".code"]) {
        s +="org " + getNextParam(data,pos).str;
    }
    if (opcode==m_asmToOpcode["mov"]) {
        auto res = getNextParam(data,pos);
        auto val = getNextParam(data,pos);
        if (val.type==Param::CONST) 
            val.str = "#"+val.str;

        s = "\tlda "+val.str + "\n";
        s += "\tsta "+res.str + "\n";
    }

    return s;
}
