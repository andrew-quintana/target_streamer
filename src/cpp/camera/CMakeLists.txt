# Camera-specific CMake configuration
cmake_minimum_required(VERSION 3.10)

# Add the executable
add_executable(capture capture.cpp)

# Specify the location of the shared library
link_directories(/usr/lib/aarch64-linux-gnu/)

# Link against libcamera
target_link_libraries(capture PRIVATE /usr/lib/aarch64-linux-gnu/libcamera.so)

# Include directories for libcamera headers
target_include_directories(capture PRIVATE /usr/include/libcamera)