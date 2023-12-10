#include <stddef.h>

#define UART_CTRL_ADDR ((char*)0x10000000)


void oprintf(const char *c) {
	if(c == NULL) {
		return;
	}
	char *uart = UART_CTRL_ADDR;
	const char *ptr = c;
	while(*ptr) {
		*uart = *ptr++;
	}
}

int main(void) {
	oprintf("Hello, World!");
}
