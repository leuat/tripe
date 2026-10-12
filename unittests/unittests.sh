echo "Compile"
../build/tripe -arch mos6502 -c -a -i 6502/unittests_tripe.asm -o unittests.asm  -ptr_zp 0x02 -reg_zp 0x56 -wh_zp 0x4c -sym -ptr_zp 0x02 -sys c64
echo "Guts"
../build/tripe -arch mos6502 -guts -i unittests.prg -exit_mem 0x8000
if [ "$?" == "0" ]; then
    echo "Success!"
else
    echo "Failure"
fi
