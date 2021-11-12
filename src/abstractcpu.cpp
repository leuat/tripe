#include "abstractcpu.h"
#include "error.h"

void AbstractCPU::Init(string opcodes) {
//    auto d = Util::read_text_code_file(opcodes);
    vector<string> d;
//    auto d = Util::read_text_code_file("opcodes.txt");
    d = Util::split(opcodes,'\n',d);
//    cout << opcodes;
    for (auto s: d) {
        s = Util::trim(s);
        vector<string> v;
        s = Util::ReplaceString(s," ","");
//        s = Util::ReplaceString(s,"\n","");
        Util::split(s,',',v);
        if (v.size()<=1)
            continue;
  //      cout << s<<endl;
        int val;
        stringstream (v[1]) >>hex>>val;
        string str = Util::toLower(Util::trim(v[0]));
        if (m_opcodeToAsm.contains(val)) 
            Error::RaiseError("Error when reading the opcodes list: opcode $"+Util::toHex(val)+" is taken.");
        
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
    if (s.starts_with("_r")) {
        bool ok = true;
        for (auto v: m_registersUsed)
            if (s==v)
                ok = false;
        if (ok)
            m_registersUsed.push_back(s);

    }
    return Param(s,type);
}

bool AbstractCPU::isBinaryOpOpcode(int code) {
    for (string s:m_similarBinops) {
        if (m_asmToOpcode[s]==code)
        return true;
    }

    return false;
}
bool AbstractCPU::isSingleParamOpcode(int code) {
    for (string s:m_singleParamOpcodes) {
        if (m_asmToOpcode[s]==code)
        return true;
    }

    return false;
}