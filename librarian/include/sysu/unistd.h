#pragma once
#ifndef __SYSU_UNISTD_H_
#define __SYSU_UNISTD_H_

#ifdef __cplusplus
extern "C" {
#endif

int sysu_close(int fd);

long long sysu_read(int fd, char buf[], long long count);

long long sysu_write(int fd, const char buf[], long long count);

long long sysu_lseek64(int fd, long long offset, int whence);

int sysu_fork();

int sysu_getpid();

int sysu_getppid();

#ifdef __cplusplus
}
#endif

#endif
