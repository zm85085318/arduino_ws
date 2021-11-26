execute_process(COMMAND "/home/lostm/文档/arduino_ws/build/ros_arduino_bridge-indigo-devel/ros_arduino_python/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/lostm/文档/arduino_ws/build/ros_arduino_bridge-indigo-devel/ros_arduino_python/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
