 
GPPPARAMS = -m32
ASPARAMS = --32
LDPARAMS = -melf_i386

object = loader.o kernel.o

%.o :%.cpp
	g++ $(GPPPARAMS) -o $@ -c $<
	

%.o :%.s
	as $(ASPARAMS) -o $@ $<

mykernel.bin : linker.ld $(object)
	ld $(LDPARAMS) -T $< -o $@ $(object)
	
install : mykernel.bin
	sudo cp $< /boot/mykernel.bin
	
