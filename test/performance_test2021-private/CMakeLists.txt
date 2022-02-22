FILE(GLOB mains *.sysu.c)
FOREACH(mainfile ${mains})
    # Get file name without directory
    GET_FILENAME_COMPONENT(mainname ${mainfile} NAME_WE)
    ADD_EXECUTABLE(performance_test2021-private_${mainname} ${mainfile})
    TARGET_LINK_LIBRARIES(performance_test2021-private_${mainname} sylib_static)
    TARGET_INCLUDE_DIRECTORIES(performance_test2021-private_${mainname} PRIVATE ${CMAKE_SOURCE_DIR}/sylib)
    INSTALL(TARGETS performance_test2021-private_${mainname})
ENDFOREACH()