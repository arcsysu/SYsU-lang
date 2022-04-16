#include "string.h"
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

long long sysu_strlen(const char str[]) { return strlen(str); }

int sysu_strcmp(const char lhs[], const char rhs[]) { return strcmp(lhs, rhs); }

#ifdef __cplusplus
}
#endif