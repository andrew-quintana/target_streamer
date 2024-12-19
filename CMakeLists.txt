cmake_minimum_required(VERSION 3.10)
project(capture)

set(CMAKE_CXX_STANDARD 17)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBCAMERA REQUIRED libcamera)

add_executable(capture src/cpp/camera/capture.cpp)
target_include_directories(capture PRIVATE ${LIBCAMERA_INCLUDE_DIRS})
target_link_libraries(capture ${LIBCAMERA_LIBRARIES})