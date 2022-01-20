# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "distanceangle: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idistanceangle:/home/robot/Documents/arduino_ws/src/distanceangle/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(distanceangle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_custom_target(_distanceangle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "distanceangle" "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(distanceangle
  "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distanceangle
)

### Generating Services

### Generating Module File
_generate_module_cpp(distanceangle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distanceangle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(distanceangle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(distanceangle_generate_messages distanceangle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_dependencies(distanceangle_generate_messages_cpp _distanceangle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distanceangle_gencpp)
add_dependencies(distanceangle_gencpp distanceangle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distanceangle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(distanceangle
  "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distanceangle
)

### Generating Services

### Generating Module File
_generate_module_eus(distanceangle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distanceangle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(distanceangle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(distanceangle_generate_messages distanceangle_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_dependencies(distanceangle_generate_messages_eus _distanceangle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distanceangle_geneus)
add_dependencies(distanceangle_geneus distanceangle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distanceangle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(distanceangle
  "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distanceangle
)

### Generating Services

### Generating Module File
_generate_module_lisp(distanceangle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distanceangle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(distanceangle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(distanceangle_generate_messages distanceangle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_dependencies(distanceangle_generate_messages_lisp _distanceangle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distanceangle_genlisp)
add_dependencies(distanceangle_genlisp distanceangle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distanceangle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(distanceangle
  "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distanceangle
)

### Generating Services

### Generating Module File
_generate_module_nodejs(distanceangle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distanceangle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(distanceangle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(distanceangle_generate_messages distanceangle_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_dependencies(distanceangle_generate_messages_nodejs _distanceangle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distanceangle_gennodejs)
add_dependencies(distanceangle_gennodejs distanceangle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distanceangle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(distanceangle
  "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distanceangle
)

### Generating Services

### Generating Module File
_generate_module_py(distanceangle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distanceangle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(distanceangle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(distanceangle_generate_messages distanceangle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/Documents/arduino_ws/src/distanceangle/msg/DistanceAngle.msg" NAME_WE)
add_dependencies(distanceangle_generate_messages_py _distanceangle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(distanceangle_genpy)
add_dependencies(distanceangle_genpy distanceangle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS distanceangle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distanceangle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/distanceangle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(distanceangle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distanceangle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/distanceangle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(distanceangle_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distanceangle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/distanceangle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(distanceangle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distanceangle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/distanceangle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(distanceangle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distanceangle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distanceangle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/distanceangle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(distanceangle_generate_messages_py std_msgs_generate_messages_py)
endif()
