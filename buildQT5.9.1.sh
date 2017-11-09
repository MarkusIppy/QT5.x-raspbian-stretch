#!/bin/bash

# Install QT5.9.1 on rasbian stretch 

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install needed packages
sudo apt-get -y --force-yes install libatspi-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl1.0-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev bluez libbluetooth-dev libasound2-dev pulseaudio libpulse-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-alsa gstreamer-tools libpq-dev libmariadbclient-dev libwayland-dev


# Download QT 5.9.1 Source code
wget http://download.qt.io/official_releases/qt/5.9/5.9.1/single/qt-everywhere-opensource-src-5.9.1.tar.xz

# Untar Source code
tar xf qt-everywhere-opensource-src-5.9.1.tar.xz

# Delete source tarball to save some space
sudo rm -r qt-everywhere-opensource-src-5.9.1.tar.xz

# Delete qmake.conf for Raspberry Pi2 
cd /home/pi/qt-everywhere-opensource-src-5.9.1/qtbase/mkspecs/devices/linux-rasp-pi2-g++
sudo rm qmake.conf

# Download modified qmake.conf for Raspberry Pi2
wget https://github.com/MarkusIppy/QT5.9.2-raspbian-stretch/qmake.conf

# Create Shadow build directory 
cd
mkdir build
cd build

# create and Change ownership of QT5.9 install folder
sudo mkdir /opt/Qt5.9
sudo chown pi:pi /opt/Qt5.9

# Configure QT for Raspberry PI2 ARMv7
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig PKG_CONFIG_SYSROOT_DIR=/ \../qt-everywhere-opensource-src-5.9.1/configure -v -opengl es2 -eglfs -no-gtk -device linux-rasp-pi2-g++ \-device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -reduce-exports \-force-pkg-config -nomake examples -no-compile-examples -skip qtwayland -skip qtwebengine -release \-qt-pcre -ssl -evdev -system-freetype -fontconfig -glib -prefix /opt/Qt5.9


# Compile QT with 4 cores 
make -j4


# Install QT on the system 
sudo make install

# Add enviroment variables to bashrc
echo 'export LD_LIBRARY_PATH=/opt/Qt5.9/lib' >> ~/.bashrc 
echo  'export PATH=/opt/Qt5.9/bin:$PATH' >> ~/.bashrc 

# Delete shadow build directory
# cd
# sudo rm -r build

# Delete source code folder
# sudo rm -r qt-everywhere-opensource-src-5.9.1
