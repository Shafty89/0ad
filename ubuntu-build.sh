#! /bin/sh

# install requirements
sudo apt-add-repository 'deb http://repos.codelite.org/wx3.1.0/ubuntu/ artful universe'
sudo apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe'
sudo apt update --allow-insecure-repositories

sudo apt install libboost-all-dev cmake gcc python libcurl4-openssl-dev libenet-dev libgloox-dev libicu-dev libogg-dev libpng-dev libsodium-dev libvorbis-dev libxcursor-dev libxml2-dev miniupnpc libopenal-dev freeglut3-dev libsdl2-dev libpng-dev libwebkitgtk libminiupnpc-dev g++ -y
sudo apt install libwebkit -y
sudo apt policy wx3.0-headers libwxgtk3.0-dev -y
sudo apt-get install libwxbase3.1-0-unofficial libwxbase3.1-dev libwxgtk3.1-0-unofficial libwxgtk3.1-dev wx3.1-headers wx-common libwxgtk-webview3.1-0-unofficial libwxgtk-webview3.1-dev libwxgtk-media3.1-0-unofficial libwxgtk-media3.1-dev libwxbase3.1-0-unofficial-dbg libwxgtk-webview3.1-0-unofficial-dbg libwxgtk-media3.1-0-unofficial-dbg wx3.1-i18n wx3.1-examples --allow-unathenticated -y

# build workspace
set -e
cd build/workspaces/
./clean-workspaces.sh
./update-workspaces.sh -j5

cd gcc
make clean
make -j5
make test -j5

# run tests
cd ../../../binaries/system
test
