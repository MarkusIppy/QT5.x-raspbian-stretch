#!/bin/bash

# Install QT5.9.2 on rasbian stretch 

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install needed packages
sudo apt-get -y --force-yes install libatspi-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl1.0-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev bluez libbluetooth-dev libasound2-dev pulseaudio libpulse-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-alsa gstreamer-tools libpq-dev libmariadbclient-dev libwayland-dev


# Download QT 5.9.2 Source code
wget http://download.qt.io/official_releases/qt/5.9/5.9.2/single/qt-everywhere-opensource-src-5.9.2.tar.xz

# Untar Source code
tar xf qt-everywhere-opensource-src-5.9.2.tar.xz

# Delete source tarball to save some space
sudo rm -r qt-everywhere-opensource-src-5.9.2.tar.xz

# Download modified qmake.conf for Raspberry Pi2 and overwrite old qmake.conf
wget https://github.com/MarkusIppy/QT5.9.2-raspbian-stretch/blob/master/qmakepi2.conf
sudo cp /home/pi/qmakepi2.conf /home/pi/qt-everywhere-opensource-src-5.9.2\qtbase\mkspecs\devices\linux-rasp-pi2-g++/qmake.conf


# Create Shadow build directory 
mkdir build
cd build


# ***************************************************************************
# We unfortunatly have to fix some librarynames.
#sudo cp /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.bak
#sudo cp /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.bak

#sudo mv /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.2
#sudo mv /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1

# Fix libraries (not sure if this is needed) 
# sudo ln -fs /opt/vc/lib/libGLESv2.so /opt/vc/lib/libGLESv2.so.2
# sudo ln -fs /opt/vc/lib/libEGL.so /opt/vc/lib/libEGL.so.1
# sudo ldconfig
# ***************************************************************************



# Uncomment the configuration for your raspberry PI version (Default is PI2)

# Raspberry PI Configuration ARMv6
#PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig PKG_CONFIG_SYSROOT_DIR=/ \../qt-everywhere-opensource-src-5.9.2/configure -v -opengl es2 -eglfs -no-gtk -device linux-rasp-pi-g++ \-device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -reduce-exports \-force-pkg-config -nomake examples -no-compile-examples -skip qtwayland -skip qtwebengine -release \-qt-pcre -ssl -evdev -system-freetype -fontconfig -glib -prefix /opt/Qt5.9

# Raspberry PI2 Configuration ARMv7 (default)
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig PKG_CONFIG_SYSROOT_DIR=/ \../qt-everywhere-opensource-src-5.9.2/configure -v -opengl es2 -eglfs -no-gtk -device linux-rasp-pi2-g++ \-device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -reduce-exports \-force-pkg-config -nomake examples -no-compile-examples -skip qtwayland -skip qtwebengine -release \-qt-pcre -ssl -evdev -system-freetype -fontconfig -glib -prefix /opt/Qt5.9

# Raspberry PI3 Configuration ARMv8
#PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig PKG_CONFIG_SYSROOT_DIR=/ \../qt-everywhere-opensource-src-5.9.2/configure -v -opengl es2 -eglfs -no-gtk -device linux-rasp-pi3-g++ \-device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -reduce-exports \-force-pkg-config -nomake examples -no-compile-examples -skip qtwayland -skip qtwebengine -release \-qt-pcre -ssl -evdev -system-freetype -fontconfig -glib -prefix /opt/Qt5.9


# Compile QT with 4 cores ( remove -j4 if building on Pi)
make -j4


# Install QT on the system 
make install

#Delete shadow build directory (optional) 
#cd
#sudo rm -r build

