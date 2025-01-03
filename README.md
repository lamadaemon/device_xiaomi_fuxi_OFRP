# OFRP device tree for Xiaomi 13 with A15 and mifs support

Xiaomi 13 (codenamed _"fuxi"_) is a high-end smartphone from Xiaomi.

It was announced & released on December 2022.

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Snapdragon® 8 Gen 2 (SM8550)
CPU     | 1x3.2 GHz Cortex-X3 & 2x2.8 GHz Cortex-A715 & 2x2.8 GHz Cortex-A710 & 3x2.0 GHz Cortex-A510
GPU     | Adreno 740
Memory  | 8/12 GB RAM
Shipped Android Version | 13.0 with MIUI 14
Storage | 128/256/512 GB
Battery | Li-Ion 4500 mAh, non-removable, graphene-enhanced
Display | 1080 x 2400 pixels, 20:9 ratio (~414 ppi density), 6.36 inches, OLED, 120Hz, Dolby Vision, HDR10+, 1200 nits (HBM), 1900 nits (peak)
Camera  | 50 MP Leica lens (wide), 10 MP (telephoto), 12 MP (ultrawide), 32 MP (front-wide)

## Device picture

![Xiaomi 13](https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1670745532.86084186.png)

## Features

Tested Features:

- [X] ADB
- [X] Decryption
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload

On device fuxi, with xiaomi.eu HyperOS 2 ROM.

## Building OrangeFox 

In order to support mifs decryption and to fix gui rendering issues, a patch to OFRP is required.
Please use git to apply the provided patch (`android_bootable_recovery.patch`).

A useful script `setup.sh` is provided. It provides building shortcuts and essential environment variables.
Right after you downloaded everything, copy setup.sh to root directory of your workspace,
and then run `source setup.sh fuxi`.

Now you can use `ldmeal` as a shortcut to `lunch twrp_fuxi-eng` 
and `ldmka` as a shortcut to `mka -j10 adbd recoveryimage`

Before you start a build, make sure to edit the variables in `setup.sh` to match your needs (Ex. ccache).

## About mifs

I have seen somebody on CoolApk said `mifs` is `f2fs` with it's name changed.
So, in order to support mifs, all you have to do is let `TWPartition::Is_File_System` recognize mifs.

Until today, Jan. 3rd, 2025, there is no official HyperOS 2, which is Android 15 with mifs, available for fuxi.
However, there are already some community made HyperOS 2 with mifs support that ports from another device available.

For some unknown reason, after I added mifs support, data decryption takes more time than usual,
but it works!
All you have to do is be patient. If it stucks at OrangeFox logo for more than 5 minutes, you should give up and report this issue.

## To use it:

```
fastboot flash recovery_ab OrangeFox-25.01.03_A15-Unofficial-fuxi.img
```

Pre-built available at: https://t.me/ldsharepoint/28
