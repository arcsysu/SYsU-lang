OPTION(SYSU_BUILD_TEST "Build *.sysu.c as ref")
IF(SYSU_BUILD_TEST)
    ADD_SUBDIRECTORY(functional)
    ADD_SUBDIRECTORY(function_test2020)
    ADD_SUBDIRECTORY(function_test2021)
    ADD_SUBDIRECTORY(h_functional)
    ADD_SUBDIRECTORY(performance)
    ADD_SUBDIRECTORY(performance_test2021-private)
    ADD_SUBDIRECTORY(performance_test2021-public)
ENDIF()

FIND_PACKAGE(Clang REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/clang")
FIND_PACKAGE(Python3 COMPONENTS Interpreter REQUIRED)

foreach(test lexer-0 lexer-1 lexer-2 lexer-3)
    ADD_TEST(NAME ${test}
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/test_lexer.py ${test} "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E" "$<TARGET_FILE:clang> -cc1 -dump-tokens 2>&1" "$<TARGET_FILE:sysu-lexer> 2>&1")
    SET_TESTS_PROPERTIES(${test} PROPERTIES FAIL_REGULAR_EXPRESSION "fail")
endforeach()

foreach(test parser-0 parser-1 parser-2 parser-3)
    ADD_TEST(NAME ${test}
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/test_parser.py ${test} "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E" "$<TARGET_FILE:clang> -cc1 -ast-dump=json" "$<TARGET_FILE:clang> -cc1 -dump-tokens 2>&1 | $<TARGET_FILE:sysu-parser>")
    SET_TESTS_PROPERTIES(${test} PROPERTIES FAIL_REGULAR_EXPRESSION "fail")
endforeach()