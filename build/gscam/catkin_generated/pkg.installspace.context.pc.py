# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include/gstreamer-1.0;/usr/include/glib-2.0;/usr/lib/aarch64-linux-gnu/glib-2.0/include".split(';') if "${prefix}/include;/usr/include/gstreamer-1.0;/usr/include/glib-2.0;/usr/lib/aarch64-linux-gnu/glib-2.0/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;nodelet;image_transport;sensor_msgs;camera_calibration_parsers;camera_info_manager".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgscam;-lgstapp-1.0;-lgstbase-1.0;-lgstreamer-1.0;-lgobject-2.0;-lglib-2.0".split(';') if "-lgscam;-lgstapp-1.0;-lgstbase-1.0;-lgstreamer-1.0;-lgobject-2.0;-lglib-2.0" != "" else []
PROJECT_NAME = "gscam"
PROJECT_SPACE_DIR = "/home/robot/Documents/arduino_ws/install"
PROJECT_VERSION = "1.0.1"
