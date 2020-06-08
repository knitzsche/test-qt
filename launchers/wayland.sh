#!/bin/bash
set -x

run-daemon wayland-launch $SNAP/usr/bin/qmlscene app.qml --fullscreen

