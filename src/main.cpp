#include "tripe.h"
#include <iostream>

using namespace std;
using namespace tripe;

void print_usage() {
    cout << "Usage: " << endl;
    cout << " tripe -arch [ system ] -i [ in.trp ] -o [ out.asm ]  -params... " << endl;
    cout << endl;
    cout << " -arch mos6502 : compiles a tripe .trp binary file to a 6502 binary" << endl;
    cout << " -arch trasm2tripe : compiles a .trasm text assembly file to a "
            ".tripe binary file"
         << endl;
    cout << " -arch tropt : optimises a .trasm text assembly file" << endl;
    cout << endl;
    cout << "optional parameters:" << endl;
    cout << " -sys [c64, vic20] : adds loading stub for the current system" << endl;
    cout << " -c : performs a full compile and optimization for the current "
            "system"
         << endl;
    cout << " -a : combined with -c, will assemble the out target platform .asm to binary .prg" << endl;
    cout << " -sym : ouputs symbols when assembling with -c"<<endl;
    cout << " -start_address $1000 : custom start address for the system" << endl;
    cout << " -ptr_zp 0x40 : custom start of pointer zp (6052 only, default 0x02)" << endl;
    cout << " -wh_zp 0x40 : custom start of workhorse zp (6052 only, default 0x40)" << endl;
    cout << " -reg_zp 0x40 : custom start of register zp (6052 only, default 0x80)" <<endl;
    cout << "\nGuts"<<endl;
    cout << " -guts will execute a 6502 code until brk is called, and dump memory to disk. "<<endl;
    cout << " -exit_mem will set the return value of Tripe to the value located in the given memory address " << endl;
    cout << " -guts_ouput will output all instructions the cpu is executing"<<endl;
    cout << "example: tripe -arch mos6502 -guts -i file.prg -exit_mem 0x8000" << endl;
}

int main(int argc, char *argv[]) {

    if (argc == 1) {
        print_usage();
        return 0;
    }
    Tripe t(argc, argv);
    t.Execute();
    return 0;
}