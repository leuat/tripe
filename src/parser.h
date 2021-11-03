#ifndef PARSER_H
#define PARSER_H

#include <iostream>
#include <vector>
#include <string>
#include "abstractcpu.h"

using namespace std;

class Parser {
public:
    const char* m_id = "TRP";    
    vector<uint8_t> ParseText(string inFile); 
    vector<string> ParseBinary(string inFile, string arch); 
private:
    
    void ParseTextToBinary();
    void ParseBinary(AbstractCPU* op);

    void LoadBinary(string inFile);

    vector<string> m_src;
    vector<uint8_t> m_data;
};


#endif