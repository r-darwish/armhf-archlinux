#!/bin/bash

set -e

curl -L http://archlinuxarm.org/os/ArchLinuxARM-utilite-latest.tar.gz | gunzip | docker import - armhf-archlinux
docker run --name armhf-archlinux armhf-archlinux pacman -Rnsc --noconfirm util-linux linux-firmware
docker container export armhf-archlinux | docker image import - darwish/armhf-archlinux
docker container rm armhf-archlinux
