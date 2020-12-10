#!/bin/bash

mkdir -p pushHueTar/deb/tmp
find . -name "*" ! -name 'pushHueTar' -exec cp "{}" pushHueTar/deb/tmp/  \;
ls pushHueTar

cd pushHueTar
cp -rf  DEBIAN deb/

dpkg -b deb flipkart-hue-pacakge-repo.deb
reposervice --host 10.24.0.41 --port "8080" pubrepo --repo  flipkart-hue-pacakge-repo  --appkey dummy --debs flipkart-hue-pacakge-repo.deb
