FILE(GLOB mains *.sysu.c)
FOREACH(mainfile ${mains})
    # Get file name without directory
    GET_FILENAME_COMPONENT(mainname ${mainfile} NAME_WE)
    ADD_EXECUTABLE(h_functional_${mainname} ${mainfile})
    TARGET_LINK_LIBRARIES(h_functional_${mainname} sylib_static)
    TARGET_INCLUDE_DIRECTORIES(h_functional_${mainname} PRIVATE ${CMAKE_SOURCE_DIR}/sylib)
    INSTALL(TARGETS h_functional_${mainname})
ENDFOREACH()