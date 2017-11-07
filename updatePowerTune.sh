#!/bin/bash
set -x #echo on

# Update PowerTune source code on the PI
echo "Update Source Code"
git pull https://github.com/BastianGschrey/PowerTune.git


# CD to the build output directory
echo "Enter installation directory"
cd /opt/PowerTuneQMLGui

# Call qmake referencing the .pro file
echo "Executing qmake"
qmake /home/pi/PowerTune-master/PowertuneQMLGui.pro

# compile PowerTune with 4 cores 
echo "Compiling PowerTune"
make -j4

echo "Finished your Pi will restart now "
sudo reboot now