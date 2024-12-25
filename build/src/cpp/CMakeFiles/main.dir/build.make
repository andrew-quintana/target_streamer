# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.29.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.29.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/aq_home/1Projects/target_streamer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aq_home/1Projects/target_streamer/build

# Include any dependencies generated for this target.
include src/cpp/CMakeFiles/main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/cpp/CMakeFiles/main.dir/compiler_depend.make

# Include the progress variables for this target.
include src/cpp/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include src/cpp/CMakeFiles/main.dir/flags.make

src/cpp/CMakeFiles/main.dir/main.cpp.o: src/cpp/CMakeFiles/main.dir/flags.make
src/cpp/CMakeFiles/main.dir/main.cpp.o: /Users/aq_home/1Projects/target_streamer/src/cpp/main.cpp
src/cpp/CMakeFiles/main.dir/main.cpp.o: src/cpp/CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/aq_home/1Projects/target_streamer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cpp/CMakeFiles/main.dir/main.cpp.o"
	cd /Users/aq_home/1Projects/target_streamer/build/src/cpp && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/cpp/CMakeFiles/main.dir/main.cpp.o -MF CMakeFiles/main.dir/main.cpp.o.d -o CMakeFiles/main.dir/main.cpp.o -c /Users/aq_home/1Projects/target_streamer/src/cpp/main.cpp

src/cpp/CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	cd /Users/aq_home/1Projects/target_streamer/build/src/cpp && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aq_home/1Projects/target_streamer/src/cpp/main.cpp > CMakeFiles/main.dir/main.cpp.i

src/cpp/CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	cd /Users/aq_home/1Projects/target_streamer/build/src/cpp && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aq_home/1Projects/target_streamer/src/cpp/main.cpp -o CMakeFiles/main.dir/main.cpp.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

src/cpp/main: src/cpp/CMakeFiles/main.dir/main.cpp.o
src/cpp/main: src/cpp/CMakeFiles/main.dir/build.make
src/cpp/main: src/cpp/detectors/libDetectors.a
src/cpp/main: src/cpp/transformations/libTransformations.a
src/cpp/main: src/cpp/utilities/libUtilities.a
src/cpp/main: src/cpp/validators/libValidators.a
src/cpp/main: /opt/homebrew/lib/libopencv_gapi.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stitching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_alphamat.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_aruco.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bgsegm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bioinspired.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ccalib.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dpm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_face.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_freetype.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_fuzzy.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_hfs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_img_hash.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_intensity_transform.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_line_descriptor.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_mcc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_quality.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rapid.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_reg.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rgbd.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_saliency.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_sfm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_signal.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stereo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_structured_light.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_phase_unwrapping.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_optflow.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_surface_matching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_tracking.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_highgui.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_datasets.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_plot.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_text.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videostab.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videoio.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_viz.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_wechat_qrcode.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xfeatures2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ml.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_shape.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ximgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_video.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xobjdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgcodecs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_calib3d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_features2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_flann.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xphoto.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_photo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_core.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_gapi.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stitching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_alphamat.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_aruco.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bgsegm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bioinspired.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ccalib.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dpm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_face.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_freetype.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_fuzzy.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_hfs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_img_hash.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_intensity_transform.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_line_descriptor.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_mcc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_quality.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rapid.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_reg.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rgbd.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_saliency.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_sfm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_signal.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stereo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_structured_light.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_phase_unwrapping.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_optflow.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_surface_matching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_tracking.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_highgui.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_datasets.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_plot.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_text.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videostab.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videoio.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_viz.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_wechat_qrcode.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xfeatures2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ml.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_shape.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ximgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_video.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xobjdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgcodecs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_calib3d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_features2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_flann.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xphoto.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_photo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_core.4.10.0.dylib
src/cpp/main: src/cpp/utilities/libUtilities.a
src/cpp/main: /opt/homebrew/lib/libopencv_gapi.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stitching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_alphamat.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_aruco.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bgsegm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bioinspired.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ccalib.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dpm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_face.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_freetype.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_fuzzy.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_hfs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_img_hash.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_intensity_transform.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_line_descriptor.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_mcc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_quality.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rapid.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_reg.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rgbd.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_saliency.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_sfm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_signal.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stereo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_structured_light.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_phase_unwrapping.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_optflow.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_surface_matching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_tracking.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_highgui.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_datasets.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_plot.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_text.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videostab.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videoio.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_viz.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_wechat_qrcode.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xfeatures2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ml.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_shape.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ximgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_video.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xobjdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgcodecs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_calib3d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_features2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_flann.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xphoto.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_photo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_core.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_gapi.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stitching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_alphamat.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_aruco.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bgsegm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_bioinspired.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ccalib.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dpm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_face.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_freetype.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_fuzzy.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_hfs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_img_hash.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_intensity_transform.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_line_descriptor.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_mcc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_quality.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rapid.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_reg.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_rgbd.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_saliency.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_sfm.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_signal.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_stereo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_structured_light.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_phase_unwrapping.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_superres.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_optflow.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_surface_matching.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_tracking.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_highgui.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_datasets.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_plot.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_text.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videostab.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_videoio.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_viz.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_wechat_qrcode.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xfeatures2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ml.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_shape.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_ximgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_video.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xobjdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgcodecs.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_objdetect.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_calib3d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_dnn.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_features2d.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_flann.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_xphoto.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_photo.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_imgproc.4.10.0.dylib
src/cpp/main: /opt/homebrew/lib/libopencv_core.4.10.0.dylib
src/cpp/main: src/cpp/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/aq_home/1Projects/target_streamer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable main"
	cd /Users/aq_home/1Projects/target_streamer/build/src/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/cpp/CMakeFiles/main.dir/build: src/cpp/main
.PHONY : src/cpp/CMakeFiles/main.dir/build

src/cpp/CMakeFiles/main.dir/clean:
	cd /Users/aq_home/1Projects/target_streamer/build/src/cpp && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : src/cpp/CMakeFiles/main.dir/clean

src/cpp/CMakeFiles/main.dir/depend:
	cd /Users/aq_home/1Projects/target_streamer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aq_home/1Projects/target_streamer /Users/aq_home/1Projects/target_streamer/src/cpp /Users/aq_home/1Projects/target_streamer/build /Users/aq_home/1Projects/target_streamer/build/src/cpp /Users/aq_home/1Projects/target_streamer/build/src/cpp/CMakeFiles/main.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/cpp/CMakeFiles/main.dir/depend
