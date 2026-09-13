version ?= 1.1.0

KERNEL_RELEASE ?= $(shell uname -r)
KERNEL_DIR := /lib/modules/$(KERNEL_RELEASE)/build

obj-m += usbled.o

ci: clean deps build install uninstall

################################################################
# Generic Linux

deps:
	apt-get update
	apt-get install -y dwarves

clean:
	make -C $(KERNEL_DIR) M=$(CURDIR) clean

build:
	make -C $(KERNEL_DIR) M=$(CURDIR) modules

install:
	insmod usbled.ko

uninstall:
	rmmod usbled

################################################################
# Debian/Ubuntu

deps-deb:
	apt-get update
	apt-get install -y build-essential dkms debhelper dh-dkms

build-deb:
	dpkg-buildpackage -us -uc -b

install-deb:
	apt install -y ../usbled-standalone-dkms_$$(dpkg-parsechangelog -SVersion)_all.deb

uninstall-deb:
	apt remove -y usbled-standalone-dkms

publish-deb:
	gh release create $(version) ../usbled-standalone-dkms_$(version)-1_all.deb

.PHONY: ci deps clean build install uninstall deps-deb build-deb install-deb uninstall-deb publish-deb