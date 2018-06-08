# Bootloader
I decided to learn how to create a bootloader to get a better understanding of how a computer boots.

## Installation
To install you need to decide on your development platform i'm using linux (Ubuntu).

* `$ git clone https://github.com/tomcarver16/Bootloader.git`
* `$ sudo apt-get install nasm`
* `$ sudo apt-get install qemu`
* `$ nasm src/boot.asm -f bin -o src/boot.bin`
* `$ qemu-system-i386 -fda src/boot.bin`

This will display text to the screen.

## How it works
![Graphic of the stack](https://github.com/tomcarver16/Bootloader/blob/master/assets/Stack.png)

When the bootloader is hit it sets the bootloader to address 0x7c00, this then clears up 512 bytes in memory and writes 0xAA & 0x55 to byte 511 & 512 this tells the CPU that it's the bootloader. The above image gives a good understanding of how the actual stack will look during boot up.
