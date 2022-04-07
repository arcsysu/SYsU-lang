#include "stdio.h"
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_getchar() { return getchar(); }

int sysu_putchar(int ch) { return putchar(ch); }

int sysu_puts(const char str[]) { return puts(str); }

#ifdef __cplusplus
}
#endif