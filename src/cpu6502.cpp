#include "cpu6502.h"
#include "error.h"
#include "data.h"

CPU6502::CPU6502() {
    Init(Data::s_opcodes);
    m_hexprefix = "$";
    m_typeTripeToNative["uint8"] = "dc.b";
    m_typeTripeToNative["uint16"] = "dc.w";

    m_typeTripeToNative["add"] = "adc";
    m_typeTripeToNative["sub"] = "sbc";
    m_typeTripeToNative["or"] = "ora";
    m_typeTripeToNative["and"] = "and";
    m_typeTripeToNative["xor"] = "eor";

    m_typeTripeToNative["bne"] = "bne";
    m_typeTripeToNative["beq"] = "beq";



    m_similarBinops ={ "add","sub","or","and","xor"};
    m_branchOps ={ "bne","beq","bgts","blts","bgs","bls","bgtu","bltu","bgu","blu"};

}

string CPU6502::ParseFromBinary(vector<uint8_t>& data, int& pos) {
    string s = "";
    uint8_t opcode = data[pos];
    pos++;
    int type=0;
//    cout << "HERE "<<m_opcodeToAsm[opcode]<<" " <<Util::toHex(opcode)<<endl; 

    if (opcode==m_asmToOpcode[".uint8"] || opcode==m_asmToOpcode[".uint16"]) {
        string stype = m_opcodeToAsm[opcode];
//        cout << "INSIDE "<<stype<<" " <<Util::toHex(opcode)<< " " <<Util::toHex(data[pos])<<endl; 
        stype.erase(stype.begin(),stype.begin()+1);
        s="\t"+m_typeTripeToNative[stype] +"\t";
        int cnt = (uint8_t)data[pos];
        pos++;
  //      cout << "COUNT "<<to_string(cnt)<< endl;
        for (int i=0;i<cnt;i++) {
            s+=m_hexprefix+Util::toHex(data[pos++]);
            if (i!=cnt-1)
                s+=", ";
        
        }          
        return s;
    }
    if (opcode==m_asmToOpcode[".label"]){
        auto name = getNextParam(data,pos);
        Label(s,name.str);
    }
    if (opcode==m_asmToOpcode[".processor"]){
        auto name = getNextParam(data,pos);
        Asm(s,"processor "+name.str);
    }
    if (opcode==m_asmToOpcode["jump"]){
        auto name = getNextParam(data,pos);
//        cout << "JUMP to next " << name.str<<endl;

        Asm(s,"jmp "+name.str);
    }
    if (opcode==m_asmToOpcode["cmp"]){
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);
//        cout << "JUMP to next " << name.str<<endl;

        Asm(s,"lda "+a.str);
        Asm(s,"cmp "+b.prefix());
    }


    if (opcode==m_asmToOpcode[".code"] || opcode==m_asmToOpcode[".data"]) {
        auto p1 = getNextParam(data,pos);
        string name = "";
        if (opcode==m_asmToOpcode[".code"]) {
           auto na = getNextParam(data,pos);
            name = "; "+na.str; 
        }
        if (p1.ival!=0) {
           m_curPos = p1.ival;
           if (m_curPos>=0x200) {
               Asm(s,"org " + p1.prefix() + name);
           }
        }

    }
   if (isBranchOpcode(opcode)) {
       auto lbl = getNextParam(data,pos);
        Asm(s,m_typeTripeToNative[m_opcodeToAsm[opcode]]+"\t"+lbl.str);       
 
   }
   if (isBinaryOpOpcode(opcode)) {
        auto res = getNextParam(data,pos);
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);
        if (res.type==m_asmToOpcode["uint16"]) {
            Error::RaiseError("Add / sub doesn't work with 16 bit yet");
        }
        Asm(s,"lda "+a.prefix());
        string op = m_typeTripeToNative [m_opcodeToAsm[opcode] ];
        if (op=="adc") 
            Asm(s,"clc");
        if (op=="sbc") 
            Asm(s,"sec");
        Asm(s,op+ " "+b.prefix());
        Asm(s,"sta "+res.prefix());

   }
    
   if (opcode==m_asmToOpcode["mov"]) {
        auto res = getNextParam(data,pos);
        auto val = getNextParam(data,pos);

        if (val.type==m_asmToOpcode["uint16"]) { 
            Asm(s,"ldx #"+val.hi());
            Asm(s,"stx "+res.str + "+1");

            Asm(s,"lda #"+val.lo());
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
        Asm(s,"tay");
        Asm(s,"lda "+val.prefix());
        Asm(s,"sta ("+res.str+"),y");
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
        s = name.str + "\t=\t"+ to_string(m_curZp);
        m_curZp+=2;
    }

    return s;
}
