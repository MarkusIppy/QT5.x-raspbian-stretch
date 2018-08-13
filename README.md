# QT5.10.1 -Raspbian-Stretch

Automated installation scripts to compile QT5 on Raspbian Stretch for Raspberry PI with EGLFS support
This whole process takes about 4-6 hours on a Raspberry Pi2. 
Compile scripts for Pi2 (armV7) and Pi3 (armV8)
The script is based on this tutorial http://www.tal.org/tutorials/building-qt-58-raspberry-pi-debian-stretch

Usage :
Download raspbian Stretch from:
https://www.raspberrypi.org/downloads/raspbian/
and install it on your SD card (the lite version will be enough) 

After booting up your PI, follw the steps below :


Increase Rpi's swap size. As root, edit the file /etc/dphys-swapfile and modify the variable CONF_SWAPSIZE
```
CONF_SWAPSIZE=2048
```

Run dphys-swapfile setup which will create and initialize the file.

```
$ sudo dphys-swapfile swapon
```

Source : https://wpitchoune.net/tricks/raspberry_pi3_increase_swap_size.html

After increasing the swap size,

```
$ sudo raspi-config
```
Set GPU to 256 and enable ssh (ssh is optional) 
```
$ sudo apt-get update
```
```
$ sudo apt-get install git
```

```
$ git clone https://github.com/MarkusIppy/QT5.x-raspbian-stretch.git
```
```
$ cd QT5.x-raspbian-stretch
```
Dependent if you want to install for Pi2 or Pi3

For Pi2 :
```
$sudo chmod +x Pi2buildQT5.10.1.sh
```
```
$./Pi2buildQT5.10.1.sh
```


For Pi3 :
```
$sudo chmod +x Pi3buildQT5.10.1.sh
```
```
$./Pi3buildQT5.10.1.sh
```

```
Configure summary:

Building on: linux-g++ (arm, CPU features: <none>)
Building for: devices/linux-rasp-pi2-g++ (arm, CPU features: neon)
Configuration: cross_compile use_gold_linker enable_new_dtags largefile neon precompile_header shared rpath release c++11 c++14 c++1z concurrent dbus reduce_exports stl
Build options:
  Mode ................................... release
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C++ standard ..................... C++1z
  Using ccache ........................... no
  Using gold linker ...................... yes
  Using new DTAGS ........................ yes
  Using precompiled headers .............. yes
  Using LTCG ............................. no
  Target compiler supports:
    NEON ................................. yes
  Build parts ............................ libs
Qt modules and options:
  Qt Concurrent .......................... yes
  Qt D-Bus ............................... yes
  Qt D-Bus directly linked to libdbus .... yes
  Qt Gui ................................. yes
  Qt Network ............................. yes
  Qt Sql ................................. yes
  Qt Testlib ............................. yes
  Qt Widgets ............................. yes
  Qt Xml ................................. yes
Support enabled for:
  Using pkg-config ....................... yes
  QML debugging .......................... yes
  udev ................................... yes
  Using system zlib ...................... yes
Qt Core:
  DoubleConversion ....................... yes
    Using system DoubleConversion ........ no
  GLib ................................... yes
  iconv .................................. no
  ICU .................................... yes
  Logging backends:
    journald ............................. no
    syslog ............................... no
    slog2 ................................ no
  Using system PCRE2 ..................... no
Qt Network:
  getaddrinfo() .......................... yes
  getifaddrs() ........................... yes
  IPv6 ifname ............................ yes
  libproxy ............................... no
  OpenSSL ................................ yes
    Qt directly linked to OpenSSL ........ no
  SCTP ................................... no
  Use system proxies ..................... yes
Qt Gui:
  Accessibility .......................... yes
  FreeType ............................... yes
    Using system FreeType ................ yes
  HarfBuzz ............................... yes
    Using system HarfBuzz ................ no
  Fontconfig ............................. yes
  Image formats:
    GIF .................................. yes
    ICO .................................. yes
    JPEG ................................. yes
      Using system libjpeg ............... yes
    PNG .................................. yes
      Using system libpng ................ yes
  EGL .................................... yes
  OpenVG ................................. no
  OpenGL:
    Desktop OpenGL ....................... no
    OpenGL ES 2.0 ........................ yes
    OpenGL ES 3.0 ........................ no
    OpenGL ES 3.1 ........................ no
  Session Management ..................... yes
Features used by QPA backends:
  evdev .................................. yes
  libinput ............................... yes
  INTEGRITY HID .......................... no
  mtdev .................................. no
  tslib .................................. no
  xkbcommon-evdev ........................ yes
QPA backends:
  DirectFB ............................... no
  EGLFS .................................. yes
  EGLFS details:
    EGLFS i.Mx6 .......................... no
    EGLFS i.Mx6 Wayland .................. no
    EGLFS EGLDevice ...................... no
    EGLFS GBM ............................ no
    EGLFS Mali ........................... no
    EGLFS Raspberry Pi ................... yes
    EGL on X11 ........................... no
  LinuxFB ................................ yes
  VNC .................................... yes
  Mir client ............................. no
  X11:
    Using system-provided XCB libraries .. no
    EGL on X11 ........................... no
    Xinput2 .............................. no
    XCB XKB .............................. yes
    XLib ................................. no
    XCB render ........................... yes
    XCB GLX .............................. no
    XCB Xlib ............................. no
    Using system-provided xkbcommon ...... no
Qt Widgets:
  GTK+ ................................... no
  Styles ................................. Fusion Windows
Qt PrintSupport:
  CUPS ................................... yes
Qt Sql:
  DB2 (IBM) .............................. no
  InterBase .............................. no
  MySql .................................. yes
  OCI (Oracle) ........................... no
  ODBC ................................... no
  PostgreSQL ............................. yes
  SQLite2 ................................ no
  SQLite ................................. yes
    Using system provided SQLite ......... no
  TDS (Sybase) ........................... no
Qt SerialBus:
  Socket CAN ............................. yes
  Socket CAN FD .......................... yes
QtXmlPatterns:
  XML schema support ..................... yes
Qt QML:
  QML interpreter ........................ yes
  QML network support .................... yes
Qt Quick:
  Direct3D 12 ............................ no
  AnimatedImage item ..................... yes
  Canvas item ............................ yes
  Support for Qt Quick Designer .......... yes
  Flipable item .......................... yes
  GridView item .......................... yes
  ListView item .......................... yes
  Path support ........................... yes
  PathView item .......................... yes
  Positioner items ....................... yes
  ShaderEffect item ...................... yes
  Sprite item ............................ yes
Qt Gamepad:
  SDL2 ................................... no
Qt 3D:
  Assimp ................................. yes
  System Assimp .......................... no
  Output Qt3D Job traces ................. no
  Output Qt3D GL traces .................. no
Qt 3D GeometryLoaders:
  Autodesk FBX ........................... no
Qt Bluetooth:
  BlueZ .................................. yes
  BlueZ Low Energy ....................... yes
  Linux Crypto API ....................... yes
Qt Sensors:
  sensorfw ............................... no
Qt Quick Controls 2:
  Styles ................................. Default Material Universal
Qt Quick Templates 2:
  Hover support .......................... yes
  Multi-touch support .................... yes
Qt Positioning:
  Gypsy GPS Daemon ....................... no
  WinRT Geolocation API .................. no
Qt Location:
  Geoservice plugins:
    OpenStreetMap ........................ yes
    HERE ................................. yes
    Esri ................................. yes
    Mapbox ............................... yes
    MapboxGL ............................. yes
    Itemsoverlay ......................... yes
Qt Multimedia:
  ALSA ................................... yes
  GStreamer 1.0 .......................... yes
  GStreamer 0.10 ......................... no
  Video for Linux ........................ yes
  OpenAL ................................. no
  PulseAudio ............................. yes
  Resource Policy (libresourceqt5) ....... no
  Windows Audio Services ................. no
  DirectShow ............................. no
  Windows Media Foundation ............... no

Note: Also available for Linux: linux-clang linux-icc

Note: Dropped compiler flags '-pthread' when detecting library 'glib'.

Note: Disabling X11 Accessibility Bridge: D-Bus or AT-SPI is missing.

Note: Dropped compiler flags '-pthread' when detecting library 'gstreamer'.

Note: Dropped compiler flags '-pthread' when detecting library 'gstreamer_app'.

Qt is now configured for building. Just run 'make'.
Once everything is built, you must run 'make install'.
Qt will be installed into '/opt/Qt5.9'.

Prior to reconfiguration, make sure you remove any leftovers from
the previous build.
```




If everything is working you can delete the build folder as well as the source code folder 

Happy coding :-)
