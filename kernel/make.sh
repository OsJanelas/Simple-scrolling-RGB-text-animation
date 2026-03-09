echo "compiling Assembly sources"
nasm -f bin kernel/boot.asm -o kernel/binaries/boot.bin
nasm -f bin kernel/gdt.asm -o kernel/binaries/gdt.o
nasm -f bin kernel/switch.asm -o kernel/binaries/switch.o

echo "linking C file"
ld -m elf_i386 -T linker.ld binaries/scroll.o -o binaries/kernel.bin --oformat binary

echo "mounting IMG"
cat boot.bin binaries/kernel.bin > Scroll.img