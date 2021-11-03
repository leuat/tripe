#ifndef ERROR_H
#define ERROR_H

#include <iostream>
#include <string>

using namespace std;


class Error {
public:
    static int s_lineNumber;
    static string s_curLine;
    static void RaiseError(string s);
};


#endif