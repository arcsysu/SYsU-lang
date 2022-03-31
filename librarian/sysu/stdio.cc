#include "stdio.h"
#include <stdio.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_getchar() { return getchar(); }

int sysu_putchar(int ch) { return putchar(ch); }

int sysu_gets_s(char str[], int n) {
  fgets(str, n, stdin);
  int len = strlen(str);
  if (str[len - 1] == "\n"[0])
    str[len - 1] = 0;
  return len;
}

int sysu_puts(const char str[]) { return puts(str); }

#ifdef __cplusplus
}
#endif