# tripe
Turbo Rascal Intermediate Processing Engine
## Huh?
What is Tripe - and what will it be? 
## the process
When finished, Tripe will basically be LLVM for 8/16 systems. This means that 
any homebrew compiler needs to output the relatively simple .tripe intermediate language as a text file (semi-asm) 
- tripe will optimise this .trasm file for you, so the compiler can generate crappy code 
- tripe then converts the .trasm to a binary .trp file (for future linking, with symbols etc) 
- tripe then converts the binary .trp file to an .asm file of the given architecture/system, think 6502/c64 or 6502/vic20 or 6809/coco3 
- tripe then optimises the native .asm 
(future, not implemented): TRSEs OrgAsm will be rewritten to plain C++ and be used to generate a final .prg/executable 
## why?
Why is Tripe so fun? well, first of all - anyone can write a simple compiler for your favorite programming language, it doesn't even have to be optimised. just output .tripe asm, and Tripe will do the rest for you. Sort of like LLVM. 
Currently, Tripe only supports 6502/c64 output, and the optimisations are still messy and crappy. 
CPUs that will be targeted in the future: 6502, 6809, m68k, Z80/GB, 16 bit X86 & x64, pdp-11 etc etc 
## current integration with TRSE
1. TRSE outputs a file_tripe.asm that contains unoptimised .tripe instructions 
2. Tripe optimises the file and outputs to file_tripe_opt.asm 
3. Tripe compiles to a .trp binary 
4. Tripe compiles the .trp binary to a c64 .asm 
5. Tripe optimises the 6502 .asm file 
6. TRSE takes over and uses orgasm to assemble the .asm file as usual (this step will be included within Tripe in the future) 
## Trasm example

```
  ; whole line: sinx[x] = sin[c2x] + sin[c2y];

  ; t_uint8_load1 = sin[c2x]
	load 	sin 	c2x 	t_uint8_load1  
  ; t_uint8_load2 = sin[c2y]
	load 	sin 	c2y 	t_uint8_load2
  ; t_uint8_1 = t_uint8_load1 + t_uint8_load2
	add 	t_uint8_1 	t_uint8_load1 	t_uint8_load2
  ; sinx[x] = t_uint8_1
	store 	sinx 	x 	t_uint8_1
  ; c2x+=3
	add	c2x	c2x	uint8:0x03


```
