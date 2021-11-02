#include "error.h"

void Error::RaiseError(string s) {
    cout << s;
    exit(1);
}
