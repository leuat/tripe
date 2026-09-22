#include <iostream>
#include "tropt.h"

using namespace std;

void Tropt::bops() {

	vector<string> bp = {"and","add","or","xor","sub"};

	vector<string> n;
	//add 	t_uint8_2	j	uint8:0x01
	//mov j t_uint8_2


	for (int i=0;i<m_cur.size();i++) {
		auto l0 = getLine(i);
		auto l1 = getLine(i+1);
		auto cur = m_cur[i];
		if (find(bp.begin(), bp.end(), l0[0]) != bp.end()) {
			if (l0.size()==4 && l1.size()==3)
			if (l1.size()>=2 && l0.size()>=1 && l1[0]=="mov")
//				cout << "Potential: " <<m_cur[i] << endl; 
				if (l0[1]==l1[2] && l0[1].starts_with("t_")) {
					// Perform replace
					cur = t + l0[0] + t +l1[1] + t + l0[2] + t + l0[3];
					/*
					cout << m_cur[i] << endl;
					cout << m_cur[i+1] << endl;
					cout << "replace with : " << cur << endl << endl;
					*/
					m_noLines++;
					i+=1;

				}		
		}
		n.push_back(cur);
	}

	m_cur = n;

}

void Tropt::mov1() {

//	vector<string> bp = {"and","add","or","xor","sub"};

	vector<string> n;
	//mov t_uint8_ld1 i
	//mov t_uint8_idx1 t_uint8_ld1

	//;load_p ptr t_uint8_idx1 t_uint8_ret1
	//;mov	 k t_uint8_ret1


	for (int i=0;i<m_cur.size();i++) {
		auto l0 = getLine(i);
		auto l1 = getLine(i+1);
		auto cur = m_cur[i];
		if (l0.size()==3 && l1.size()==3)
		if (l0[0]=="mov" && l1[0]=="mov") {
			if (l0[1]==l1[2] && l0[1].starts_with("t_")) {
					// Perform replace
					cur = t + l0[0] + t +l1[1] + t + l0[2];
//					cout << "replace with : " << cur << endl <<endl;
					i+=1;
					m_noLines++;

				}		
		}
		n.push_back(cur);
	}

	m_cur = n;

}


void Tropt::load1() {


	vector<string> n;
//	load_p t t_uint8_idx1 t_uint8_ret1
//	mov	 k t_uint8_ret1

	for (int i=0;i<m_cur.size();i++) {
		auto l0 = getLine(i);
		auto l1 = getLine(i+1);
		auto cur = m_cur[i];
		if (l0.size()==4 && l1.size()==3)
		if ((l0[0]=="load_p" || l0[0]=="load") && l1[0]=="mov") {
			if (l0[3]==l1[2] && l0[3].starts_with("t_")) {
					// Perform replace
					cur = t + l0[0] + t +l0[1] + t + l0[2] + t + l1[1];
//					cout << "replace with : " << cur << endl <<endl;
					m_noLines++;
					i+=1;

				}		
		}
		n.push_back(cur);
	}

	m_cur = n;

}

// Typical index loading
void Tropt::load2() {

	vector<string> n;
//	mov	t_uint8_idx2	uint8:0x00
//	load_p Screen_p1 t_uint8_idx2 t_uint8_ret1

	for (int i=0;i<m_cur.size();i++) {
		auto l0 = getLine(i);
		auto l1 = getLine(i+1);
		auto cur = m_cur[i];
		if (l0.size()==3 && l1.size()==4)
		if ((l1[0]=="load_p" || l1[0]=="load") && l0[0]=="mov") {
			if (l0[1]==l1[2] && l0[1].starts_with("t_")) {

					// Perform replace
					cur = t + l1[0] + t +l1[1] + t + l0[2] + t + l1[3];
//					cout << "replace with : " << cur << endl <<endl;
					m_noLines++;
					i+=1;

				}		
		}
		n.push_back(cur);
	}

	m_cur = n;

}

vector<string> Tropt::optimise(vector<string> input) {
	m_cpu.Init("");
	m_org = input;
	m_cur = m_org;

//	return m_cur;
	bops();
	mov1();
	load1();
	load2();

//	for (auto s : m_cur)
//		std::cout << s << endl;

	return m_cur;
}

vector<string> Tropt::getLine(int i) {
	vector<string> ret;
	if (i>=m_cur.size())
		return ret;
	auto s = Util::trim(m_cur[i]);
    s = Util::ReplaceString(s, "\t", " "); // replace all 'x' to 'y'
    s = Util::ReplaceString(s, "  ", " "); // replace all 'x' to 'y'

	ret = Util::split(s,' ', ret);
	// Lowercase operation
	if (ret.size()>0)
		ret[0] = Util::toLower(ret[0]);

	return ret;
}

