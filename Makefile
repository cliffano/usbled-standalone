version ?= 1.0.1-pre.0

KERNEL_RELEASE ?= $(shell uname -r)
KERNEL_DIR := /lib/modules/$(KERNEL_RELEASE)/build

obj-m += usbled.o

ci: clean deps build

deps:
	apt-get install dwarves

deps-deb:
	apt-get install dkms debhelper dh-dkms

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean

build:
	make -C $(KERNEL_DIR) M=$(PWD) modules

build-deb:
	dpkg-buildpackage -us -uc -b

install:
	insmod usbled.ko

install-deb:
	apt install ../usbled-standalone-dkms_$$(dpkg-parsechangelog -SVersion)_all.deb

.PHONY: ci clean deps build install build-deb install-deb