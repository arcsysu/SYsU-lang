option(SYSU_TESTER "Build *.sysu.c as ref")
if(SYSU_TESTER)
  file(GLOB _subs *)
  foreach(_sub ${_subs})
    if(IS_DIRECTORY ${_sub})
      if(EXISTS ${_sub}/CMakeLists.txt)
        add_subdirectory(${_sub})
      endif()
    endif()
  endforeach()
endif()

find_package(
  Python3
  COMPONENTS Interpreter
  REQUIRED)

foreach(_test lexer-0)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-preprocessor
      ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor --sysu-lexer
      $<TARGET_FILE:sysu-lexer>
      "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()

foreach(_test lexer-1 lexer-2 lexer-3)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-preprocessor
      ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor --sysu-lexer
      $<TARGET_FILE:sysu-lexer> "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()

foreach(_test parser-0)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-preprocessor
      ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor --sysu-parser
      $<TARGET_FILE:sysu-parser>
      "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()

foreach(_test parser-1 parser-2 parser-3)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-preprocessor
      ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor --sysu-parser
      $<TARGET_FILE:sysu-parser> "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()

foreach(_test benchmark_generator_and_optimizer_0)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-generator $<TARGET_FILE:sysu-generator>
      --sysu-optimizer $<TARGET_FILE:sysu-optimizer>
      "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()

foreach(_test benchmark_generator_and_optimizer_1)
  add_test(
    NAME ${_test}
    COMMAND
      ${Python3_EXECUTABLE} ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
      --unittest ${_test} --sysu-generator $<TARGET_FILE:sysu-generator>
      --sysu-optimizer $<TARGET_FILE:sysu-optimizer>
      "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
  set_tests_properties(
    ${_test}
    PROPERTIES
      ENVIRONMENT
      "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}"
  )
endforeach()
