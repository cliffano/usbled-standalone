obj-m += usbled.o

ci: clean build

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

install:
	insmod usbled.ko

.PHONY: ci clean build install