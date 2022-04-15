find_package(LLVM REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/llvm")

add_library(sysu-optimizer-plugin SHARED plugin.cc)
target_include_directories(sysu-optimizer-plugin PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysu-optimizer-plugin)

add_executable(sysu-optimizer optimizer.cc)
target_link_libraries(sysu-optimizer sysu-optimizer-plugin)
llvm_map_components_to_libnames(LLVM_LIBS passes irreader support)
target_link_libraries(sysu-optimizer ${LLVM_LIBS})
install(TARGETS sysu-optimizer)
install(FILES plugin.hh DESTINATION include/sysu-optimizer)
