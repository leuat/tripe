cd build
cmake --build .
cd ..

echo "OPT"
build/tripe -arch tropt -i trse/$1_tripe_unopt.asm -o trse/$1_tripe.asm
echo "TRP"
build/tripe -arch trasm2tripe -i trse/$1_tripe.asm -o tst.trp
echo "ASMn"
build/tripe -arch mos6502 -i tst.trp -o tst.asm
