sudo apt-get install --no-install-recommends xserver-xorg
sudo apt-get install --no-install-recommends xinit
sudo apt-get install raspberrypi-ui-mods
sudo apt-get install --no-install-recommends raspberrypi-ui-mods lxterminal gvfs
sudo apt-get install lightdm
startx

git clone --recursive https://code.qt.io/qt-creator/qt-creator.git
export LLVM_INSTALL_DIR=/path/to/llvm
mkdir qt-creator-build
cd qt-creator-build
qmake ../qt-creator/qtcreator.pro
make qmake_all
make -j4
sudo make install INSTALL_ROOT=$INSTALL_DIRECTORY
