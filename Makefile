GO = gccgo
GOFLAGS = -fno-split-stack -static -Werror -nostdlib -nodefaultlibs -nostartfiles
all:
	nasm -f elf32 -o boot.o boot.asm
	$(GO) $(GOFLAGS) -o kernel.go.o -c kernel.go
	ld -T linker.ld -o kernel.bin kernel.go.o boot.o

clean:
	rm -rf *.o *.bin

boot:
	qemu-system-i386 -kernel kernel.bin
