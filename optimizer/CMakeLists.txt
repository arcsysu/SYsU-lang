find_package(LLVM REQUIRED)

add_library(sysuOptimizer SHARED optimizer.cc)
target_include_directories(sysuOptimizer PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysuOptimizer)

add_executable(sysu-optimizer main.cc)
llvm_map_components_to_libnames(LLVM_LIBS passes irreader core support)
target_link_libraries(sysu-optimizer sysuOptimizer ${LLVM_LIBS})
target_include_directories(sysu-optimizer PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysu-optimizer)
install(FILES optimizer.hh DESTINATION include/sysu-compiler)
