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

# Utility rule file for dockingrobot_geneus.

# Include the progress variables for this target.
include dockingrobot/CMakeFiles/dockingrobot_geneus.dir/progress.make

dockingrobot_geneus: dockingrobot/CMakeFiles/dockingrobot_geneus.dir/build.make

.PHONY : dockingrobot_geneus

# Rule to build all files generated by this target.
dockingrobot/CMakeFiles/dockingrobot_geneus.dir/build: dockingrobot_geneus

.PHONY : dockingrobot/CMakeFiles/dockingrobot_geneus.dir/build

dockingrobot/CMakeFiles/dockingrobot_geneus.dir/clean:
	cd /home/robot/Documents/arduino_ws/build/dockingrobot && $(CMAKE_COMMAND) -P CMakeFiles/dockingrobot_geneus.dir/cmake_clean.cmake
.PHONY : dockingrobot/CMakeFiles/dockingrobot_geneus.dir/clean

dockingrobot/CMakeFiles/dockingrobot_geneus.dir/depend:
	cd /home/robot/Documents/arduino_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robot/Documents/arduino_ws/src /home/robot/Documents/arduino_ws/src/dockingrobot /home/robot/Documents/arduino_ws/build /home/robot/Documents/arduino_ws/build/dockingrobot /home/robot/Documents/arduino_ws/build/dockingrobot/CMakeFiles/dockingrobot_geneus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dockingrobot/CMakeFiles/dockingrobot_geneus.dir/depend
