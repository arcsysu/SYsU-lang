set(libs sysy;sysu)
foreach(lib IN LISTS libs)
  file(GLOB mains ${lib}/*.cc)
  add_library(${lib} SHARED ${mains})
  install(TARGETS ${lib})
  target_include_directories(${lib}
                             PRIVATE ${CMAKE_SOURCE_DIR}/librarian/include)
  install(DIRECTORY ${CMAKE_SOURCE_DIR}/librarian/include/${lib} TYPE INCLUDE)
endforeach()
