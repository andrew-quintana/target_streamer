# Validators module
add_library(Validators validator.cpp)

# Ensure packages are found
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)

# Include directories
target_include_directories(Validators
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${OpenCV_INCLUDE_DIRS}
        ${EIGEN3_INCLUDE_DIR}
)

# Link Utilities and OpenCV
target_link_libraries(Validators
    PUBLIC
        ${OpenCV_LIBS}
        Utilities
)