OPTION(SYSU_TESTER "Build *.sysu.c as ref")
IF(SYSU_TESTER)
    FILE(GLOB _subs *)
    FOREACH(_sub ${_subs})
        IF(IS_DIRECTORY ${_sub})
            ADD_SUBDIRECTORY(${_sub})
        ENDIF()
    ENDFOREACH()
ENDIF()

FIND_PACKAGE(Clang REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/clang")
FIND_PACKAGE(Python3 COMPONENTS Interpreter REQUIRED)

FOREACH(_test lexer-0)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor
        --sysu-lexer $<TARGET_FILE:sysu-lexer>
        "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()

FOREACH(_test lexer-1 lexer-2 lexer-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor
        --sysu-lexer $<TARGET_FILE:sysu-lexer>
        "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()

FOREACH(_test parser-0)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor
        --sysu-parser $<TARGET_FILE:sysu-parser>
        "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()

FOREACH(_test parser-1 parser-2 parser-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor ${CMAKE_SOURCE_DIR}/preprocessor/sysu-preprocessor
        --sysu-parser $<TARGET_FILE:sysu-parser>
        "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()

FOREACH(_test benchmark_generator_and_optimizer_0)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-generator $<TARGET_FILE:sysu-generator>
        --sysu-optimizer $<TARGET_FILE:sysu-optimizer>
        "${CMAKE_CURRENT_SOURCE_DIR}/functional/000_main.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()

FOREACH(_test benchmark_generator_and_optimizer_1)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_SOURCE_DIR}/compiler/sysu-compiler
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-generator $<TARGET_FILE:sysu-generator>
        --sysu-optimizer $<TARGET_FILE:sysu-optimizer>
        "${CMAKE_CURRENT_SOURCE_DIR}/**/*.sysu.c")
    SET_TESTS_PROPERTIES(
        ${_test}
        PROPERTIES
        ENVIRONMENT
        "CPATH=${CMAKE_SOURCE_DIR}/librarian:$ENV{CPATH};LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LIBRARY_PATH};LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/librarian:$ENV{LD_LIBRARY_PATH}")
ENDFOREACH()