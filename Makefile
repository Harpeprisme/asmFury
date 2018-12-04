all: dos

dos: src/test.asm
	fasm src/test.asm test.exe
	chmod +x test.exe
