#pragma once
#ifndef __SYSY_SYLIB_H_
#define __SYSY_SYLIB_H_

#ifdef __cplusplus
extern "C" {
#endif

/* Timing function implementation */
void _sysy_starttime(int lineno);
void _sysy_stoptime(int lineno);

/* Input & output functions */
int _sysy_getch();
void _sysy_putch(int a);

int _sysy_getint();
void _sysy_putint(int a);

int _sysy_getarray(int a[]);
void _sysy_putarray(int n, int a[]);

#ifndef SYSY_NO_DEFINE

#define starttime() _sysy_starttime(__LINE__)
#define stoptime() _sysy_stoptime(__LINE__)

#define getch() _sysy_getch()
#define putch(a) _sysy_putch(a)

#define getint() _sysy_getint()
#define putint(a) _sysy_putint(a)

#define getarray(a) _sysy_getarray(a)
#define putarray(n, a) _sysy_putarray(n, a)

#endif

#ifdef __cplusplus
}
#endif

#endif
