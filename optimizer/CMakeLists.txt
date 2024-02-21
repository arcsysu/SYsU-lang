project(sysu-optimizer)
find_package(LLVM REQUIRED)

add_library(sysuOptimizer SHARED optimizer.cc)
target_include_directories(sysuOptimizer PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysuOptimizer)

add_executable(${PROJECT_NAME} main.cc)
llvm_map_components_to_libnames(LLVM_LIBS passes irreader core support)
target_link_libraries(${PROJECT_NAME} sysuOptimizer ${LLVM_LIBS})
target_include_directories(${PROJECT_NAME} PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS ${PROJECT_NAME})
install(FILES optimizer.hh DESTINATION include/sysu-compiler)
