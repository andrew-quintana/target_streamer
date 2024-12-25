# tests/cpp/CMakeLists.txt

# enable testing
enable_testing()

# create an executable for the logger test
add_executable(test_runner
    #test_camera.cpp
    test_workflow.cpp
)

# link the logger library, gtest, and necessary dependencies
find_package(GTest REQUIRED)
target_link_libraries(test_runner
    PRIVATE
    GTest::GTest
    GTest::Main
    #Camera
    Detectors
    Transformations
    Utilities
    Validators
    ${OpenCV_LIBS} # Ensure OpenCV is linked
)


# Include directories
target_include_directories(test_runner
    PRIVATE
        ${CMAKE_SOURCE_DIR}/src/cpp
        #${CMAKE_SOURCE_DIR}/src/cpp/camera
        ${CMAKE_SOURCE_DIR}/src/cpp/detectors
        ${CMAKE_SOURCE_DIR}/src/cpp/validators
        ${CMAKE_SOURCE_DIR}/src/cpp/transformations
        ${CMAKE_SOURCE_DIR}/src/cpp/utilities
        ${OpenCV_INCLUDE_DIRS}
        /usr/local/include/eigen3
)

# add the test to ctest
add_test(NAME AllTests COMMAND test_runner)

