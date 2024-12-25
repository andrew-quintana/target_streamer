# src/cpp/CMakeLists.txt

# Add subdirectories for the source modules
#add_subdirectory(camera)
add_subdirectory(detectors)
add_subdirectory(transformations)
add_subdirectory(utilities)
add_subdirectory(validators)

# Add main program
add_executable(main main.cpp)
target_link_libraries(main 
    PRIVATE 
    #Camera
    Detectors
    Transformations
    Utilities
    Validators
    ${OpenCV_LIBS}  # Ensure OpenCV is linked
)

# Include OpenCV
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})