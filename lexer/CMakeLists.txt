find_package(FLEX REQUIRED)
flex_target(lexer lexer.l ${CMAKE_CURRENT_BINARY_DIR}/main.cc
            DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/lexer.hh)
add_executable(sysu-lexer ${FLEX_lexer_OUTPUTS})
install(TARGETS sysu-lexer)
