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

# Utility rule file for dockingrobot_generate_messages_cpp.

# Include the progress variables for this target.
include dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/progress.make

dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp: /home/robot/Documents/arduino_ws/devel/include/dockingrobot/Docking.h
dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp: /home/robot/Documents/arduino_ws/devel/include/dockingrobot/Command.h


/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Docking.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Docking.h: /home/robot/Documents/arduino_ws/src/dockingrobot/msg/Docking.msg
/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Docking.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from dockingrobot/Docking.msg"
	cd /home/robot/Documents/arduino_ws/src/dockingrobot && /home/robot/Documents/arduino_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/robot/Documents/arduino_ws/src/dockingrobot/msg/Docking.msg -Idockingrobot:/home/robot/Documents/arduino_ws/src/dockingrobot/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p dockingrobot -o /home/robot/Documents/arduino_ws/devel/include/dockingrobot -e /opt/ros/noetic/share/gencpp/cmake/..

/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Command.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Command.h: /home/robot/Documents/arduino_ws/src/dockingrobot/msg/Command.msg
/home/robot/Documents/arduino_ws/devel/include/dockingrobot/Command.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating C++ code from dockingrobot/Command.msg"
	cd /home/robot/Documents/arduino_ws/src/dockingrobot && /home/robot/Documents/arduino_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/robot/Documents/arduino_ws/src/dockingrobot/msg/Command.msg -Idockingrobot:/home/robot/Documents/arduino_ws/src/dockingrobot/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p dockingrobot -o /home/robot/Documents/arduino_ws/devel/include/dockingrobot -e /opt/ros/noetic/share/gencpp/cmake/..

dockingrobot_generate_messages_cpp: dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp
dockingrobot_generate_messages_cpp: /home/robot/Documents/arduino_ws/devel/include/dockingrobot/Docking.h
dockingrobot_generate_messages_cpp: /home/robot/Documents/arduino_ws/devel/include/dockingrobot/Command.h
dockingrobot_generate_messages_cpp: dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/build.make

.PHONY : dockingrobot_generate_messages_cpp

# Rule to build all files generated by this target.
dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/build: dockingrobot_generate_messages_cpp

.PHONY : dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/build

dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/clean:
	cd /home/robot/Documents/arduino_ws/build/dockingrobot && $(CMAKE_COMMAND) -P CMakeFiles/dockingrobot_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/clean

dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/depend:
	cd /home/robot/Documents/arduino_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robot/Documents/arduino_ws/src /home/robot/Documents/arduino_ws/src/dockingrobot /home/robot/Documents/arduino_ws/build /home/robot/Documents/arduino_ws/build/dockingrobot /home/robot/Documents/arduino_ws/build/dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dockingrobot/CMakeFiles/dockingrobot_generate_messages_cpp.dir/depend

