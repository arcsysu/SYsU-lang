#include "unistd.h"
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

int sysu_close(int fd) { return close(fd); }

long long sysu_read(int fd, char buf[], long long count) {
  return read(fd, buf, count);
}

long long sysu_write(int fd, const char buf[], long long count) {
  return write(fd, buf, count);
}

long long sysu_lseek64(int fd, long long offset, int whence) {
  return lseek64(fd, offset, whence);
}

int sysu_fork() { return fork(); }

int sysu_getpid() { return getpid(); }

int sysu_getppid() { return getppid(); }

#ifdef __cplusplus
}
#endif