#!/bin/bash

### SOURCE: https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md

# Exit the script with error if any of the commands fail
set -o errexit

## Main Entry
## Default values
SYSBOX_VERSION=""
SYSBOX_ARCH=""

## Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --sysbox_version=*) 
            SYSBOX_VERSION="${1#*=}"  # Extract value from --sysbox_version=VALUE
            ;;
        --sysbox_arch=*) 
            SYSBOX_ARCH="${1#*=}"  # Extract value from --sysbox_arch=VALUE
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift  # Move to the next argument
done

IS_VALID=true
# Ensure SYSBOX_VERSION is set
if [ -z "$SYSBOX_VERSION" ]; then
    echo "Please provide the SYSBOX_VERSION argument using --sysbox_version=0.6.4"
    IS_VALID=false
fi

# Ensure SYSBOX_ARCH is set
if [ -z "$SYSBOX_ARCH" ]; then
    echo "Please provide the SYSBOX_ARCH argument using --sysbox_arch=amd64"
    IS_VALID=false
fi

# Check if validation failed
if [ "$IS_VALID" = false ]; then
    exit 1
fi

# Installing Sysbox
wget https://downloads.nestybox.com/sysbox/releases/v${SYSBOX_VERSION}/sysbox-ce_${SYSBOX_VERSION}-0.linux_${SYSBOX_ARCH}.deb

sha256sum sysbox-ce_${SYSBOX_VERSION}-0.linux_${SYSBOX_ARCH}.deb

echo "This will remove all containers!!!"
# Check if there are any running containers before stopping
running_containers=$(docker ps -a -q)
if [ -n "$running_containers" ]; then
  echo "Stopping running containers..."
  sudo docker rm $running_containers -f
else
  echo "No running containers to stop."
fi


sudo apt-get install jq
sudo apt-get install ./sysbox-ce_${SYSBOX_VERSION}-0.linux_${SYSBOX_ARCH}.deb

sudo systemctl status sysbox -n20


# Installing Shiftfs
sudo apt-get install -y make dkms git wget
git clone -b k5.10 https://github.com/toby63/shiftfs-dkms.git shiftfs-k510
cd shiftfs-k510
./update1
sudo make -f Makefile.dkms
modinfo shiftfs


docker info | grep -i runtime