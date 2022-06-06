#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/lostm/文档/arduino_ws/src/ros_arduino_bridge/ros_arduino_python"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/lostm/文档/arduino_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/lostm/文档/arduino_ws/install/lib/python3/dist-packages:/home/lostm/文档/arduino_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/lostm/文档/arduino_ws/build" \
    "/usr/bin/python3" \
    "/home/lostm/文档/arduino_ws/src/ros_arduino_bridge/ros_arduino_python/setup.py" \
     \
    build --build-base "/home/lostm/文档/arduino_ws/build/ros_arduino_bridge/ros_arduino_python" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/lostm/文档/arduino_ws/install" --install-scripts="/home/lostm/文档/arduino_ws/install/bin"
