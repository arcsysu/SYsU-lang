ADD_EXECUTABLE(sysu-tester-mizuno_ai mizuno_ai.sysu.c)
TARGET_LINK_LIBRARIES(sysu-tester-mizuno_ai sysu)
TARGET_INCLUDE_DIRECTORIES(sysu-tester-mizuno_ai PRIVATE ${CMAKE_SOURCE_DIR}/librarian)
INSTALL(TARGETS sysu-tester-mizuno_ai)