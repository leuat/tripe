#include "parser.h"
#include <fstream>
#include "util.h"
#include "opcodes.h"
#include "cpu6502.h"
#include "error.h"

vector<uint8_t> Parser::ParseText(string inFile) {
    m_data.clear();
    m_src = Util::read_text_code_file(inFile);

    ParseTextToBinary();

    return m_data;

}

void Parser::LoadBinary(string inFile) {
    m_data = Util::load_binary(inFile);

    string id = "";
    id+=m_data[0];
    id+=m_data[1];
    id+=m_data[2];
    if (id!=m_id) {
        Error::RaiseError("'"+inFile+"' not a binary Tripe file.");
    }
    m_data.erase(m_data.begin(),m_data.begin()+3);
    m_src.clear();

}
vector<string> Parser::ParseBinary(string inFile, string arch) {
    LoadBinary(inFile);

    AbstractCPU* cpu = NULL;
    if (arch=="tripe2trasm")
        cpu = new Opcodes();        
    if (arch=="mos6502")
        cpu = new CPU6502();        

    if (cpu == NULL)
        Error::RaiseError("ParseBinary error: unrecognized architecture "+arch);


    ParseBinary(cpu);

    return m_src;

}



void Parser::ParseTextToBinary() {

    Opcodes op;
    m_data.push_back(m_id[0]);
    m_data.push_back(m_id[1]);
    m_data.push_back(m_id[2]);
    int ln=0;
    for (auto s : m_src) {
        s = Util::ReplaceString(s, "$", "0x"); // replace all 'x' to 'y'
        s = Util::ReplaceString(s, "\t", " "); // replace all 'x' to 'y'
        s = Util::ReplaceString(s, "  ", " "); // replace all 'x' to 'y'
        vector<string> str;
        Util::split(s,';',str);
        s = str[0];
        Error::s_curLine = s;
        Error::s_lineNumber = ln++;
        vector<string> v;
//        cout << s << endl;
        Util::split(s,' ',v);
        op.ParseToBinary(v,m_data);
    }
}

void Parser::ParseBinary(AbstractCPU* op) {
    int ln=0;
    int pos = 0;
    while (pos<m_data.size()) {
        string s = op->ParseFromBinary(m_data, pos);
        if (s!="")
            m_src.push_back(s);
        if (m_src.size()!=0)
        if (m_src.back().find(".",0)==0) {
            m_src.insert(m_src.end()-1,"");
        }
    }
}
