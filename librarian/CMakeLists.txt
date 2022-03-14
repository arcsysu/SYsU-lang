ADD_LIBRARY(sysy SHARED sylib.cc)
INSTALL(TARGETS sysy)
INSTALL(FILES sysy/sylib.h DESTINATION include/sysy)