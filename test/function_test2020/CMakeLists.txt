FILE(GLOB_RECURSE mains *.sysu.c)
FOREACH(mainfile IN LISTS mains)
    # Get file name without directory
    GET_FILENAME_COMPONENT(mainname ${mainfile} NAME_WE)
    ADD_EXECUTABLE(function_test2020_${mainname} ${mainfile})
    TARGET_LINK_LIBRARIES(function_test2020_${mainname} sylib_static)
    TARGET_INCLUDE_DIRECTORIES(function_test2020_${mainname} PRIVATE ${CMAKE_SOURCE_DIR}/sylib)
    INSTALL(TARGETS function_test2020_${mainname})
ENDFOREACH()