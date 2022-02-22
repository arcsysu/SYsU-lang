OPTION(SYSU_BUILD_TEST "Build *.sysu.c as ref")
IF(SYSU_BUILD_TEST)
    FILE(GLOB _subs *)
    FOREACH(_sub ${_subs})
        IF(IS_DIRECTORY ${_sub})
            ADD_SUBDIRECTORY(${_sub})
        ENDIF()
    ENDFOREACH()
ENDIF()

FIND_PACKAGE(Clang REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/clang")
FIND_PACKAGE(Python3 COMPONENTS Interpreter REQUIRED)

FOREACH(_test lexer-0 lexer-1 lexer-2 lexer-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/test_lexer.py ${_test} "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E" "$<TARGET_FILE:clang> -cc1 -dump-tokens 2>&1" "$<TARGET_FILE:sysu-lexer> 2>&1")
    SET_TESTS_PROPERTIES(${_test} PROPERTIES FAIL_REGULAR_EXPRESSION "fail")
ENDFOREACH()

FOREACH(_test parser-0 parser-1 parser-2 parser-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/test_parser.py ${_test} "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E" "$<TARGET_FILE:clang> -cc1 -ast-dump=json" "$<TARGET_FILE:clang> -cc1 -dump-tokens 2>&1 | $<TARGET_FILE:sysu-parser>")
    SET_TESTS_PROPERTIES(${_test} PROPERTIES FAIL_REGULAR_EXPRESSION "fail")
ENDFOREACH()