#!/bin/sh

# install requirements
apt-add-repository 'deb http://repos.codelite.org/wx3.1.0/ubuntu/ artful universe'
apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe'
apt-add-repository ppa:boost-latest/ppa
add-apt-repository ppa:mhier/libboost-latest
apt update --allow-insecure-repositories

apt install libopencv-dev libboost-dev libboost-all-dev libboost-filesystem-dev libboost-python-dev libboost1.68-dev libboost1.68 python-dev build-essential cmake gcc python libcurl4-openssl-dev libenet-dev libgloox-dev libicu-dev libogg-dev libpng-dev libsodium-dev libvorbis-dev libxcursor-dev libxml2-dev miniupnpc libopenal-dev freeglut3-dev libsdl2-dev libpng-dev libwebkitgtk libminiupnpc-dev g++ libnvtt-dev subversion zlib1g-dev libboost-system-dev libmozjs-45-dev
apt install libwebkit --allow-unauthenticated 
apt install wx3.0-headers=3.0.4+dfsg-8 libwxbase3.0-dev=3.0.4+dfsg-8 libwxgtk3.0-dev=3.0.4+dfsg-8 libwxbase3.0-0v5=3.0.4+dfsg-8 libwxgtk3.0-0v5=3.0.4+dfsg-8s --allow-unauthenticated
apt policy wx3.0-headers libwxgtk3.0-dev --allow-unauthenticated
