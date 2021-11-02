#include <iostream>
#include "tripe.h"

void print_usage() {
    std::cout << "Usage: "<<std::endl;
    std::cout << " tripe -arch [ system ] -i [ in.trp ] -o [ out.asm ]  -params... "<<std::endl;
}


int main (int argc, char *argv[]) { 

    if (argc==1) {
        print_usage();
        return 0;
    }
    Tripe t(argc, argv);
    t.Execute();
    return 0;
} 