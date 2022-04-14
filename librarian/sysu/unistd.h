#pragma once
#ifndef __SYSU_UNISTD_H_
#define __SYSU_UNISTD_H_

#ifdef __cplusplus
extern "C" {
#endif

int sysu_close(int fd);

int sysu_read(int fd, char buf[], int count);

int sysu_write(int fd, const char buf[], int count);

int sysu_fork();

int sysu_getpid();

int sysu_getppid();

#ifdef __cplusplus
}
#endif

#endif
