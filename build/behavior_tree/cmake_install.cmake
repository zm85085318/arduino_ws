# Install script for directory: /home/robot/Documents/arduino_ws/src/behavior_tree

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robot/Documents/arduino_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/msg" TYPE FILE FILES "/home/robot/Documents/arduino_ws/src/behavior_tree/msg/Analog.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/action" TYPE FILE FILES
    "/home/robot/Documents/arduino_ws/src/behavior_tree/action/RobotStatusController.action"
    "/home/robot/Documents/arduino_ws/src/behavior_tree/action/TurningAround.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/msg" TYPE FILE FILES
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerAction.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerActionGoal.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerActionResult.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerActionFeedback.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerGoal.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerResult.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/RobotStatusControllerFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/msg" TYPE FILE FILES
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundAction.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundActionGoal.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundActionResult.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundActionFeedback.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundGoal.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundResult.msg"
    "/home/robot/Documents/arduino_ws/devel/share/behavior_tree/msg/TurningAroundFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/cmake" TYPE FILE FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/behavior_tree-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/robot/Documents/arduino_ws/devel/include/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/robot/Documents/arduino_ws/devel/share/roseus/ros/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/robot/Documents/arduino_ws/devel/share/common-lisp/ros/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/robot/Documents/arduino_ws/devel/share/gennodejs/ros/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/robot/Documents/arduino_ws/devel/lib/python3/dist-packages/behavior_tree")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/behavior_tree.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/cmake" TYPE FILE FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/behavior_tree-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree/cmake" TYPE FILE FILES
    "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/behavior_treeConfig.cmake"
    "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/behavior_treeConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/behavior_tree" TYPE FILE FILES "/home/robot/Documents/arduino_ws/src/behavior_tree/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/behavior_tree" TYPE PROGRAM FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/voltage_translate.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/behavior_tree" TYPE PROGRAM FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/status_converter.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/behavior_tree" TYPE PROGRAM FILES "/home/robot/Documents/arduino_ws/build/behavior_tree/catkin_generated/installspace/light_translate.py")
endif()

