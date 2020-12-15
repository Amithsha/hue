#!/bin/bash

mkdir -p pushHueTar/deb/tmp/huePackage
#find * -mindepth 1 -name "*" ! -not -path 'pushHueTar'  -exec cp -rf --parents \{\} pushHueTar/deb/tmp/huePackage/  \;
find /hue -mindepth 1 -type d -name 'pushHueTar' -prune -o -type f   -exec cp -rf --parents \{\} pushHueTar/deb/tmp/huePackage/  \;
ls pushHueTar/deb/tmp/huePackage/*

cd pushHueTar
cp -rf  DEBIAN deb/

dpkg -b deb flipkart-hue-pacakge-repo.deb
reposervice --host 10.24.0.41 --port "8080" pubrepo --repo  flipkart-hue-pacakge-repo  --appkey dummy --debs flipkart-hue-pacakge-repo.deb
