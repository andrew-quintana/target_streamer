# Transformations module
add_library(Transformations
    homography_handler.cpp
)

# Ensure packages are found
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)

# Include directories
target_include_directories(Transformations
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${OpenCV_INCLUDE_DIRS}
        ${EIGEN3_INCLUDE_DIR}
)

# Link OpenCV
target_link_libraries(Transformations
    PRIVATE
        ${OpenCV_LIBS}
        Utilities
)