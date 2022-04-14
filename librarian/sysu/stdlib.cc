#include "stdlib.h"
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_atoi(const char str[]) { return atoi(str); }

void sysu_exit(int status) { exit(status); }

#ifdef __cplusplus
}
#endif