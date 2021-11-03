#include "abstractcpu.h"

void AbstractCPU::Init(string opcodes) {
    auto d = Util::read_text_code_file(opcodes);
    for (auto s: d) {
        s = Util::trim(s);
        vector<string> v;
        Util::split(s,',',v);
        int val;
        stringstream (v[1]) >>hex>>val;
        string str = Util::toLower(Util::trim(v[0]));
        m_asmToOpcode[str] = val;
        m_opcodeToAsm[val] = str;
        vector<string> params;
        Util::split(v[2],':',params);
        for (auto& sp:params) {
            sp = Util::toLower(Util::trim(sp));
        }

        m_opcodeToParams[val] = params;
    }
}

Param AbstractCPU::getNextParam(vector<uint8_t>& data, int& pos) {
    string s ="";
    int type = 0;
    uint8_t v = data[pos];
    if (m_opcodeToAsm.contains(v) && v>0xF0) {
        // We have a const type int64 etc
        pos+=1;
        s+=Util::ival2string(data,pos,m_opcodeToAsm[v]);
        pos+=Util::getIntLen(m_opcodeToAsm[v]);
        type = v;
    } 
    else // Some text 
    {   
        while (data[pos]!=0) {
            s+=data[pos++];
        }
        pos++;
        type = Param::VAR;
    }
    return Param(s,type);
}