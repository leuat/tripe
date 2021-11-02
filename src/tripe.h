#ifndef TRIPE_H 
#define TRIPE_H

#include <vector>
#include <map>
#include <string>
#include <iostream>

using namespace std;

class Tripe {
public:

    vector<string> m_requireNextParam = {"i","o","arch"};
    vector<string> m_supportedArchitectures = {"mos6502"};

    Tripe(int argc, char *argv[]);

    void Execute();

    
private:
    map<string,string> m_args;
    void RequireParameter(string p, string error);

};



#endif