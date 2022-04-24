find_package(LLVM REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/llvm")
if(${LLVM_VERSION_MAJOR} EQUAL 11)
  message(STATUS "Found LLVM (found version \"${LLVM_PACKAGE_VERSION}\")")
else()
  message(
    WARNING
      "No LLVM-11 found, try to use LLVM-${LLVM_PACKAGE_VERSION}, and this may cause errors."
  )
endif()
find_package(BISON REQUIRED)
bison_target(parser parser.y parser.cc)
add_executable(sysu-parser ${BISON_parser_OUTPUTS})
llvm_map_components_to_libnames(LLVM_LIBS support)
target_link_libraries(sysu-parser ${LLVM_LIBS})
target_include_directories(sysu-parser PRIVATE ${LLVM_INCLUDE_DIRS})
install(TARGETS sysu-parser)
