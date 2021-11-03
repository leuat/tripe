#include "cpu6502.h"

CPU6502::CPU6502() {
    Init("opcodes.txt");
    m_hexprefix = "$";
    m_typeTripeToNative["uint8"] = "dc.b";
    m_typeTripeToNative["uint16"] = "dc.w";
}

string CPU6502::ParseFromBinary(vector<uint8_t>& data, int& pos) {
    string s = "";
    uint8_t opcode = data[pos];
    pos++;
    int type=0;
    if (opcode==m_asmToOpcode[".code"] || opcode==m_asmToOpcode[".data"]) {
        auto p1 = getNextParam(data,pos);
        if (p1.ival!=0) {
           m_curPos = p1.ival;
           if (m_curPos>=0x200) {
               Asm(s,"org " + p1.prefix());
           }
        }

    }
    if (opcode==m_asmToOpcode["mov"]) {
        auto res = getNextParam(data,pos);
        auto val = getNextParam(data,pos);

        if (val.type==m_asmToOpcode["uint16"]) { 
            string sh = "#"+m_hexprefix +val.str[0]+val.str[1];
            val.str = "#"+m_hexprefix +val.str[2]+val.str[3];
            Asm(s,"ldx "+sh);
            Asm(s,"stx "+res.str + "+1");

            Asm(s,"lda "+val.str);
            Asm(s,"sta "+res.str);

        } 
        else {

            Asm(s,"lda "+val.prefix());
            Asm(s,"sta "+res.str);
        }
    }
    if (opcode==m_asmToOpcode["store_p"]) {
        auto res = getNextParam(data,pos);
        auto idx = getNextParam(data,pos);
        auto val = getNextParam(data,pos);

        Asm(s,"lda "+idx.prefix());
        Asm(s,"tax");
        Asm(s,"lda "+val.prefix());
        Asm(s,"sta ("+res.str+"),x");
    }
    if (opcode==m_asmToOpcode["return"]) 
        Asm(s,"rts");
    if (opcode==m_asmToOpcode["decl"]) { 
        auto name = getNextParam(data,pos);
        auto value = getNextParam(data,pos);
        Label(s,name.str,m_typeTripeToNative[  m_opcodeToAsm[value.type]  ]  + "\t"+ value.str);
    }
    if (opcode==m_asmToOpcode["declptr"]) { 
        auto name = getNextParam(data,pos);
        auto value = getNextParam(data,pos);
        s = name.str + "\t=\t"+ to_string(m_curPos);
        m_curPos+=2;
    }

    return s;
}
