#!/bin/bash
set -e

# Installing Sysbox
wget https://downloads.nestybox.com/sysbox/releases/v0.6.3/sysbox-ce_0.6.3-0.linux_amd64.deb

sha256sum sysbox-ce_0.6.3-0.linux_amd64.deb

echo "This will remove all containers! (If this line fails, comment it)"
sudo docker rm $(docker ps -a -q) -f

sudo apt-get install jq
sudo apt-get install ./sysbox-ce_0.6.3-0.linux_amd64.deb

sudo systemctl status sysbox -n20


# Installing Shiftfs
sudo apt-get install -y make dkms git wget
git clone -b k5.10 https://github.com/toby63/shiftfs-dkms.git shiftfs-k510
cd shiftfs-k510
./update1
sudo make -f Makefile.dkms
modinfo shiftfs