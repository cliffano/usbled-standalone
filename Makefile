obj-m += usbled.o

ci: clean build

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

.PHONY: ci clean build