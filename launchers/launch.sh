#!/bin/bash
set -x

ARCH=aarch64-linux-gnu

export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/pulseaudio:$LD_LIBRARY_PATH

# Mesa Libs
# paths don't exist in snap. adding mesa stage packages
export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/mesa:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$SNAP/usr/lib/$ARCH/mesa-egl:$LD_LIBRARY_PATH

# Qt Modules
export QT_PLUGIN_PATH=$SNAP/usr/lib/$ARCH/qt5/plugins
#this path does not exist, not sure if needed
export QML2_IMPORT_PATH=$SNAP/usr/lib/$ARCH/qt5/qml
export QML2_IMPORT_PATH=$QML2_IMPORT_PATH:$SNAP/lib/$ARCH

# XDG Config
export XDG_CONFIG_DIRS=$SNAP/etc/xdg:$XDG_CONFIG_DIRS
# this path does not exist 
export XDG_CONFIG_DIRS=$SNAP/usr/xdg:$XDG_CONFIG_DIRS
# Note: this doesn't seem to work, QML's LocalStorage either ignores
# or fails to use $SNAP_USER_DATA if defined here
export XDG_DATA_DIRS=$SNAP_USER_DATA:$XDG_DATA_DIRS
export XDG_DATA_DIRS=$SNAP/usr/share:$XDG_DATA_DIRS

# Not good, needed for fontconfig
export XDG_DATA_HOME=$SNAP/usr/share

# Font Config
export FONTCONFIG_PATH=$SNAP/etc/fonts/config.d
export FONTCONFIG_FILE=$SNAP/etc/fonts/fonts.conf

# Tell libGL where to find the drivers
export LIBGL_DRIVERS_PATH=$SNAP/usr/lib/$ARCH/dri

# Necessary for the SDK to find the translations directory
export APP_DIR=$SNAP

# ensure the snappy gl libs win
export LD_LIBRARY_PATH="$SNAP_LIBRARY_PATH:$LD_LIBRARY_PATH"

export QTDIR=$SNAP/usr/lib/x86_64-linux-gnu/qt5/
export QT_PLUGIN_PATH=$QTDIR/plugins/
export QML2_IMPORT_PATH=$QTDIR/qml/
export QT_LOGGING_RULES=qt.qpa.*=true
export QT_DEBUG_PLUGINS=1

export QT_QPA_PLATFORM=wayland
#export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
export QML_IMPORT_TRACE=1

wayland-launch $SNAP/usr/bin/qmlscene app.qml --fullscreen

#$SNAP/usr/bin/qmlscene app.qml
