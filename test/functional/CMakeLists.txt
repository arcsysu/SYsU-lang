FILE(GLOB_RECURSE mains *.sysu.c)
FOREACH(mainfile IN LISTS mains)
    # Get file name without directory
    GET_FILENAME_COMPONENT(mainname ${mainfile} NAME_WE)
    ADD_EXECUTABLE(functional_${mainname} ${mainfile})
    TARGET_LINK_LIBRARIES(functional_${mainname} sylib_static)
    TARGET_INCLUDE_DIRECTORIES(functional_${mainname} PRIVATE ${CMAKE_SOURCE_DIR}/sylib)
    INSTALL(TARGETS functional_${mainname})
endFOREACH()