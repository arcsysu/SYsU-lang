file(GLOB mains *.sysu.c)
foreach(mainfile ${mains})
  # Get file name without directory
  get_filename_component(mainname ${mainfile} NAME_WE)
  add_executable(sysu-tester-function_test2021_${mainname} ${mainfile})
  target_link_libraries(sysu-tester-function_test2021_${mainname} sysy)
  target_include_directories(sysu-tester-function_test2021_${mainname}
                             PRIVATE ${CMAKE_SOURCE_DIR}/librarian)
  install(TARGETS sysu-tester-function_test2021_${mainname})
endforeach()
