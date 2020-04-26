#!/bin/sh

# install requirements
apt-add-repository 'deb http://repos.codelite.org/wx3.1.0/ubuntu/ artful universe'
apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe'
apt-add-repository ppa:boost-latest/ppa
add-apt-repository ppa:mhier/libboost-latest
apt update --allow-insecure-repositories


apt install build-essential libboost-dev libboost-filesystem-dev cmake gcc python libnvtt-dev libcurl4-openssl-dev libenet-dev libgloox-dev libicu-dev libogg-dev libpng-dev libsodium-dev libvorbis-dev libxcursor-dev libxml2-dev miniupnpc libopenal-dev freeglut3-dev libsdl2-dev libwebkitgtk libminiupnpc-dev g++ -y
apt install libwebkit subversion zlib1g-dev libboost-system-dev libmozjs-45-dev --allow-unauthenticated

apt-get install libwxbase3.1-0-unofficial libwxbase3.1-dev libwxgtk3.1-0-unofficial libwxgtk3.1-dev wx3.1-headers wx-common libwxgtk-webview3.1-0-unofficial libwxgtk-webview3.1-dev libwxgtk-media3.1-0-unofficial libwxgtk-media3.1-dev libwxbase3.1-0-unofficial-dbg libwxgtk-webview3.1-0-unofficial-dbg libwxgtk-media3.1-0-unofficial-dbg wx3.1-i18n wx3.1-examples --allow-unathenticated

apt policy wx3.1-headers libwxgtk3.1-dev -y

