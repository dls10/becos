IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR)
VPATH = src
SRC = src



objects = main.o boot.o


kernel: $(objects)
	ld -m elf_i386 -T link.ld -o kernel $(objects)   

main.o: main.c
	$(CC) -m32 -c -o main.o $(SRC)/main.c 

boot.o: boot.asm
	nasm -f elf32 $(SRC)/boot.asm -o boot.o

clean:
	rm -rf *.o
	rm kernel

