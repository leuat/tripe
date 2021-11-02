#ifndef ERROR_H
#define ERROR_H

#include <iostream>
#include <string>

using namespace std;


class Error {
public:
    static void RaiseError(string s);
};


#endif