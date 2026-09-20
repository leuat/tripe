#ifndef PHOPT6502_P
#define PHOPT6502_P

#include "phopt.h"

using namespace std;

class Phopt6502 : public Phopt {
public:

	vector<string> m_bops = {"adc", "sbc", "eor", "and", "or"};

	vector<string> optimize(vector<std::string> in) override; 
	void bop1(); 
	void ldasta();
	void ldaldxlda();
	void ldX(string v);

};



#endif

