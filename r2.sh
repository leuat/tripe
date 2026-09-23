#./compile_resources.sh
rm build/tripe
cd build
cmake --build .
cd ..

echo "ALL"
echo $1_tripe.asm
build/tripe -c -arch mos6502 -sys c64 -i trse/$1_tripe.asm -o trse/$1.asm
