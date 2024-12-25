# ./CMakeLists.txt


cmake_minimum_required(VERSION 3.16)
project(TargetStreamer)
enable_testing()

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Define an option to include YOLO
option(BUILD_YOLO "Build YOLO detector" OFF) # Default is OFF

# Add subdirectories
add_subdirectory(src/cpp)
add_subdirectory(tests/cpp)

# Include directories
include_directories(/usr/local/include/eigen3)

# Include directories
include_directories(
    src/cpp
    #src/cpp/camera
    src/cpp/detectors
    src/cpp/transformations
    src/cpp/validators
    src/cpp/utilities
)

# Add executable
# Ensure you link the executable only if defined
if(EXISTS "${CMAKE_SOURCE_DIR}/src/main.cpp")
    add_executable(main src/main.cpp)

    # Link libraries
    target_link_libraries(main PRIVATE 
        detectors 
        transformations 
        validators
        utilities
        OpenCV
    )

    if(BUILD_YOLO)
        target_link_libraries(main PRIVATE torch)
    endif()
endif()