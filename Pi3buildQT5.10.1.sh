#!/bin/bash

# Install QT5.10.1 on rasbian stretch 
cd
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install needed packages
sudo apt-get -y --force-yes install sense-hat libatspi-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl1.0-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev bluez libbluetooth-dev libasound2-dev pulseaudio libpulse-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer0.10-alsa gstreamer1.0-alsa gstreamer-tools libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev  gstreamer0.10-plugins-good gstreamer0.10-plugins-bad libraspberrypi-dev libpulse-devlibpq-dev libmariadbclient-dev

# Download QT 5.10.1 Source code
wget http://download.qt.io/official_releases/qt/5.10/5.10.1/single/qt-everywhere-src-5.10.1.tar.xz

# Untar Source code
tar xf qt-everywhere-src-5.10.1.tar.xz

# Delete source tarball to save some space
sudo rm -r qt-everywhere-src-5.10.1.tar.xz

# Delete qmake.conf for Raspberry Pi3
cd /home/pi/qt-everywhere-src-5.10.1/qtbase/mkspecs/devices/linux-rasp-pi3-g++
sudo rm qmake.conf

# Download modified qmake.conf for Raspberry Pi3
cd /home/pi/QT5.x-raspbian-stretch/qmakePi3
sudo cp qmake.conf /home/pi/qt-everywhere-src-5.10.1/qtbase/mkspecs/devices/linux-rasp-pi3-g++

# Create Shadow build directory 
cd
mkdir build
cd build

# create and Change ownership of QT install folder
sudo mkdir /opt/QT5
sudo chown pi:pi /opt/QT5

# Configure QT for Raspberry PI3 ARMv8
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig PKG_CONFIG_SYSROOT_DIR=/ \../qt-everywhere-src-5.10.1/configure -v -opengl es2 -eglfs -no-pch -no-gtk -device linux-rasp-pi3-g++ \-device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -reduce-exports \-force-pkg-config -nomake examples -no-compile-examples -skip qtwayland -skip qtwebengine -release \-qt-pcre -ssl -evdev -system-freetype -fontconfig -glib -gstreamer -prefix /opt/QT5


# Compile QT with 4 cores 
make -j4


# Install QT on the system 
sudo make install


# Add enviroment variables to bashrc
echo 'export LD_LIBRARY_PATH=/opt/QT5/lib' >> ~/.bashrc 
echo  'export PATH=/opt/QT5/bin:$PATH' >> ~/.bashrc 

# Install Lorn Potters Sensehat Plugin on the system 
mkdir /home/pi/senshatplugin
git clone https://github.com/lpotter/qsensors-sensehatplugin.git /home/pi/senshatplugin
cd /home/pi/senshatplugin
qmake
make -j4
sudo make install

# Delete shadow build directory
#cd
#sudo rm -r build

# Delete source code folder
#sudo rm -r qt-everywhere-opensource-src-5.9.4
