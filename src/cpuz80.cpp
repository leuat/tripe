#include "cpuz80.h"
#include "error.h"
#include "opcodes.h"
/*
#include "resources/div16_Z80.h"
#include "resources/div8_Z80.h"
#include "resources/mul16_Z80.h"
#include "resources/mul8_Z80.h"
*/
#include "tinyexpr.h"
#include "tripedata.h"
#include <algorithm>
using namespace tripe;
namespace tripe {

CPUZ80::CPUZ80() : AbstractCPU() {
    //    AbstractCPU();
    Init(Data::d.opcodes);
    m_symtab.clear();
    m_hexprefix = "$";
    m_typeTripeToNative["uint8"] = "dc.b";
    m_typeTripeToNative["uint16"] = "dc.w";
    m_typeTripeToNative["int8"] = "dc.b";
    m_typeTripeToNative["int16"] = "dc.w";

    m_typeTripeToNative["add"] = "adc";
    m_typeTripeToNative["sub"] = "sbc";
    m_typeTripeToNative["or"] = "or";
    m_typeTripeToNative["and"] = "and";
    m_typeTripeToNative["xor"] = "xor";

    /*
        m_typeTripeToNative["bne"] = "bne";
        m_typeTripeToNative["beq"] = "beq";
        m_typeTripeToNative["bgtu"] = "bcc";
        m_typeTripeToNative["bltu"] = "bcs";
        */
    m_typeTripeToNative["shr"] = "lsr";
    m_typeTripeToNative["shl"] = "asl";

    m_typeTripeToNative["jump"] = "jp";
    m_typeTripeToNative["call"] = "call";
    m_typeTripeToNative["fcall"] = "jsr";

    m_typeTripeToNative["return"] = "ret";
    m_typeTripeToNative["rti"] = "reti";

/*
    m_code["mul8"] = insertWhZp(string((char *)resources_Z80_mul8_asm));
    m_code["div8"] = insertWhZp(string((char *)resources_Z80_div8_asm));
    m_code["mul16"] = insertWhZp(string((char *)resources_Z80_mul16_asm));
    m_code["div16"] = insertWhZp(string((char *)resources_Z80_div16_asm));
    */
}


void CPUZ80::InsertTempValues(vector<string> &lst, int pos) {
    for (auto s : m_registersUsed) {
        /*
        lst.insert(lst.begin() + pos, s + " = " + "$" + Util::toHex(m_regZp));
        verifyZp(s, "$" + Util::toHex(m_regZp));
        pos += 1;
        m_regZp += m_symtab[s] == "uint8" ? 1 : 2;
        */
    }
}

string CPUZ80::loadIndex(string &s, Param &idx, string type) {
    string xy = "x";
    if (type.starts_with("ptr"))
        xy = "y";
    if (type.starts_with("address"))
        xy = "x";
    if (Util::isPureNumber(idx.str) && xy == "x") {
        if (type == "ptr16" || type == "uint16") {
            int error = 0;
            // Evaluate argument.
            int ival = te_interp((idx.str + "*2").data(), &error);
            idx.str = std::to_string(ival);
        } else
            idx.str = "$" + idx.str;
        return xy;
    }

    if (type == "ptr16" || type == "uint16") {
        /*
        Asm("lda " + idx.prefix());
        Asm("asl");
        Asm("ta" + xy);
        */
    } //else
       // Asm("ld" + xy + " " + idx.prefix());
    return xy;
}

/*
string CPUZ80::ParseFromBinary(vector<uint8_t>& data, int& pos) {
}
*/

vector<string> CPUZ80::stub(map<string, string> params) {
    vector<string> src;
    string startAddress = "";
    string printAddress = "";

    bool print = false;
    int istart = 0;
    if (params.contains("start_address"))
        startAddress = params["start_address"];

    string basicStart = "$801";

    if (params.contains("sys"))
        if (params["sys"] == "c64" || params["sys"] == "vic20") {
            if (startAddress == "")
                istart = m_foundStartPos;
            print = true;

            if (params["sys"] == "vic20") {
                basicStart = "$" + Util::toHex(m_foundStartPos - 15);
                if (m_foundStartPos == 0x2000)
                    basicStart = "$1201";
            }

            string s = Util::toDec(istart);
            for (auto c : s) {
                printAddress += "$" + Util::toHex(c) + ",";
            }
            // add missing spaces
            while (printAddress.size() < 4)
                printAddress += "$20, ";
        }

    if (print) {
        src.push_back("\torg " + basicStart);
        src.push_back("\tdc.b $b, $8, $a, $0, $9e, $20," + printAddress + " $0, $0, $0");
    }

    return src;
}

void CPUZ80::LoadStore(int &pos, int opcode) {
    string s = "";
    auto res = getNextParam(m_data, pos);
    auto idx = getNextParam(m_data, pos);
    auto val = getNextParam(m_data, pos);
    if (isPointer(res))
        Asm("ld hl,"+res.z80());
    else
        Asm("ld hl,"+res.clean());

    if (is16bit(idx)) {
        Asm("ld de,"+idx.z80());
    }
    else {
        Asm("ld a,"+idx.z80());
        Asm("ld e,a");
        Asm("ld d,0");

    }
    Asm("Add hl,de");
    if (opcode == m_asmToOpcode["store"]) {
        if (!is16bitArray(res)) {
            Asm("ld a,"+val.z80());
            Asm("ld [hl],a");
        }
        else {
            Asm("ld a,"+val.z80lo());
            Asm("ld [hl],a");
            Asm("inc hl");
            Asm("ld a,"+val.z80hi());
            Asm("ld e,a");
            Asm("ld [hl],a");
        }
    }
    if (opcode == m_asmToOpcode["load"]) {
        if (!is16bitArray(res)) {
            Asm("ld a,[hl]");
            Asm("ld "+val.z80()+",a");
        }
        else {
            Asm("ld [hl],a");
            Asm("ld "+val.z80lo());
            Asm("inc hl");
            Asm("ld [hl],a");
            Asm("ld "+val.z80hi());
        }
    }
}

void CPUZ80::Const(int &pos) {
    auto name = getNextParam(m_data, pos);
    auto value = getNextParam(m_data, pos);
    Asm(name.str + " = " + m_hexprefix + Util::toHex(value.ival));
    m_symtab[name.str] = m_opcodeToAsm[value.type];
}

void CPUZ80::Declare(int &pos) {
    auto name = getNextParam(m_data, pos);
    auto value = getNextParam(m_data, pos);
    /*
        cout << "DECLARE '";
        cout << name.str << "'   '" << value.str
             << "'   is_string: " << std::to_string(value.flag) << " at pos "
             << Util::toHex(pos) << endl;
             */
    bool isString = value.flag == Opcodes::DATATYPE_STRING;
    string hex = m_hexprefix;
    if (isString)
        hex = "";

/*    if (isRegister(name.str)) {
        m_symtab[name.str] = m_opcodeToAsm[value.type];
        return;
    }*/
    if (m_opcodeToAsm[value.type].starts_with("address")) {
        Asm(name.str + "\t=\t" + hex + value.str);
//        verifyZp(name.str, hex + value.str);

    } else if (m_symtab[name.str].starts_with("ptr")) {
        Label(name.str, m_typeTripeToNative["uint16"] + "\t" + hex + value.str);
  //      verifyZp(name.str, hex + Util::toHex(m_ptrZp));
 
    } else {
        Label(name.str, m_typeTripeToNative[m_opcodeToAsm[value.type]] + "\t" + hex + value.str);
    }
    if (m_decltab.contains(name.str)) {
        Error::RaiseError("Z80 codegen: symbol '" + name.str + "' already defined");
    }
    m_decltab[name.str] = name.str;
    m_symtab[name.str] = m_opcodeToAsm[value.type];
}

void CPUZ80::Mulu(int &pos) {
    auto ret = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);

}

void CPUZ80::Divu(int &pos) {
    auto ret = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);
}



void CPUZ80::Binop(int &pos, int opcode) {
    auto res = getNextParam(m_data, pos);
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);

   string op = m_typeTripeToNative[m_opcodeToAsm[opcode]];
    bool isAdc = op=="adc" || op=="sbc";    
    if (!is16bit(b) && !is16bit(res) && !(is16bit(a))) {
        Asm("ld a,"+a.z80());
        if (b.isPureNumber()) {
            if (isAdc)
                Asm(op + " a,"+b.z80());
            else
                Asm(op + " "+b.z80());
        }
        else {
            Asm("ld b,a");
            Asm("ld a,"+b.z80());
            if (isAdc)
               Asm(op + " a,b");
           else
               Asm(op + " b");
            
        }
        Asm("ld "+res.z80()+",a");

    }



    if (!is16bit(res)) {
    }

}

void CPUZ80::Mov(int &pos) {
    auto res = getNextParam(m_data, pos);
    auto val = getNextParam(m_data, pos);


//    cout << res.str << " " << is16bit(res)<< " " << res.typeName<<endl;
    if (!is16bit(res) && !is16bit(val)) {
        Asm("ld a,"+val.z80());
        Asm("ld "+res.z80()+",a");
    }
    if (is16bit(res) && is16bit(val)) {
        Asm("ld hl,"+val.z80()+"");
        Asm("ld "+res.z80()+",hl");
    }
    if (is16bit(res) && !is16bit(val)) {
        Asm("ld a,"+val.z80());
        Asm("ld l,a");
        Asm("ld h,0");
        Asm("ld "+res.z80()+",hl");
    }
    if (!is16bit(res) && is16bit(val)) {
        Asm("ld hl,"+val.z80());
        Asm("ld a,h");
        Asm("ld "+res.z80()+",a");
    }


}

bool CPUZ80::printCmp(const string &val) {
    if (!(val == "#0" || val == "#$0" || val == "#$00" || val == "#00"))
        return true;

    return true;
}

void CPUZ80::Branch(int &pos, int opcode) {
    auto a = getNextParam(m_data, pos);
    auto b = getNextParam(m_data, pos);
    auto lbl = getNextParam(m_data, pos);

}

int CPUZ80::estimateCodeSize(const string &s) {
    //    std::cout << s << endl;
    //   std::cout << " 1 " << s << endl;
    if (Util::trim(s) == "")
        return 0; // nada
    if (!s.starts_with("\t"))
        return 0;
    if (Util::trim(s).starts_with(";"))
        return 0; // comment
    if (s.find("=") != string::npos)
        return 0; // const

    string v = Util::ReplaceString(s, "\t", " ");
    v = Util::ReplaceString(v, "  ", " ");
    vector<string> lst;
    lst = Util::split(v, ';', lst);
    v = lst[0]; // remove end comments
    lst.clear();
    lst = Util::split(v, ' ', lst);

    vector<string> lst2;
    for (auto &c : lst)
        if (c != "")
            lst2.push_back(c);
    lst = lst2;

    int size = 0;
    //    cout << " ****** OK " << lst.size() << " : " << endl;
    // for (auto s : lst)
    //   cout << "'" << s << "'" << endl;

    if (lst.size() == 1)
        size = 1; // single byte op

    if (lst.size() >= 2) {
        string p = lst[1];
        vector<string> ps;

        ps = Util::split(p, ',', ps);
        p = ps[0]; // pick first one, ignore ",x" etc
        if (p.starts_with("#")) {
            size = 2; // const
        } else
            size = 3; // address
    }
    //    cout << " - " << s << " : " << size << "  list size: " << lst.size()
    //       << endl;
    //   for (auto c : lst)
    //      cout << "  *** " << c << endl;
    //  std::cout << " 3 " << endl;
    return size;
}
} // namespace tripe