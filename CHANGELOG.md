# Changelog

This project does NOT follow semantic versioning. The version increases as
follows:

1. Major version updates are breaking updates to the build infrastructure.
   These should be very rare.
2. Minor version updates are made for every major Buildroot release. This
   may also include Erlang/OTP and Linux kernel updates. These are made four
   times a year shortly after the Buildroot releases.
3. Patch version updates are made for Buildroot minor releases, Erlang/OTP
   releases, and Linux kernel updates. They're also made to fix bugs and add
   features to the build infrastructure.

## v0.7.0

This is a major Erlang and Buildroot update. This updates from Erlang/OTP 27 to
Erlang/OTP 28.

* Changes
  * Fix `rpicam-vid` by adding the ffmpeg package so that it's possible to encode H.264 videos. It's in
    software, though.

* Package updates
  * [nerves_system_br v1.32.3 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.32.3)

* Updated dependencies
  * [Erlang/OTP 28.1.1](https://erlang.org/download/OTP-28.1.1.README.md)
  * [Buildroot 2025.05.2](https://lore.kernel.org/buildroot/7bed9b2e-a9d3-476b-84d6-61134e2f726f@rnout.be/T/)

## v0.6.4

* Package updates
  * Hailo RT 4.22.0

## v0.6.3

This is an important security/bug fix that addresses Erlang CVEs for the ssh
module (see Erlang release notes) and fixes issues preventing the Raspberry Pi
camera from being used.

* Changes
  * Build and use libpisp to support RPi5 image pipeline

* Package updates
  * [nerves_system_br v1.31.7](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.31.7). Also
    see [nerves_system_br v1.31.6](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.31.6)

* Important derived package updates
  * [Erlang/OTP 27.3.4.3](https://erlang.org/download/OTP-27.3.4.3.README.md)
  * Linux 6.12.25 with Raspberry Pi patches (Major update to match kernel/user
    land drivers better with upstream)
  * [Buildroot 2025.02.6](https://lore.kernel.org/buildroot/b051d400-debc-4269-975a-b2992eed8d61@rnout.be/T/)

## v0.6.2

This is a security/bug fix release.

* Package updates
  * [nerves_system_br v1.31.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.31.5)

* Important derived package updates
  * [Erlang/OTP 27.3.4.2](https://erlang.org/download/OTP-27.3.4.2.README.md)
  * [fwup 1.13.2](https://github.com/fwup-home/fwup/releases/tag/v1.13.2)

## v0.6.1

This is a security/bug fix release that also includes Hailo AI support. Hailo
support is currently experimental and won't be loaded if you don't have it.

* Package updates
  * [Erlang/OTP 27.3.4.1](https://erlang.org/download/OTP-27.3.4.1.README.md)
  * [Buildroot 2025.02.3 (fixed 2025.02.2)](https://lore.kernel.org/buildroot/49d039c0-8121-4a91-8a69-889376f85c71@rnout.be/T/)
  * Raspberry Pi WiFi firmware 1:20240709-2~bpo12+1+rpt3
  * [rpi-libcamera v0.5.0+rpt20250429](https://github.com/raspberrypi/libcamera/releases/tag/v0.5.0%2Brpt20250429)
  * rpicam-apps 1.7.0
  * [erlinit 1.14.3](https://github.com/nerves-project/erlinit/releases/tag/v1.14.3)
  * [fwup 1.13.0](https://github.com/fwup-home/fwup/releases/tag/v1.13.0)

## v0.6.0

This is a major Buildroot update.

Please see the [nerves_system_br v1.31.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.31.0)
for additional information if you've forked this system.

* Changes
  * Add support for the RPi Touch Display 2
  * Update Mesa3D to bring in RPi 5 fixes

* Updated dependencies
  * [Buildroot 2025.02.1](https://lore.kernel.org/buildroot/60b8483c-b717-41ce-a406-bceb71c3a089@rnout.be/T/)

## v0.5.1

This is a security/bug fix update.

* Updated dependencies
  * [Erlang/OTP 27.3.3](https://erlang.org/download/OTP-27.3.3.README)
  * [nerves_system_br v1.30.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.30.1)

## v0.5.0

This is a major Buildroot update.

Please see the [nerves_system_br v1.30.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.30.0)
for upgrade instructions if you've forked this system.

* Changes
  * Enable support for the RP1's PIO feature
  * Add REUSE compliance to help improve OSS copyright and licensing accuracy
  * Update Raspberry Pi libraries and firmware to latest releases

* Updated dependencies
  * [Erlang/OTP 27.3](https://erlang.org/download/OTP-27.3.README.md)
  * [Buildroot 2024.11.2](https://lore.kernel.org/buildroot/87v7t3nyls.fsf@dell.be.48ers.dk/T/)
  * Linux 6.6.74 (Raspberry Pi 1.20250127 release)
  * rpicam-apps 1.5.3
  * rpi-libcamera v0.3.2+rpt20241119
  * rpi-distro-firmware-nonfree 1:20230625-2+rpt3

## v0.4.1

This is a security/bug fix update.

* Changes
  * Support the CM5 and any other devices that use the BCM2712D0
  * Support the use of NVME SSDs
  * Enable the RP1 PIO driver. This likely also requires the bootloader to be
    updated to use

* Updated dependencies
  * [nerves_system_br v1.29.3](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.29.3)
  * [Buildroot 2024.08.3](https://lore.kernel.org/buildroot/874j3e17ek.fsf@dell.be.48ers.dk/T/)
  * [Erlang/OTP 27.2](https://erlang.org/download/OTP-27.2.README)
  * Linux 6.6.64 with the Raspberry Pi and PREEMPT_RT patches
  * [fwup v1.12.0](https://github.com/fwup-home/fwup/releases/tag/v1.12.0)

## v0.4.0

This is a major Erlang and Buildroot update.

Please see the [nerves_system_br v1.29.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.29.0)
for upgrade instructions if you've forked this system.

* Changes
  * Applied and enabled the Real-Time Linux patch set, PREEMPT_RT. Please see
    write-ups on the web for benefits and how to use. The impact of this patch
    shouldn't be noticeable to most Nerves users.
  * Switch CPU frequency governor from conservative to the more modern
    schedutil. See [LWN article](https://lwn.net/Articles/682391/) for details.
  * Add missing Pi Camera lens device driver

* Updated dependencies
  * [nerves_system_br v1.29.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.29.1)
  * [Buildroot 2024.08.2](https://lore.kernel.org/buildroot/871pzex7gn.fsf@dell.be.48ers.dk/T/)
  * Linux 6.6.51 (Raspberry Pi stable_20241008 release)

## v0.3.1

This is a security/bug fix update.

* Changes
  * Enable QMI kernel modules to support many cellular modems without a Nerves
    system update

* Updated dependencies
  * [nerves_system_br v1.28.3](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.28.3)
  * [Buildroot 2024.05.2](https://lore.kernel.org/buildroot/87zfpfh147.fsf@dell.be.48ers.dk/T/)
  * [Erlang/OTP 27.0.1](https://erlang.org/download/OTP-27.0.1.README)

## v0.3.0

This is a major Erlang and Buildroot.

Please see the [nerves_system_br v1.28.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.28.0)
for upgrade instructions if you've forked this system.

* Changes
  * Elixir 1.17 and Erlang/OTP 27 support
  * Reduce copy/pasted definitions in the `fwup.conf` by extracting them to
    `fwup_include/fwup-common.conf`. (No functional changes)

* Fixes
  * The serial numbers returned by `Nerves.Runtime.serial_number/0` now contain
    the whole serial number. If you forked this system, check the
    `boardid.config` and `erlinit.config` for the changes and to keep the
    hostname the same.

* Updated dependencies
  * [nerves_system_br v1.28.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.28.1)
  * [Buildroot 2024.05](https://lore.kernel.org/buildroot/87bk46tjk2.fsf@dell.be.48ers.dk/T/)
  * [Erlang/OTP 27.0](https://erlang.org/download/OTP-27.0.README)

## v0.2.1

This is a security/bug fix update.

* Changes
  * Enable the `wpa_supplicant` option for allow wired 802.1x authentication

* Package updates
  * [Erlang/OTP 26.2.5](https://erlang.org/download/OTP-26.2.5.README)
  * [Buildroot 2024.02.1](https://lore.kernel.org/buildroot/87jzlp9u5e.fsf@48ers.dk/T/)

## v0.2.0

This is a major Buildroot update.

Please see the [nerves_system_br v1.27.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.26.0)
for upgrade instructions if you've forked this system.

* Changes
  * Important documentation update to replace ttyS0 with ttyAMA10 for getting
    the IEx prompt on the debug UART
  * The `libcamera` and `rpicam_apps` packages have been replaced with the
    Raspberry Pi-forked versions for better compatibility. Please see
    `nerves_system_br` release notes.

* Updated dependencies
  * Linux 6.1.73 (Raspberry Pi 20240124 release)
  * [nerves_system_br v1.27.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.27.0)
  * [Buildroot 2024.02](https://lore.kernel.org/buildroot/87msrczp4z.fsf@48ers.dk/)
  * [Erlang/OTP 26.2.3](https://erlang.org/download/OTP-26.2.3.README)

## v0.1.0

This is a major Buildroot update.

Please see the [nerves_system_br v1.26.0 release notes](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.26.0)
for upgrade instructions if you've forked this system.

* New features
  * Add the imx296 overlays for the Raspberry Pi Global Shutter Camera

* Updated dependencies
  * [Erlang/OTP 26.2.2](https://erlang.org/download/OTP-26.2.2.README)
  * [nerves_system_br v1.26.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.26.1)
  * [Buildroot 2023.11.1](https://lore.kernel.org/buildroot/87cyu2k2gu.fsf@48ers.dk/T/)

## v0.0.2

This is a security/bug fix update.

 Package updates
  * [Erlang/OTP 26.2.1](https://erlang.org/download/OTP-26.2.1.README)
  * [nerves_heart 2.3.0](https://github.com/nerves-project/nerves_heart/releases/tag/v2.3.0)

## v0.0.1

This is an initial release to make it easier for more people to test Nerves on
the Raspberry Pi 5. Future releases may be incompatible and this one might have
some frustrating bugs.
