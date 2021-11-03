#include "error.h"

int Error::s_lineNumber = 0;
string Error::s_curLine = "";

void Error::RaiseError(string s) {
    cout << "Fatal error on line "<<s_lineNumber<<endl;
    cout << "'"<<s_curLine <<"'"<<endl;
    cout << "Error message: ";
    cout << s << endl;

    exit(1);
}
