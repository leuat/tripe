#include "phopt6502.h"

vector<string> Phopt6502::optimize(vector<string> in) { 

	m_src = in;
	m_curLine = 0;
	ldasta();

	m_curLine = 0;
//	bop1();
	ldaldxlda();

	m_curLine = 0;
	ldX("y");
	m_curLine = 0;
	ldX("x");

	return m_src;

}

void Phopt6502::ldX(string cmd) {
	string curVal = "";
	bool isDone = false;
	vector<string> src{};
	string tax = "ta"+cmd;
	string inx = "in"+cmd;
	string dex = "de"+cmd;
	cmd = "ld"+cmd;
	m_curLine = 0;
	for (int i=0;i<m_src.size();i++) {
		
		string l1="";
		auto line1 = getLine(i);
		bool remove = false;
		if (line1.size()!=0) {
			auto op1 = Util::toLower(line1[0]);
			if (curVal!="")
			if (op1.find(":") != std::string::npos || op1==tax || op1=="jmp" || op1=="bne" || op1=="beq" || op1==dex || op1==inx) {
		//		cout << "Reset "<<curVal<< " " << op1<<endl;				
				curVal = "";
//				src.push_back("; reset "+cmd + "  " + op1);				
			}

			if (op1==cmd) {
				if (curVal!=line1[1]) {
					curVal = line1[1];
				}
				else  {
					src.push_back(" ; opt5 "+l1);
					remove=true;
					cout << "uuh "<<l1<<endl;
					//src.push_back(" "+cmd+" "+curVal);
				}

			}
				
		}
		if (!remove)
			src.push_back(m_src[i]);
	}

	m_src = src;

}
void Phopt6502::ldaldxlda() {
	/*
	sta varPrefixed_c
	ldy i
	lda varPrefixed_c
*/
	bool isDone = false;
	vector<string> src;
	while (!isDone) {
		int cur = m_curLine;
		string l1="", l2="", l3="";
		auto line1 = getNextLine(l1);
		auto line2 = getNextLine(l2);
		auto line3 = getNextLine(l3);
		if (line2.size()!=0 && line3.size()!=0 && line1.size()!=0) {

			auto op1 = Util::toLower(line1[0]);
			auto op2 = Util::toLower(line2[0]);
			auto op3 = Util::toLower(line3[0]);
			if (line1[0]=="sta" && line3[0]=="lda" && line1[1]==line3[1]){
				if (line2[0]=="ldy" || line2[0]=="ldx") {
					src.push_back(";opt4");
					if (!line1[1].starts_with("t_"))
						src.push_back(l1);
					src.push_back(l2);
					cur+=3;
				}
			}
		}
		m_curLine = cur;
		if (m_curLine<m_src.size())
			src.push_back(m_src[m_curLine++]);
		if (m_curLine>=m_src.size()) {
			isDone = true;
			continue;
		}
	}
	m_src = src;

}

void Phopt6502::ldasta() { 
	bool isDone = false;
	vector<string> src;
	/*
	sta t_uint8_3
	lda t_uint8_3

	*/
	while (!isDone) {
		int cur = m_curLine;
		string l1="", l2="";
	//	cout << "l0" <<endl;
		auto line1 = getNextLine(l1);
	//	cout << "l1:" <<l1 << endl;
		auto line2 = getNextLine(l2);
	//	cout << "l2:" <<l2 << line2.size() << endl;
		if (line2.size()!=0 && line1.size()!=0) {

			auto op1 = Util::toLower(line1[0]);
			auto op2 = Util::toLower(line2[0]);
	//		std::cout <<Util::toLower(line1[0])  << " " <<Util::toLower(line2[0]) << endl;
			if (op1=="sta" && (op2.starts_with("ld"))) {
				char cmd = op2.at(2);
//				cout << cmd << endl;
				if (line2[1]==line1[1]) {
					if (cmd=='a') {
						if (line1[1].starts_with("t_")) {
							cur+=2;
							src.push_back("; stalda opt 1");
						}
						else {
							src.push_back(l1);
							src.push_back("; stalda opt 2");
							cur+=2;

						}
					}
					else {
						src.push_back("; stalda opt3 ");
						if (cmd=='x')
							src.push_back("\ttax");
						else
							src.push_back("\ttay");
						cur+=2;
						if (!line1[1].starts_with("t_")) {
							src.push_back(l1);
						}

					}
				}
			}
		}
		m_curLine = cur;
		if (m_curLine<m_src.size())
			src.push_back(m_src[m_curLine]);
		m_curLine++;
		if (m_curLine>=m_src.size()) {
			isDone = true;
			continue;
		}
	}
	m_src = src;
}

void Phopt6502::bop1() { 
/*
	; here
	ldx c2x
	lda sin,x
	sta t_uint8_load1

	; here
	ldx c2y
	lda sin,x
	sta t_uint8_load2

	lda t_uint8_load1
	clc
	adc t_uint8_load2
	sta t_uint8_2
*/
	return;
	/*
	bool isDone = false;
	while (!isDone) {
		auto s = getNextLine();
		cout << s  <<endl;
		if (s=="") {
			isDone = true;
			continue;
		}
	}
	*/
}