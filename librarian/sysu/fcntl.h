#pragma once
#ifndef __SYSU_FCNTL_H_
#define __SYSU_FCNTL_H_

#ifdef __cplusplus
extern "C" {
#endif

int sysu_open(const char pathname[], int flags, int mode);

int sysu_fcntl(int fd, int cmd, int arg);

#ifdef __cplusplus
}
#endif

#endif
