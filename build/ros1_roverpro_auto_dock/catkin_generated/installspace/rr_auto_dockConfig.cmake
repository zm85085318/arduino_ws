# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(rr_auto_dock_CONFIG_INCLUDED)
  return()
endif()
set(rr_auto_dock_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(rr_auto_dock_SOURCE_PREFIX /home/robot/Documents/arduino_ws/src/ros1_roverpro_auto_dock)
  set(rr_auto_dock_DEVEL_PREFIX /home/robot/Documents/arduino_ws/devel)
  set(rr_auto_dock_INSTALL_PREFIX "")
  set(rr_auto_dock_PREFIX ${rr_auto_dock_DEVEL_PREFIX})
else()
  set(rr_auto_dock_SOURCE_PREFIX "")
  set(rr_auto_dock_DEVEL_PREFIX "")
  set(rr_auto_dock_INSTALL_PREFIX /home/robot/Documents/arduino_ws/install)
  set(rr_auto_dock_PREFIX ${rr_auto_dock_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'rr_auto_dock' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(rr_auto_dock_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include;/usr/include/opencv4 " STREQUAL " ")
  set(rr_auto_dock_INCLUDE_DIRS "")
  set(_include_dirs "include;/usr/include/opencv4")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://ros.org/wiki/rr_auto_dock " STREQUAL " ")
    set(_report "Check the website 'http://ros.org/wiki/rr_auto_dock' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Jack Kilian <jack@digilabs.io>, Nick Fragale <fragale@digilabs.io>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${rr_auto_dock_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'rr_auto_dock' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'rr_auto_dock' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(rr_auto_dock_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "image_sub_nodelet;/usr/lib/aarch64-linux-gnu/libopencv_calib3d.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_core.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_dnn.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_features2d.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_flann.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_highgui.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_imgcodecs.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_ml.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_objdetect.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_photo.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_stitching.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_video.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_videoio.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_aruco.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_bgsegm.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_bioinspired.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_ccalib.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_datasets.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_dnn_superres.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_dpm.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_face.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_freetype.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_fuzzy.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_hdf.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_hfs.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_img_hash.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_line_descriptor.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_optflow.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_plot.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_quality.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_reg.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_rgbd.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_saliency.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_shape.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_stereo.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_structured_light.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_superres.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_surface_matching.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_text.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_tracking.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_videostab.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_viz.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_ximgproc.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_xobjdetect.so.4.2.0;/usr/lib/aarch64-linux-gnu/libopencv_xphoto.so.4.2.0")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND rr_auto_dock_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND rr_auto_dock_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT rr_auto_dock_NUM_DUMMY_TARGETS)
      set(rr_auto_dock_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::rr_auto_dock::wrapped-linker-option${rr_auto_dock_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR rr_auto_dock_NUM_DUMMY_TARGETS "${rr_auto_dock_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::rr_auto_dock::wrapped-linker-option${rr_auto_dock_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND rr_auto_dock_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND rr_auto_dock_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND rr_auto_dock_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/robot/Documents/arduino_ws/install/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(rr_auto_dock_LIBRARY_DIRS ${lib_path})
      list(APPEND rr_auto_dock_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'rr_auto_dock'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND rr_auto_dock_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(rr_auto_dock_EXPORTED_TARGETS "rr_auto_dock_gencfg")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${rr_auto_dock_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "nodelet;message_runtime;roscpp;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 rr_auto_dock_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${rr_auto_dock_dep}_FOUND)
      find_package(${rr_auto_dock_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${rr_auto_dock_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(rr_auto_dock_INCLUDE_DIRS ${${rr_auto_dock_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(rr_auto_dock_LIBRARIES ${rr_auto_dock_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${rr_auto_dock_dep}_LIBRARIES})
  _list_append_deduplicate(rr_auto_dock_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(rr_auto_dock_LIBRARIES ${rr_auto_dock_LIBRARIES})

  _list_append_unique(rr_auto_dock_LIBRARY_DIRS ${${rr_auto_dock_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(rr_auto_dock_EXPORTED_TARGETS ${${rr_auto_dock_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${rr_auto_dock_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
