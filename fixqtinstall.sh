#!/bin/bash

cd /home/pi/build/qtbase
make -j4
sudo make install

cd /home/pi/build/qt3d
make -j4
sudo make install

cd /home/pi/build/qtactiveqt
make -j4
sudo make install

cd /home/pi/build/qtcanvas3d
make -j4
sudo make install

cd /home/pi/build/qtdeclarative
make -j4
sudo make install

cd /home/pi/build/qtdoc
make -j4
sudo make install

cd /home/pi/build/qtgamepad
make -j4
sudo make install

cd /home/pi/build/qtgraphicaleffects
make -j4
sudo make install

cd /home/pi/build/qtimageformats
make -j4
sudo make install

cd /home/pi/build/qtlocation
make -j4
sudo make install

cd /home/pi/build/qtmultimedia
make -j4
sudo make install

cd /home/pi/build/qtnetworkauth
make -j4
sudo make install

cd /home/pi/build/qtscript
make -j4
sudo make install

cd /home/pi/build/qtscxml
make -j4
sudo make install

cd /home/pi/build/qtpurchasing
make -j4
sudo make install

cd /home/pi/build/qtquickcontrols
make -j4
sudo make install

cd /home/pi/build/qtquickcontrols2
make -j4
sudo make install

cd /home/pi/build/qtsensors
make -j4
sudo make install

cd /home/pi/build/qtserialbus
make -j4
sudo make install

cd /home/pi/build/qtserialport
make -j4
sudo make install

cd /home/pi/build/qtspeech
make -j4
sudo make install

cd /home/pi/build/qtsvg
make -j4
sudo make install

cd /home/pi/build/qttools
make -j4
sudo make install

cd /home/pi/build/qttranslations
make -j4
sudo make install

cd /home/pi/build/qtvirtualkeyboard
make -j4
sudo make install

cd /home/pi/build/qtwebchannel
make -j4
sudo make install

cd /home/pi/build/qtwebsockets
make -j4
sudo make install

cd /home/pi/build/qtwebengine
make -j4
sudo make install

cd /home/pi/build/qtwebview
make -j4
sudo make install

cd /home/pi/build/qtcharts
make -j4
sudo make install

cd /home/pi/build/qtconnectivity
make -j4
sudo make install

cd /home/pi/build/qtdatavis3d
make -j4
sudo make install

