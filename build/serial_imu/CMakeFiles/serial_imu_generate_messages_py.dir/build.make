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

# Utility rule file for serial_imu_generate_messages_py.

# Include the progress variables for this target.
include serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/progress.make

serial_imu/CMakeFiles/serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py
serial_imu/CMakeFiles/serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py
serial_imu/CMakeFiles/serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_data_package.py
serial_imu/CMakeFiles/serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py


/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py: /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_0x91_msg.msg
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py: /opt/ros/noetic/share/std_msgs/msg/Header.msg
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py: /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_data_package.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Python from MSG serial_imu/Imu_0x91_msg"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && ../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_0x91_msg.msg -Iserial_imu:/home/robot/Documents/arduino_ws/src/serial_imu/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p serial_imu -o /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg

/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py: /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_0x62_msg.msg
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py: /opt/ros/noetic/share/std_msgs/msg/Header.msg
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py: /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_data_package.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Python from MSG serial_imu/Imu_0x62_msg"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && ../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_0x62_msg.msg -Iserial_imu:/home/robot/Documents/arduino_ws/src/serial_imu/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p serial_imu -o /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg

/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_data_package.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_data_package.py: /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_data_package.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating Python from MSG serial_imu/Imu_data_package"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && ../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py /home/robot/Documents/arduino_ws/src/serial_imu/msg/Imu_data_package.msg -Iserial_imu:/home/robot/Documents/arduino_ws/src/serial_imu/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p serial_imu -o /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg

/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py: /opt/ros/noetic/lib/genpy/genmsg_py.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py
/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_data_package.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/robot/Documents/arduino_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating Python msg __init__.py for serial_imu"
	cd /home/robot/Documents/arduino_ws/build/serial_imu && ../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py -o /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg --initpy

serial_imu_generate_messages_py: serial_imu/CMakeFiles/serial_imu_generate_messages_py
serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x91_msg.py
serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_0x62_msg.py
serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/_Imu_data_package.py
serial_imu_generate_messages_py: /home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/serial_imu/msg/__init__.py
serial_imu_generate_messages_py: serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/build.make

.PHONY : serial_imu_generate_messages_py

# Rule to build all files generated by this target.
serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/build: serial_imu_generate_messages_py

.PHONY : serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/build

serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/clean:
	cd /home/robot/Documents/arduino_ws/build/serial_imu && $(CMAKE_COMMAND) -P CMakeFiles/serial_imu_generate_messages_py.dir/cmake_clean.cmake
.PHONY : serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/clean

serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/depend:
	cd /home/robot/Documents/arduino_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robot/Documents/arduino_ws/src /home/robot/Documents/arduino_ws/src/serial_imu /home/robot/Documents/arduino_ws/build /home/robot/Documents/arduino_ws/build/serial_imu /home/robot/Documents/arduino_ws/build/serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : serial_imu/CMakeFiles/serial_imu_generate_messages_py.dir/depend

