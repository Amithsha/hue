#!/bin/bash

mkdir -p pushHueTar/deb/mnt/data3/huePackage/
find /hue -mindepth 1 -type d -name 'pushHueTar' -prune -o -type f   -exec cp -rf --parents \{\} pushHueTar/deb/mnt/data3/huePackage/  \;
ls pushHueTar/deb/mnt/data3/huePackage/*

cd pushHueTar
cp -rf  DEBIAN deb/

dpkg -b deb flipkart-hue-pacakge-repo.deb
reposervice --host 10.24.0.41 --port "8080" pubrepo --repo  flipkart-hue-pacakge-repo  --appkey dummy --debs flipkart-hue-pacakge-repo.deb
