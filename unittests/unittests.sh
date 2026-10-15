echo "Compile"
../build/tripe -arch mos6502 -c -a -i 6502/unittests_tripe.asm -o 6502/unittests.asm  -ptr_zp 0x02 -reg_zp 0x56 -wh_zp 0x4c -sym -ptr_zp 0x02 -sys c64
echo "Guts"
../build/tripe -arch mos6502 -guts -i 6502/unittests.prg -exit_mem 0x8000 -guts_output
if [ "$?" == "0" ]; then
    echo "Success! everything is as it should be"
else
    echo "Failure! please check the TRSE project to see what fails"
fi
