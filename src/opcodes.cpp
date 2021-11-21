#include "opcodes.h"
#include "util.h"
#include <sstream>
#include "error.h"


void Opcodes::ParseToBinary(vector<string>& line,vector<uint8_t>& data) {
    uint8_t opcode = m_asmToOpcode[line[0]];
    if (opcode==0) {
        Error::RaiseError("Incorrect opcode on line : "+line[0]);
    }
    data.push_back(opcode);
    vector<string>& p = m_opcodeToParams[opcode];

    if (line[0]==".asm") {
        m_inRawAsm = true;
        return;
    }


    int i=0;
    for (auto s:p) {
        if (s=="0") break;
//        cout << s<< ":";
        vector<uint8_t> d;            
        i++;
        while (line[i]=="")
            i++;
        
        if (i>=line.size())
            Error::RaiseError("Incorrect number of parameters");

        if (s=="datastream") {
//            cout  << line[0]<<"DATASTREAM!"<<line[i]<<endl;
//            string type = line[0];
  //          type.erase(type.begin(),type.begin()+1);
            int cnt = 0;
            vector<uint8_t> d;
            while (i<line.size()) {
                auto val = Util::trim(line[i]);
                if (val!="") {
                    int ival = 0;
                    stringstream (val) >>hex>>ival;
                    d.push_back(ival);
                    cnt++;
                }
                i++;
            }
            if (cnt>=256)
                Error::RaiseError("Error: cannot have more than 255 elements per line");

            d.insert(d.begin() ,(uint8_t)cnt);

            for (auto b:d) {
                data.push_back(b);
            }

        }


        if (s=="ival" || s=="p")  {
            vector<string> v;

            if (s=="p" && line[i].find(":",0)==std::string::npos && line[i].find(":",0)) {
                // Is a variable: Print out the full name
                Util::append_string(Util::trim(line[i]),d);
            }
            else {

                Util::split(line[i],':',v);
                if (v.size()==1)
                    v.push_back("0"); // default value 0
                if (v.size()!=2) 
                    Error::RaiseError("ival type must be of format uint8:[number]");
    
                auto a = v[0];

  //              replace( a.begin(), a.end(), '*', ' ');
                a=Util::trim(a); 
                cout << a <<" " << v[0] <<" "<< v[1]<<endl;
                if (!m_asmToOpcode.contains(a))
                    Error::RaiseError("Unknown type: " +a);
                
                d = Util::ival2int8(v[1],v[0]);
                cout << "length : "<<d.size() << endl;
                d.insert(d.begin() ,m_asmToOpcode[a]);
            }
            for (auto b:d) {
                data.push_back(b);
            }
        }
  //      cout << s<< ", ";
    }
//    cout <<endl;
}
string Opcodes::ParseFromBinary(vector<uint8_t>& data, int& pos) {
    string s = "";
    uint8_t opcode = data[pos];
    s = m_opcodeToAsm[opcode];
    pos+=1;

    if (s==".asm") {
        s+="\n";
        while (data[pos]!=m_asmToOpcode[".endasm"]) {
            s+=data[pos++];
        }
        s+="\n.endasm\n";
        pos++;
        return s;
    }


    vector<string>& p = m_opcodeToParams[opcode];
  //  cout << "*** CUR "<<s << endl;
    for (auto str:p) {
        if (str=="0") break;
        uint8_t v = data[pos];
   
        if (str=="datastream") {
            pos++;
            int cnt = data[pos++];
//            cout << "Recreate: "<<s <<to_string(cnt);
            for (int i=0;i<cnt;i++) {
                s+=m_hexprefix+Util::toHex(data[pos++]) + " ";
            }          
        }

        if (m_opcodeToAsm.contains(v) && v>0xF0) {
            // We have a const type int64 etc
            pos+=1;
            s+=" " + m_opcodeToAsm[v]+":0x"+Util::ival2string(data,pos,m_opcodeToAsm[v]);
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
    return s;
}


