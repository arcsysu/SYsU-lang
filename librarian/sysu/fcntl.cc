#include "fcntl.h"
#include <fcntl.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_open(const char pathname[], int flags) {
  return open(pathname, flags);
}

#ifdef __cplusplus
}
#endif