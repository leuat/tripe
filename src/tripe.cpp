#include "tripe.h"
#include "error.h"
#include "util.h"
#include <filesystem>
#include "parser.h"


Tripe::Tripe(int argc, char *argv[]) {
    for (int i=1;i<argc;i++) {
        string arg1 = argv[i];
        if (arg1.find("-", 0) == 0) {
            arg1.erase(0,1);
            auto val="";
            if (contains(m_requireNextParam,arg1)) {
                if (i>=argc)
                    Error::RaiseError("-"+arg1 +" requires a parameter");
                val = argv[i+1];
                i++;
            }
            m_args[arg1] = val;
        }
    }
}


void Tripe::RequireParameter(string p, string error) {
    if (!m_args.contains(p))
        Error::RaiseError(error);
}


void Tripe::Execute() {
    RequireParameter("i","input file required (-i)");
    RequireParameter("o","output file required (-o)");
    RequireParameter("arch","architecture required (-arch)");
    string inFile = m_args["i"];    
    string outFile = m_args["o"];    
    string arch = m_args["arch"];
    if (!std::filesystem::exists(inFile)) 
        Error::RaiseError("Could not find input file: "+inFile);
    if (!contains(m_supportedArchitectures,arch))
        Error::RaiseError("Architecture '"+arch+"' not supported. ");
    Parser p;
    vector<uint8_t> data = p.Parse(inFile);



}
