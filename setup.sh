#!/usr/bin/bash

function ldmeal() {
    lunch twrp_$FOX_BUILD_DEVICE-eng
}

function ldmka() {
    mka -j10 adbd recoveryimage
}

if [ ! -z "$1" ]; then

    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_BUILD_DEVICE=$1
    export LC_ALL="C"
    export USE_CCACHE=]1
    export CCACHE_EXEC=/usr/bin/ccache
    export CCACHE_DIR=

    # For fuxi, it's a/b device
    export FOX_AB_DEVICE=1

    export OF_MAINTAINER=lamadaemon
    export FOX_VERSION=$(date +%y.%m.%d)
    export FOX_VARIANT=A15
    export FOX_DELETE_MAGISK_ADDON=1
    export FOX_USE_BASH_SHELL=1

    source build/envsetup.sh

    echo "FOX_BUILD_DEVICE set to $FOX_BUILD_DEVICE"
    echo "lunch shortcut for this device: ldmeal"
    echo "mka shortcut: ldmka"
else
    echo "No build device type provided!"  
fi
