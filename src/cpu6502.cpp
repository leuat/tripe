#include "cpu6502.h"
#include "error.h"
#include "data.h"
#include <algorithm>
#include "resources/mul8_6502.h"
#include "resources/div8_6502.h"

CPU6502::CPU6502() : AbstractCPU() {
    Init(Data::s_opcodes);
    m_symtab.clear();
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
    m_typeTripeToNative["bgtu"] = "bcc";
    m_typeTripeToNative["bltu"] = "bcs";
    m_typeTripeToNative["shr"] = "lsr";
    m_typeTripeToNative["shl"] = "asl";

    m_typeTripeToNative["jump"] = "jmp";
    m_typeTripeToNative["call"] = "jsr";
    m_typeTripeToNative["fcall"] = "jsr";

    m_typeTripeToNative["bcc"] = "bcc";
    m_typeTripeToNative["bcs"] = "bcs";


    m_similarBinops ={ "add","sub","or","and","xor", "mulu", "shl", "shr" };
    m_singleParamOpcodes ={ "bne","beq","bgts","blts","bgs","bls","bgtu","bltu","bgu","blu",
        "call","jump", "bcc", "bcs"};

    m_code["mul8"] = string((char*)resources_6502_mul8_asm);
    m_code["div8"] = string((char*)resources_6502_div8_asm);

}

void CPU6502::InsertTempValues(vector<string>& lst) {
    for (auto s: m_registersUsed) {
        lst.push_back(s + " = $" + Util::toHex(m_tmpZp));
        m_tmpZp+=2;
    }        
}

string CPU6502::loadIndex(string& s,string idx, string type) {
    string xy = "x";
    if (type.starts_with("ptr"))
        xy = "y";

    if (type=="ptr16" || type=="uint16") {
        Asm(s,"lda "+idx);
        Asm(s,"asl"); 
        Asm(s,"ta"+xy);
    }
    else 
        Asm(s,"ld"+xy + " "+idx);
    return xy;
}

string CPU6502::ParseFromBinary(vector<uint8_t>& data, int& pos) {
    string s = "";
    uint8_t opcode = data[pos];
    if (opcode==0) {
        std::cout << "error : illegal opcode 0" << std::endl;
        exit(1);
    }

    int type=0;
//    cout << "HERE "<<m_opcodeToAsm[opcode]<<" " <<Util::toHex(opcode)<<endl; 
    auto as = ParseInlineAsm(data,pos);
    if (as!="") {
        return as;
    }
    pos++;


    if (opcode==m_asmToOpcode[".uint8"] || opcode==m_asmToOpcode[".uint16"]) {
        string stype = m_opcodeToAsm[opcode];
//        cout << "INSIDE "<<stype<<" " <<Util::toHex(opcode)<< " " <<Util::toHex(data[pos])<<endl; 
        stype.erase(stype.begin(),stype.begin()+1);
        s="\t"+m_typeTripeToNative[stype] +"\t";
        int cnt = (uint8_t)data[pos] | (((uint8_t)data[pos+1])<<8);
        pos+=2;
//        cout << "COUNT "<<to_string(cnt)<< endl;
        for (int i=0;i<cnt;i++) {
            int val =  data[pos];
            if (opcode==m_asmToOpcode[".uint16"]) {
                val |= data[++pos]<<8;
            }
            pos++;
            s+=m_hexprefix+Util::toHex(val);
            if (i!=cnt-1)
                s+=", ";
        
        }          
        return s;
    }
    if (opcode==m_asmToOpcode[".label"]){
        auto name = getNextParam(data,pos);
        Label(s,name.str);
    }
    if (opcode==m_asmToOpcode[".gcode"]){
        Asm(s, ".gcode");
    }

/*
    if (opcode==m_asmToOpcode[".processor"]){
        auto name = getNextParam(data,pos);
        Asm(s,"processor "+name.str);
    }
    if (opcode==m_asmToOpcode["jump"]){
        auto name = getNextParam(data,pos);
        Asm(s,"jmp "+name.str);
    }
*/
    if (opcode==m_asmToOpcode["cmp"]){
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);
//        cout << "JUMP to next " << name.str<<endl;

        Asm(s,"lda "+a.str);
        Asm(s,"cmp "+b.prefix());
    }
    if (opcode==m_asmToOpcode[".incbin"]) {
        auto p1 = getNextParam(data,pos);
        Asm(s,"incbin "+p1.prefix());
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
           if (m_foundStartPos==-1)
              m_foundStartPos = m_curPos;
           if (m_curPos>=0x200) {
               Asm(s,"org " + p1.prefix() + name);
           }
        }

    }
   if (isSingleParamOpcode(opcode)) {
       auto lbl = getNextParam(data,pos);
        Asm(s,m_typeTripeToNative[m_opcodeToAsm[opcode]]+"\t"+lbl.str);       
 
   }
   if (opcode==m_asmToOpcode["mulu"]) {
        // Do mulu stuff
        addCode("mul8");
        auto ret = getNextParam(data,pos);
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);
        Asm(s, "ldx "+b.prefix());
        Asm(s, "lda "+a.prefix());
        Asm(s, "jsr mul_8bit_");
        Asm(s, "stx "+ret.prefix());
//        Asm(s, "ldy #0");

        return s;
   }
   if (opcode==m_asmToOpcode["divu"]) {
        // Do mulu stuff
        addCode("div8");
        auto ret = getNextParam(data,pos);
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);
        Asm(s, "lda "+a.prefix());
        Asm(s, "sta div8x8_d");
        Asm(s, "lda "+b.prefix());
        Asm(s, "sta div8x8_c");
        Asm(s, "jsr div_8bit_");
        Asm(s, "sta "+ret.prefix());
//        Asm(s, "ldy #0");

        return s;
   }

   if (isBinaryOpOpcode(opcode)) {
        auto res = getNextParam(data,pos);
        auto a = getNextParam(data,pos);
        auto b = getNextParam(data,pos);

        string op = m_typeTripeToNative [m_opcodeToAsm[opcode] ];
        // Inc / dec
        if (op=="adc" && res.str==a.str && b.str=="1" ) {
            Asm(s,"inc "+res.str);
            return s;
        }
        if (op=="sbc" && res.str==a.str && b.str=="1" ) {
            Asm(s,"dec "+res.str);
            return s;
        }


        Asm(s,"lda "+a.lo());

//        std::cout << " tst " << (int)opcode  <<  " " <<op<< " "  <<m_opcodeToAsm[opcode] << " " << (int)a.ival << " " << b.prefix() <<std::endl;
        if (op=="asl") {
  //          std::cout << "shlll  " << b.ival<<std::endl;
            for (int i=0;i<b.ival;i++)
                Asm(s,"asl");
            Asm(s,"sta "+res.prefix());
            return s; 
        } 
        if (op=="lsr") {
  //          std::cout << "shlll  " << b.ival<<std::endl;
            for (int i=0;i<b.ival;i++)
                Asm(s,"lsr");
            Asm(s,"sta "+res.prefix());
            return s; 
        } 



        if (op=="adc") 
            Asm(s,"clc");
        if (op=="sbc") 
            Asm(s,"sec");

        Asm(s,op+ " "+b.prefix());
        Asm(s,"sta "+res.prefix());
//        std::cout << "BINOP : " <<a.prefix() << " " <<b.prefix() << " " << (int)(a.type==m_asmToOpcode["uint16"])<< " " <<(int)(b.type==m_asmToOpcode["uint16"]) << endl;
//        std::cout << " Type : " << m_symtab[a.prefix()] << " " <<(int)(b.type==m_asmToOpcode["uint16"]) << endl;
        if (is16bit(a.str) || is16bit(b.str) || a.isRef() || b.isRef()) {

  //          Error::RaiseError("Add / sub doesn't work with 16 bit yet");
            Asm(s,"lda "+a.hi());
            if (m_symtab[b.prefix()]=="uint8") {
                Asm(s,op+ " #0");

            }
            else {
                if (b.type==1)
                    Asm(s,op+ " "+b.prefix()+"+1");
                else 
                    Asm(s,op+ " "+b.hi());
            }

            Asm(s,"sta "+res.prefix()+"+1");
            
        }


   }
    
   if (opcode==m_asmToOpcode["mov"]) {
        auto res = getNextParam(data,pos);
        auto val = getNextParam(data,pos);

        if (m_symtab.contains(res.str) && is16bit(res.str) || val.isRef() || is16bit(val.str)) { 
//            cout << "16 bit load: address? " << (int)val.type <<" :" <<val.prefix() << endl;
  //          cout << m_symtab[val.prefix()] <<endl;

            Asm(s,"ldx "+val.hi());
            Asm(s,"stx "+res.str + "+1");

            Asm(s,"lda "+val.lo());
            Asm(s,"sta "+res.str);

        } 
        else {


            Asm(s,"lda "+val.prefix());
            Asm(s,"sta "+res.str);
        }
    }
    if (opcode==m_asmToOpcode["store"] || opcode==m_asmToOpcode["load"]) {
        auto res = getNextParam(data,pos);
        auto idx = getNextParam(data,pos);
        auto val = getNextParam(data,pos);

//        std::cout << "SYM : " <<res.str << " " <<m_symtab[res.str] << endl;

        if (opcode==m_asmToOpcode["store"]) {
            // store_p ptr idx val
                auto type =  m_symtab[res.str];
                string y = loadIndex(s,idx.prefix(), type);
                Asm(s,"lda "+val.lo());
                if (y=="y")
                    Asm(s,"sta ("+res.str+"),"+y);
                else 
                    Asm(s,"sta "+res.str+","+y);

                  if (type=="uint16") {
                        Asm(s,"lda "+val.hi());
                        if (y=="y") {
                            Asm(s, "iny");
                            Asm(s,"sta ("+res.str+"),"+y);
                        }
                        else 
                            Asm(s,"sta "+res.str+"+1,"+y);

                        Asm(s,"sta "+val.prefix()+"+1");

                    }

        }
        if (opcode==m_asmToOpcode["load"]) {
            // store_p ptr idx val
                auto type =  m_symtab[res.str];
                string y = loadIndex(s,idx.prefix(), type);
                Asm(s," ; type : "+type);
                if (y=="y")
                    Asm(s,"lda ("+res.str+"),"+y);
                else 
                    Asm(s,"lda "+res.str+","+y);

                Asm(s,"sta "+val.prefix());
                if (type=="uint16") {
                    if (y=="y") {
                        Asm(s, "iny");
                        Asm(s,"lda ("+res.str+"),"+y);
                    }
                    else 
                        Asm(s,"lda "+res.str+"+1,"+y);

                    Asm(s,"sta "+val.prefix()+"+1");

                }

        }

    } 

    if (opcode==m_asmToOpcode["return"]) 
        Asm(s,"rts");
    if (opcode==m_asmToOpcode["rti"]) 
        Asm(s,"rti");
    if (opcode==m_asmToOpcode["decl"]) { 
        auto name = getNextParam(data,pos);
        auto value = getNextParam(data,pos);
        if (m_symtab[name.str].starts_with("ptr")) {
            s = name.str + "\t=\t"+ to_string(m_curZp);
            m_curZp+=2;

        }
        else     
            Label(s,name.str,m_typeTripeToNative[  m_opcodeToAsm[value.type]  ]  + "\t"+ "$"+value.str);
        m_symtab[name.str] = m_opcodeToAsm[value.type];
    }
/*    if (opcode==m_asmToOpcode["declptr"]) { 
        auto name = getNextParam(data,pos);
        auto value = getNextParam(data,pos);
        s = name.str + "\t=\t"+ to_string(m_curZp);
        m_symtab[name.str] = "uint16";
        m_curZp+=2;
    }
  */  
    return s;
}



vector<string> CPU6502::stub(map<string,string> params) {
    vector<string> src;
    string startAddress = "";
    string printAddress = "";

    bool print = false;
    int istart = 0;
    if (params.contains("start_address"))
        startAddress = params["start_address"];


    if (params.contains("sys"))
    if (params["sys"]=="c64") {
        if (startAddress=="") istart = m_foundStartPos;
        print = true;

        string s = Util::toDec(istart);
        for (auto c: s) {
            printAddress += "$"+Util::toHex(c) + ",";
        }
        // add missing spaces
        while (printAddress.size()<4)
            printAddress+="$20, ";
    }

    if (print) {
        src.push_back("\torg $801");
        src.push_back("\tdc.b $b, $8, $a, $0, $9e, $20,"+printAddress +" $0, $0, $0");
    }

    return src;
}
