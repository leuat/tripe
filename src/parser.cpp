#include "parser.h"
#include <fstream>
#include "util.h"

vector<uint8_t> Parser::Parse(string inFile) {

    ifstream inp(inFile); 
    string s;
    m_data.clear();
    cout << "Parsing"<<endl;
    while (getline(inp, s)) {
        s = Util::trim(s);
        if (s!="" && (s.find(";", 0) != 0)) 
           m_src.push_back(s);
    } 

    ParseText();

    return m_data;

}

void Parser::ParseText() {
    for (auto s : m_src) {
        vector<string> v;
        Util::split(s,' ',v);
        
    }
}

