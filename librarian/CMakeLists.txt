ADD_LIBRARY(sysy SHARED sysy/sylib.cc)
INSTALL(TARGETS sysy)
INSTALL(FILES sysy/sylib.h DESTINATION include/sysy)

ADD_LIBRARY(sysu SHARED sysu/fcntl.cc sysu/unistd.cc)
INSTALL(TARGETS sysu)
INSTALL(FILES sysu/fcntl.h DESTINATION include/sysu)
INSTALL(FILES sysu/unistd.h DESTINATION include/sysu)