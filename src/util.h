#ifndef UTIL_H
#define UTIL_H

#include <string>

using namespace std;

template <typename T>
bool contains(vector<T> vec, const T & elem)
{
    bool result = false;
    if( find(vec.begin(), vec.end(), elem) != vec.end() )
    {
        result = true;
    }
    return result;
}

class Util {
public:   

    static string trim(const std::string &s);
    static std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems);

};


#endif