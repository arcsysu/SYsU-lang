find_package(LLVM REQUIRED)
find_package(BISON REQUIRED)
bison_target(parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/main.cc
             DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.hh)
add_executable(sysu-parser ${BISON_parser_OUTPUT_SOURCE})
llvm_map_components_to_libnames(LLVM_LIBS support)
target_link_libraries(sysu-parser ${LLVM_LIBS})
target_include_directories(sysu-parser PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysu-parser)
