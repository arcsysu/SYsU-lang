ADD_LIBRARY(sylib_static STATIC sylib.cc)
ADD_LIBRARY(sylib SHARED sylib.cc)
INSTALL(TARGETS sylib_static sylib)
INSTALL(FILES sylib.h TYPE INCLUDE)