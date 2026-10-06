#ifndef ERROR_H
#define ERROR_H

#include <iostream>
#include <string>

using namespace std;

namespace tripe {

class Error {
  public:
    static int s_lineNumber;
    static string s_curLine;
    static void RaiseError(string s);
};

} // namespace tripe
#endif