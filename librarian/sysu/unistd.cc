#include "unistd.h"
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_close(int fd) { return close(fd); }

int sysu_read(int fd, char buf[], int count) { return read(fd, buf, count); }

int sysu_write(int fd, const char buf[], int count) {
  return write(fd, buf, count);
}

#ifdef __cplusplus
}
#endif