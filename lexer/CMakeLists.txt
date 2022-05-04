find_package(FLEX REQUIRED)
flex_target(lexer lexer.l lexer.cc DEFINES_FILE lexer.hh)
add_executable(sysu-lexer ${FLEX_lexer_OUTPUTS})
install(TARGETS sysu-lexer)
