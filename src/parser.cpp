#include "parser.h"
#include <fstream>
#include "util.h"
#include "opcodes.h"
#include "error.h"

vector<uint8_t> Parser::ParseText(string inFile) {

    m_data.clear();
    m_src = Util::read_text_code_file(inFile);

    ParseTextToBinary();

    return m_data;

}

vector<string> Parser::ParseBinary(string inFile) {

    m_data = Util::load_binary(inFile);
    m_src.clear();
    ParseBinaryToText();

    return m_src;
}



void Parser::ParseTextToBinary() {
    Opcodes op;
    int ln=0;
    for (auto s : m_src) {
        Error::s_curLine = s;
        Error::s_lineNumber = ln++;
        vector<string> v;
        Util::split(s,' ',v);
        op.ParseToBinary(v,m_data);
    }
}

void Parser::ParseBinaryToText() {
    Opcodes op;
    int ln=0;
    int pos = 0;
    while (pos<m_data.size()) {
        m_src.push_back(op.ParseFromBinary(m_data, pos));
    }
}
