#ifndef UTIL_H
#define UTIL_H

#include <string>
#include <fstream>
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

    static vector<string> read_text_code_file(string f);

    static string toLower(string str) {
        transform(str.begin(), str.end(),str.begin(), ::tolower);
        return str;

    }

    static void save_binary(string file, const vector<uint8_t> data);
    static void save_text(string file, const vector<string> data);
    static vector<uint8_t> load_binary(string file);
    static int getIntLen(string type);
    static vector<uint8_t> ival2int8(string ival, string type);
    static string ival2string(vector<uint8_t>& data, int pos, string type);

    static void append_string(string s, vector<uint8_t>& data);


};


#endif