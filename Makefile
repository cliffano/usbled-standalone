version ?= 1.0.1-pre.0

KERNEL_RELEASE ?= $(shell uname -r)
KERNEL_DIR := /lib/modules/$(KERNEL_RELEASE)/build

obj-m += usbled.o

ci: clean deps build

deps:
	apt-get install dkms debhelper dh-dkms

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean

build:
	make -C $(KERNEL_DIR) M=$(PWD) modules

install:
	insmod usbled.ko

.PHONY: ci clean deps build install