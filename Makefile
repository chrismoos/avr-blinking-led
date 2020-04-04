CFLAGS:=-Os -mmcu=atmega328p -DF_CPU=8000000UL
SOURCES:=$(shell find src -name *.c)

.PHONY: build clean flash info

build:
	mkdir -p build
	avr-gcc $(CFLAGS) -o build/out.elf $(SOURCES)
	avr-objcopy -O ihex build/out.elf build/out.hex

flash:
	avrdude -c ftdi232rl -p atmega328p -P ft0 -b 9600 -U flash:w:build/out.hex

info:
	avrdude -c ftdi232rl -p atmega328p -P ft0 -b 9600

clean:
	rm -rf build