echo "Compile"
#../build/tripe -arch mos6502 -c -a -i 6502/unittests_tripe.asm -o 6502/unittests.asm  -ptr_zp 0x02 -reg_zp 0x56 -wh_zp 0x4c -sym -ptr_zp 0x02 -sys c64
#../build/tripe -arch z80 -c -a -i z80/unittests_tripe.asm -o z80/unittests.asm   -sym  -sys amstradcpc
echo ""
echo "Guts 6502:"
#../build/tripe -arch mos6502 -guts -i 6502/unittests.prg -exit_mem 0x8000 #-guts_output
if [ "$?" == "0" ]; then
    echo "Success! everything is as it should be"
else
    echo "Failure! please check the TRSE project to see what fails"
fi

echo ""
echo "Guts Z80:"

../build/tripe -arch z80 -guts -i z80/unittests.bin -exit_mem 0xC000 #-guts_output
if [ "$?" == "0" ]; then
    echo "Success! everything is as it should be"
else
    echo "Failure! please check the TRSE project to see what fails"
fi

