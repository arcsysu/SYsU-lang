ADD_LIBRARY(sylib_static STATIC sylib.c)
ADD_LIBRARY(sylib SHARED sylib.c)
INSTALL(TARGETS sylib_static sylib)
INSTALL(FILES sylib.h TYPE INCLUDE)