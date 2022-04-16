#pragma once
#ifndef __SYSU_STRING_H_
#define __SYSU_STRING_H_

#ifdef __cplusplus
extern "C" {
#endif

long long sysu_strlen(const char str[]);

int sysu_strcmp(const char lhs[], const char rhs[]);

#ifdef __cplusplus
}
#endif

#endif
