# OpenMultiBoot - 1.0 2014/10/03

- OpenMultiBoot will be donated to OE-Alliance by GigaBlue.
- OpenMultiBoot can be modified or adapted to work with STB's from other vendors as long naming "OpenMultiBoot" is not changed and logos of OpenMultiBoot persists.
- OpenMultiBoot uses boxbranding and informations from bitbake recipes, due to that ipk files are specific for each STB! Do not try to use OpenMultiBoot from STB A on STB B.
- **GigaBlue takes no responsibility for any potential damage OpenMultiBoot might cause on STB's from other vendors.**
- OpenMultiBoot requires some kernel-modules to work. They will be installed on installation of OpenMultiBoot:
    - **ubifs** - **kernel-module-nandsim**
    - **jffs2** - **kernel-module-nandsim kernel-module-block2mtd**

(c) 2014 Impex-Sat GmbH & Co. KG - http://www.gigablue.de

## Notes:
- <device> has to be formated as ext4
- <device> should be a fast USB-stick or SSD, not recommended to use a normal HDD as HDD would almost never stop spinning.
- Upload any zipped image to <device>/open-multiboot-upload or /omb/open-multiboot-upload
- Zipped image needs regular folder structure like flashing from USB-device.
- It is not recommended to re-use existing settings, do not blame us if problems occur.
- Check your recording path configuration and existing timers if you attach a new device.
- Do not use Flash-Online if you have not booted your regularly flashed image, use delete/install in OpenMultiBoot of regularly flashed image.
- Special thanks goes to skaman, kajgan, captain, arn354 and all testers!

[![Play openMultiBoot YouTube](http://img.youtube.com/vi/WYOYCraLoMk/0.jpg)](https://www.youtube.com/watch?v=WYOYCraLoMk)
