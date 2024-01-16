# Bring in the required packages
find_package(antlr4-runtime REQUIRED)

if(NOT EXISTS "${ANTLR4_JAR_LOCATION}")
  file(DOWNLOAD
       https://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar
       ${CMAKE_CURRENT_BINARY_DIR}/antlr-${ANTLR_VERSION}-complete.jar)
  set(ANTLR4_JAR_LOCATION
      ${CMAKE_CURRENT_BINARY_DIR}/antlr-${ANTLR_VERSION}-complete.jar)
endif()

find_package(antlr4-generator REQUIRED)

# generate lexer
antlr4_generate(
  sysu_grammar
  ${CMAKE_CURRENT_SOURCE_DIR}/C.g4 BOTH
  TRUE TRUE "sysu_grammar")

# add generated source files
add_executable(sysu-grammar main.cc ${ANTLR4_SRC_FILES_sysu_grammar})
install(TARGETS sysu-grammar)

# add directories for generated include files
target_include_directories(
  sysu-grammar
  PRIVATE ${ANTLR4_INCLUDE_DIR} ${ANTLR4_INCLUDE_DIR_sysu_grammar})

target_link_directories(sysu-grammar PUBLIC ${ANTLR4_LIB_DIR})
target_link_libraries(sysu-grammar antlr4_static)

if(${ANTLR_VERSION} VERSION_LESS_EQUAL 4.10.1)
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(UUID REQUIRED uuid)
  target_link_directories(sysu-grammar PUBLIC ${UUID_LIBRARY_DIRS})
  target_link_libraries(sysu-grammar ${UUID_LIBRARIES})
endif()

find_package(LLVM REQUIRED)
llvm_map_components_to_libnames(LLVM_LIBS support)
target_link_libraries(sysu-grammar ${LLVM_LIBS})
target_include_directories(sysu-grammar PRIVATE ${LLVM_INCLUDE_DIRS})
