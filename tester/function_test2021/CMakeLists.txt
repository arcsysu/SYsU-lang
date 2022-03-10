FILE(GLOB mains *.sysu.c)
FOREACH(mainfile ${mains})
    # Get file name without directory
    GET_FILENAME_COMPONENT(mainname ${mainfile} NAME_WE)
    ADD_EXECUTABLE(sysu-tester-function_test2021_${mainname} ${mainfile})
    TARGET_LINK_LIBRARIES(sysu-tester-function_test2021_${mainname} sysy)
    TARGET_INCLUDE_DIRECTORIES(sysu-tester-function_test2021_${mainname} PRIVATE ${CMAKE_SOURCE_DIR}/librarian)
    INSTALL(TARGETS sysu-tester-function_test2021_${mainname})
ENDFOREACH()