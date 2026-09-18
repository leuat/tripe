#ifndef TROPT_H
#define TROPT_H

#include <string>
#include <vector>
#include "cpu6502.h"

class Tropt {
private:
	CPU6502 m_cpu;
	vector<string> m_org, m_cur;
	string t = "\t";
public:
	std::vector<std::string> optimise(vector<string> input);

	std::vector<std::string> getLine(int i);

	void bops();
	void mov1();
	void load1();
	void load2();

	int m_noLines = 0;
};



#endif
