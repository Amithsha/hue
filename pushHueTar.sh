#!/bin/bash

mkdir -p pushHueTar/deb/tmp/huePackage
#find . -name "*" ! -name 'pushHueTar' -exec cp "{}" pushHueTar/deb/tmp/huePackage/  \;
find . -mindepth 1 -name "*" ! -name 'pushHueTar' -exec cp -rf --parents \{\} pushHueTar/deb/tmp/huePackage/  \;
ls pushHueTar

cd pushHueTar
cp -rf  DEBIAN deb/

dpkg -b deb flipkart-hue-pacakge-repo.deb
reposervice --host 10.24.0.41 --port "8080" pubrepo --repo  flipkart-hue-pacakge-repo  --appkey dummy --debs flipkart-hue-pacakge-repo.deb
