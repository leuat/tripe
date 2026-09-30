#include "opcodes.h"
#include "error.h"
#include "util.h"
#include <sstream>

void Opcodes::ParseToBinary(vector<string> &line, vector<uint8_t> &data) {
    uint8_t opcode = m_asmToOpcode[line[0]];
    if (opcode == 0) {
        Error::RaiseError("Incorrect opcode on line : " + line[0]);
    }
    vector<string> &p = m_opcodeToParams[opcode];
    bool isMulU = opcode == m_asmToOpcode["mulu"];
    bool isDivU = opcode == m_asmToOpcode["divu"];

    data.push_back(opcode);

    if (line[0] == ".asm") {
        m_inRawAsm = true;
        return;
    }

    int opCodePos = data.size() - 1;
    int i = 0;
    for (auto s : p) {
        if (s == "0")
            break;
        vector<uint8_t> d;
        i++;
        while (line[i] == "")
            i++;

        if (i >= line.size())
            Error::RaiseError("Incorrect number of parameters");

        if (s == "datastream") {
            string type = line[0];
            uint16_t cnt = 0;
            vector<uint8_t> d;
            stringstream ss;
            bool is16bit = (type == ".uint16");
            while (i < line.size()) {
                auto val = Util::trim(line[i]);
                bool isHex = false;
                if (val.starts_with("0x")) {
                    isHex = true;
                }
                uint8_t flag = DATATYPE_NUMBER;
                if (val != "") {
                    int ival = 0;
                    ss.clear();
                    if (isHex)
                        ss << std::hex << val;
                    else
                        ss << std::dec << val;
                    ss >> ival;
                    if (ss.fail()) {
                        flag = DATATYPE_STRING;
                        //                        cout << " FAIL '" << val << "'
                        //                        " << ival << endl;
                    }
                    // else
                    //     cout << "OK '" << val << "'  " << ival << endl;
                    d.push_back(flag);
                    if (flag == DATATYPE_NUMBER) {
                        d.push_back(ival & 0xFF);
                        if (is16bit)
                            d.push_back((ival >> 8) & 0xFF);
                    } else {
                        // String
                        for (auto c : val) {
                            d.push_back((uint8_t)c);
                        }
                        d.push_back((uint8_t)0);
                    }

                    cnt++;
                }
                i++;
            }
            if (cnt >= 256)
                Error::RaiseError(
                    "Error: cannot have more than 255 elements per line");

            d.insert(d.begin(), (uint16_t)(cnt >> 8) & 0xff);
            d.insert(d.begin(), (uint16_t)(cnt & 0xff));

            for (auto b : d) {
                data.push_back(b);
            }
        }

        if (s == "ival" || s == "p") {
            vector<string> v;

            if (s == "p" && line[i].find(":", 0) == std::string::npos &&
                line[i].find(":", 0)) {
                // Is a variable: Print out the full name
                Util::append_string(Util::trim(line[i]), d);
            } else {

                Util::split(line[i], ':', v);
                if (v.size() == 1)
                    v.push_back("0"); // default value 0
                if (v.size() != 2)
                    Error::RaiseError(
                        "ival type must be of format uint8:[number]");

                auto a = v[0];

                //              replace( a.begin(), a.end(), '*', ' ');
                a = Util::trim(a);
                //                cout << a <<" " << v[0] <<" "<< v[1]<<endl;
                if (!m_asmToOpcode.contains(a))
                    Error::RaiseError("Unknown type: " + a);

                d = Util::ival2int8(v[1], v[0]);

                // replace mulu power of 2 with shl, also for div but only in
                // the correct placement
                if (isMulU || (isDivU && i == 3)) {
                    int j = d[0];
                    //                    if (isDivU)
                    /*                    for (auto l : line)
                                            std::cout << l;
                                        std::cout << endl;
                                        cout << isDivU << " : " << i << " : " <<
                       j << endl;*/
                    int val = -1;
                    if (j == 1)
                        val = 0;
                    if (j == 2)
                        val = 1;
                    if (j == 4)
                        val = 2;
                    if (j == 8)
                        val = 3;
                    if (j == 16)
                        val = 4;
                    if (j == 32)
                        val = 5;
                    if (j == 64)
                        val = 6;
                    if (j == 128)
                        val = 7;
                    if (j == 256)
                        val = 8;
                    if (val != -1) {
                        //                        std::cout <<
                        //                        (int)data[opCodePos] << " "
                        //                        <<(int)opcode << std::endl;
                        d[0] = val;
                        data[opCodePos] =
                            (uint8_t)m_asmToOpcode[isMulU ? "shl" : "shr"];
                        //                        std::cout << "REPLACE MUL WITH
                        //                        SHL " <<
                        //                        (int)m_asmToOpcode["shl"] << "
                        //                        a:" <<a<< std::endl;
                    }
                }
                // cout << "length : "<<a << "   " <<d.size() << " "
                // <<std::to_string(d[0]) << " " <<d[1]<< endl;

                d.insert(d.begin(), m_asmToOpcode[a]);
            }
            for (auto b : d) {
                data.push_back(b);
            }
        }
        //      cout << s<< ", ";
    }
    //    cout <<endl;
}
string Opcodes::ParseFromBinary(int &pos) {
    return "";
    /*
    cout <<" A AARGH * "<<endl;
    string s = "";
    uint8_t opcode = data[pos];
    s = m_opcodeToAsm[opcode];
    pos+=1;
    cout << " CRASH" << endl;
    exit(1);
    std::cout << "ORG opcode : " << s <<  " " << (int)opcode <<std::endl;
    if (s==".asm") {
        s+="\n";
        while (data[pos]!=m_asmToOpcode[".endasm"]) {
            s+=data[pos++];
        }
        s+="\n.endasm\n";
        pos++;
        std::cout << "Found ASM : "<<s << std::endl;
        return s;
    }


    vector<string>& p = m_opcodeToParams[opcode];
  //  cout << "*** CUR "<<s << endl;
    for (auto str:p) {
        if (str=="0") break;
        uint8_t v = data[pos];

        if (str=="datastream") {
            pos++;
            int cnt = (data[pos]) | (data[pos+1]<<8);
            pos+=2;
//            cout << "Recreate: "<<s <<to_string(cnt);
            for (int i=0;i<cnt;i++) {
                s+=m_hexprefix+Util::toHex(data[pos++]) + " ";
            }
        }
        std::cout << s << endl;

        if (m_opcodeToAsm.contains(v) && v>0xF0) {
            // We have a const type int64 etc
            pos+=1;
            s+=" " +
m_opcodeToAsm[v]+":0x"+Util::ival2string(data,pos,m_opcodeToAsm[v]);
            pos+=Util::getIntLen(m_opcodeToAsm[v]);
        }
        else // Some text
        {
            s+=" ";
            while (data[pos]!=0) {
                s+=data[pos++];
            }
            pos++;
        }

    }
    if (s.find(".",0)!=0)
        s = "\t"+s;
    return s;*/
}
