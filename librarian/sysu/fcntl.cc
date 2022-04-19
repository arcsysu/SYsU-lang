#include "fcntl.h"
#include <fcntl.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_open(const char pathname[], int flags, int mode) {
  return open(pathname, flags, mode);
}

int sysu_fcntl(int fd, int cmd, int arg) { return fcntl(fd, cmd, arg); }

#ifdef __cplusplus
}
#endif