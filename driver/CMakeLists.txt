INSTALL(PROGRAMS sysu-driver TYPE BIN)
FIND_PACKAGE(Clang REQUIRED PATHS "/usr/lib/llvm-11/lib/cmake/clang")
FIND_PACKAGE(Python3 COMPONENTS Interpreter REQUIRED)

FOREACH(_test lexer-0)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_CURRENT_SOURCE_DIR}/sysu-driver
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E"
        --sysu-lexer $<TARGET_FILE:sysu-lexer>
        "${CMAKE_SOURCE_DIR}/test/functional/000_main.sysu.c")
ENDFOREACH()

FOREACH(_test lexer-1 lexer-2 lexer-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_CURRENT_SOURCE_DIR}/sysu-driver
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E"
        --sysu-lexer $<TARGET_FILE:sysu-lexer>
        "${CMAKE_SOURCE_DIR}/**/*.sysu.c")
ENDFOREACH()

FOREACH(_test parser-0)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_CURRENT_SOURCE_DIR}/sysu-driver
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E"
        --sysu-parser $<TARGET_FILE:sysu-parser>
        "${CMAKE_SOURCE_DIR}/test/functional/000_main.sysu.c")
ENDFOREACH()

FOREACH(_test parser-1 parser-2 parser-3)
    ADD_TEST(NAME ${_test}
        COMMAND ${Python3_EXECUTABLE}
        ${CMAKE_CURRENT_SOURCE_DIR}/sysu-driver
        --unittest ${_test}
        --clang $<TARGET_FILE:clang>
        --sysu-preprocessor "$<TARGET_FILE:clang> -cc1 -I${CMAKE_CURRENT_SOURCE_DIR}/../sylib -E"
        --sysu-parser $<TARGET_FILE:sysu-parser>
        "${CMAKE_SOURCE_DIR}/**/*.sysu.c")
ENDFOREACH()