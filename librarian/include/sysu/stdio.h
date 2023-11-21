#pragma once
#ifndef __SYSU_STDIO_H_
#define __SYSU_STDIO_H_

#ifdef __cplusplus
extern "C" {
#endif

int sysu_getchar();

int sysu_putchar(int ch);

int sysu_puts(const char str[]);

#ifdef __cplusplus
}
#endif

#endif
