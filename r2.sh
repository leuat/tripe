#./compile_resources.sh
#./format.sh
rm build/tripe
cd build
cmake --build . -j8
cd ..
#upx   --best --brute -9  build/tripe
echo "ALL"
build/tripe -ptr_zp 0x02 -c -a -arch mos6502 -sys c64 -i trse/$1_tripe.asm -o trse/$1.asm  -ptr_zp 0x02 -reg_zp 0x56 -wh_zp 0x4c -sym
