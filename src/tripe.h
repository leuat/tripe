#ifndef TRIPE_H
#define TRIPE_H

#include <iostream>
#include <map>
#include <string>
#include <vector>

using namespace std;

class Tripe {
  public:
    vector<string> m_requireNextParam = {"i", "o", "arch", "sys"};
    vector<string> m_supportedArchitectures = {"mos6502", "tripe2trasm",
                                               "trasm2tripe", "amd64", "tropt"};
    vector<string> m_supportedSystems = {"c64"};

    Tripe(int argc, char *argv[]);

    void Execute();

  private:
    map<string, string> m_args;
    void RequireParameter(string p, string error);
};

#endif