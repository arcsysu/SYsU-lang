project(sysu-tester-mizuno_ai)
add_executable(${PROJECT_NAME} mizuno_ai.sysu.c)
target_link_libraries(${PROJECT_NAME} sysu)
target_include_directories(
  ${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../librarian/include)
install(TARGETS ${PROJECT_NAME})
