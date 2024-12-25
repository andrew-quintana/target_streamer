# src/cpp/utilities/CMakeLists.txt

add_library(Utilities utilities.cpp)

# Ensure packages are found
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)

# Include directories
target_include_directories(Utilities
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${OpenCV_INCLUDE_DIRS}
        ${EIGEN3_INCLUDE_DIR}
)

# Link OpenCV
target_link_libraries(Utilities
    PUBLIC
        ${OpenCV_LIBS}
)