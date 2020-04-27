#!/bin/sh

# fix issue with github action
export SHELL=/bin/bash

# install requirements
apt-add-repository 'deb http://repos.codelite.org/wx3.1.0/ubuntu/ artful universe'
apt-add-repository 'deb http://cz.archive.ubuntu.com/ubuntu bionic main universe'

apt update --allow-insecure-repositories

apt install libboost-all-dev cmake make build-essential libboost-dev libboost-filesystem-dev libboost-system-dev gcc python libcurl4-openssl-dev libenet-dev libgloox-dev libicu-dev libogg-dev libpng-dev libsodium-dev libvorbis-dev libxcursor-dev libxml2-dev miniupnpc libopenal-dev freeglut3-dev libsdl2-dev libpng-dev libminiupnpc-dev g++

apt-get install libwxbase3.1-dev libwxgtk3.1-dev wx3.1-headers wx-common libwxgtk-webview3.1-dev libwxgtk-media3.1-dev
apt policy wx3.1-headers libwxgtk3.1-dev
