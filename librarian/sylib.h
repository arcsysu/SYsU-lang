#pragma once
#ifndef __SYLIB_H_
#define __SYLIB_H_

#ifdef __cplusplus
extern "C" {
#endif

/* Input & output functions */
int getint(), getch(), getarray(int a[]);
void putint(int a), putch(int a), putarray(int n, int a[]);

/* Timing function implementation */
void _sysy_starttime(int lineno);
void _sysy_stoptime(int lineno);
#define starttime() _sysy_starttime(__LINE__)
#define stoptime() _sysy_stoptime(__LINE__)

#ifdef __cplusplus
}
#endif

#endif
