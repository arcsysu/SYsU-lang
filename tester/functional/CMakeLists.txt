file(GLOB mains *.sysu.c)
foreach(mainfile ${mains})
  # Get file name without directory
  get_filename_component(mainname ${mainfile} NAME_WE)
  add_executable(sysu-tester-functional_${mainname} ${mainfile})
  target_link_libraries(sysu-tester-functional_${mainname} sysy)
  target_include_directories(
    sysu-tester-functional_${mainname}
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../librarian/include)
  install(TARGETS sysu-tester-functional_${mainname})
endforeach()
