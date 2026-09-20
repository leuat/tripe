# tripe
Turbo Rascal Intermediate Processing Engine
## Huh=
Tripe development has started up again. But what is it? basically a LLVM-like system for older 8/16 bit CPUS. Currently only supported in TRSE.  
- Compiler outputs risc-style tripe .asm output
- tripe optimizes tripe .asm files
- tripe converts tripe .asm file to tripe binary file (.trp)
- tripe converts .trp binaries to target cpu (6502/z80/5809/m68k etc)
- tripe compiles .asm to binary output (not implemented yet)

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
