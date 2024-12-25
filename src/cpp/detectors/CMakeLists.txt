# src/cpp/detectors/CMakeLists.txt

# Detectors module
add_library(Detectors
    qr_detector.cpp
    #yolo_detector.cpp
)

# Ensure packages are found
find_package(OpenCV REQUIRED)
find_package(Eigen3 REQUIRED)

# Include directories
target_include_directories(Detectors
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR} # Current directory (src/cpp/detectors)
        ${OpenCV_INCLUDE_DIRS}      # OpenCV include directories
        ${EIGEN3_INCLUDE_DIR}       # Eigen include directory from find_package
)

# Link OpenCV
target_link_libraries(Detectors
    PRIVATE
        ${OpenCV_LIBS}
        Utilities
)