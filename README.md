# QT5.9.2-raspbian-stretch

Automated installation script to compile QT5.9.2 on Raspbian Stretch for Raspberry PI with EGLFS support
This whole process takes about 4-6 hours on a Raspberry Pi2.
The script is based on this tutorial http://www.tal.org/tutorials/building-qt-58-raspberry-pi-debian-stretch

Usage :
Download raspbian Stretch from:
https://www.raspberrypi.org/downloads/raspbian/
and install it on your SD card

After booting up your PI, follw the steps below :

```
$wget https://github.com/MarkusIppy/QT5.9.2-raspbian-stretch/blob/master/buildQT5.9.sh
```
```
$sudo chmod +x buildQT5.9.sh
```
```
$./buildQT5.9.sh
```

