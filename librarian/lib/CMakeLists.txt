foreach(lib sysy;sysu)
  file(GLOB mains ${lib}/*.cc)
  add_library(${lib} SHARED ${mains})
  install(TARGETS ${lib})
  target_include_directories(${lib}
                             PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../include)
  install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../include/${lib} TYPE INCLUDE)
endforeach()
