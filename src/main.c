#include <avr/io.h>
#include <util/delay.h>

void main()
{
    while (1)
    {
        _delay_ms(1000);
        PORTD ^= 1 << PD5;
    }
}