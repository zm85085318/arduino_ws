# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robot/Documents/arduino_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robot/Documents/arduino_ws/build

# Include any dependencies generated for this target.
include serial_imu/CMakeFiles/sub_spec.dir/depend.make

# Include the progress variables for this target.
include serial_imu/CMakeFiles/sub_spec.dir/progress.make

# Include the compile flags for this target's objects.
include serial_imu/CMakeFiles/sub_spec.dir/flags.make

serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o: serial_imu/CMakeFiles/sub_spec.dir/flags.make
serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o: /home/robot/Documents/arduino_ws/src/serial_imu/src/sub_spec.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o -c /home/robot/Documents/arduino_ws/src/serial_imu/src/sub_spec.cpp

serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sub_spec.dir/src/sub_spec.cpp.i"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robot/Documents/arduino_ws/src/serial_imu/src/sub_spec.cpp > CMakeFiles/sub_spec.dir/src/sub_spec.cpp.i

serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sub_spec.dir/src/sub_spec.cpp.s"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robot/Documents/arduino_ws/src/serial_imu/src/sub_spec.cpp -o CMakeFiles/sub_spec.dir/src/sub_spec.cpp.s

# Object files for target sub_spec
sub_spec_OBJECTS = \
"CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o"

# External object files for target sub_spec
sub_spec_EXTERNAL_OBJECTS =

/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: serial_imu/CMakeFiles/sub_spec.dir/src/sub_spec.cpp.o
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: serial_imu/CMakeFiles/sub_spec.dir/build.make
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/libroscpp.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_chrono.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/librosconsole.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_regex.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/libserial.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/librostime.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_date_time.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /opt/ros/noetic/lib/libcpp_common.so
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_system.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libboost_thread.so.1.71.0
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec: serial_imu/CMakeFiles/sub_spec.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sub_spec.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
serial_imu/CMakeFiles/sub_spec.dir/build: /home/robot/Documents/arduino_ws/devel/lib/serial_imu/sub_spec

.PHONY : serial_imu/CMakeFiles/sub_spec.dir/build

serial_imu/CMakeFiles/sub_spec.dir/clean:
	cd /home/robot/Documents/arduino_ws/build/serial_imu && $(CMAKE_COMMAND) -P CMakeFiles/sub_spec.dir/cmake_clean.cmake
.PHONY : serial_imu/CMakeFiles/sub_spec.dir/clean

serial_imu/CMakeFiles/sub_spec.dir/depend:
	cd /home/robot/Documents/arduino_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robot/Documents/arduino_ws/src /home/robot/Documents/arduino_ws/src/serial_imu /home/robot/Documents/arduino_ws/build /home/robot/Documents/arduino_ws/build/serial_imu /home/robot/Documents/arduino_ws/build/serial_imu/CMakeFiles/sub_spec.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : serial_imu/CMakeFiles/sub_spec.dir/depend
