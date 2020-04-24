cmake_minimum_required(VERSION 3.0.0)

project("Testing code cov")

include(CTest)

set(ENABLE_CODECOV OFF CACHE BOOL "Enables code coverage")


if (ENABLE_CODECOV)
    set(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")
    set(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage")
endif()

add_executable(my_test my_test.cc)

if (BUILD_TESTING)
    add_test(NAME my_test COMMAND my_test)
endif()
