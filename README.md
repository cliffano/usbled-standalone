<img align="right" src="https://raw.github.com/cliffano/usbled/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/usbled/workflows/CI/badge.svg)](https://github.com/cliffano/usbled/actions?query=workflow%3ACI)
<br/>

USBLED Standalone
-----------------

USBLED Standalone is a USB LED Linux device driver for stand-alone insertion into the kernel.

The driver code is exactly the same as the original code written by Greg Kroah-Hartman from its addition into the kernel in 2004.

USB LED driver itself was [removed from the kernel in 2016](https://patchwork.kernel.org/project/linux-input/patch/bc0c4bbd-d65d-eeb8-ed13-20bdb4cea6df@gmail.com/). Hence the need to build and insert USB LED driver into the more modern kernel versions.

Installation
------------

Install kernel headers:

    # On Debian
    apt-get install linux-headers

    # On Raspberry Pi OS
    apt-get install raspberrypi-kernel-headers

Compile the driver:

    make build

Insert the driver into the kernel:

    sudo make install

Usage
-----

After plugging the USB LED device, you'll find the colour files `red`, `green`, `blue` under `/sys/bus/usb/drivers/usbled/<id>/` directory.

Each of those colour files has the initial value of `0`, indicating the colour is switched off.

Changing the value from `0` to `1` switches the colour on, which should then be visible on the device.