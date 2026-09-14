rm bin/tripe
make;

echo "OPT"
bin/tripe -arch tropt -i trse/test2_tripe_unopt.asm -o trse/test2_tripe.asm
echo "TRP"
bin/tripe -arch trasm2tripe -i trse/test2_tripe.asm -o tst.trp
echo "ASMn"
bin/tripe -arch mos6502 -i tst.trp -o tst.asm
