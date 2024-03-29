OpenMultiboot [![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) [![openmultibootmanager](https://github.com/OpenVisionE2/openmultibootmanager/actions/workflows/openmultibootmanager.yml/badge.svg)](https://github.com/OpenVisionE2/openmultibootmanager/actions/workflows/openmultibootmanager.yml) [![ovbot](https://github.com/OpenVisionE2/openmultibootmanager/actions/workflows/ovbot.yml/badge.svg)](https://github.com/OpenVisionE2/openmultibootmanager/actions/workflows/ovbot.yml)
=============
- OpenMultiboot will be donated to OE-Alliance by GigaBlue.
- OpenMultiboot can be modified or adapted to work with STB's from other vendors as long naming "OpenMultiboot" is not changed and logos of OpenMultiboot persists.
- OpenMultiboot uses informations from bitbake recipes, due to that ipk files are specific for each STB! Do not try to use OpenMultiboot from STB A on STB B.
- **GigaBlue takes no responsibility for any potential damage OpenMultiboot might cause on STB's from other vendors.**
- OpenMultiboot requires some kernel-modules to work. They will be installed on installation of OpenMultiboot:
    - **ubifs** - **kernel-module-nandsim**
    - **jffs2** - **kernel-module-nandsim kernel-module-block2mtd**

(c) 2014 Impex-Sat GmbH & Co. KG - http://www.gigablue.de

# This branch have some improvements to the original OMB:
- Supports py2 and py3 images.
- Supports enigma.info.
- Supports moving of the exteran between different boxes. Just jump to flash image before disconnecting. Omb will show you on the menu just the image for current box.
- Menu load faster by calling external binary (boxbranding helper ) just one time for each image.
- New bootmenu helper that produce a json. @devs, You can use this new helper to preview the image list output.

## Notes:
- < device > has to be formated as ext4
- < device > should be a fast USB-stick or SSD, not recommended to use a normal HDD as HDD would almost never stop spinning.
- Upload any zipped image to < device >/open-multiboot-upload or /omb/open-multiboot-upload
- Zipped image needs regular folder structure like flashing from USB-device.
- It is not recommended to re-use existing settings, do not blame us if problems occur.
- Check your recording path configuration and existing timers if you attach a new device.
- Do not use Flash-Online if you have not booted your regularly flashed image, use delete/install in OpenMultiboot of regularly flashed image.
- Special thanks goes to skaman, kajgan, captain, arn354 and all testers!

[![Play OpenMultiboot YouTube](http://img.youtube.com/vi/WYOYCraLoMk/0.jpg)](https://www.youtube.com/watch?v=WYOYCraLoMk)
