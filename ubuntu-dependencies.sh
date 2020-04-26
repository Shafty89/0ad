#!/bin/sh

# install requirements
apt-add-repository 'deb http://repos.codelite.org/wx3.1.0/ubuntu/ artful universe'
apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe'
apt-add-repository ppa:boost-latest/ppa
add-apt-repository ppa:mhier/libboost-latest
apt update --allow-insecure-repositories

apt-get install build-essential cmake libboost-dev libboost-filesystem-dev libcurl4-gnutls-dev libenet-dev libgloox-dev libicu-dev libminiupnpc-dev libnvtt-dev libogg-dev libopenal-dev libpng-dev libsdl2-dev libvorbis-dev libxcursor-dev libxml2-dev python subversion zlib1g-dev libboost-system-dev libsodium-dev libmozjs-45-dev
apt install libwebkit --allow-unauthenticated 
apt install wx3.0-headers=3.0.4+dfsg-8 libwxbase3.0-dev=3.0.4+dfsg-8 libwxgtk3.0-dev=3.0.4+dfsg-8 libwxbase3.0-0v5=3.0.4+dfsg-8 libwxgtk3.0-0v5=3.0.4+dfsg-8s --allow-unauthenticated
apt policy wx3.0-headers libwxgtk3.0-dev --allow-unauthenticated

# install boost manually
wget -O boost_1_70_0.tar.gz https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz
tar -xf boost_1_70_0.tar.gz
cd ./boost_1_70_0
./bootstrap.sh --with-libraries=filesystem,system
./b2 install
