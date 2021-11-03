#ifndef PARSER_H
#define PARSER_H

#include <iostream>
#include <vector>
#include <string>

using namespace std;

class Parser {
public:
    
    vector<uint8_t> ParseText(string inFile); 
    vector<string> ParseBinary(string inFile); 
private:
    
    void ParseTextToBinary();
    void ParseBinaryToText();
    vector<string> m_src;
    vector<uint8_t> m_data;
};


#endif