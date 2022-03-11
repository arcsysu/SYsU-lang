FIND_PACKAGE(LLVM REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/llvm")

ADD_LIBRARY(sysu-optimizer-plugin SHARED plugin.cc)
TARGET_INCLUDE_DIRECTORIES(sysu-optimizer-plugin PRIVATE ${LLVM_INCLUDE_DIRS})
INSTALL(TARGETS sysu-optimizer-plugin)

ADD_EXECUTABLE(sysu-optimizer optimizer.cc)
TARGET_LINK_LIBRARIES(sysu-optimizer sysu-optimizer-plugin)
LLVM_MAP_COMPONENTS_TO_LIBNAMES(LLVM_LIBS passes irreader support)
TARGET_LINK_LIBRARIES(sysu-optimizer ${LLVM_LIBS})
INSTALL(TARGETS sysu-optimizer)
INSTALL(FILES plugin.hh DESTINATION include/sysu-optimizer)