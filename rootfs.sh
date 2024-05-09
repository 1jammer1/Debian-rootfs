apt install debootstrap
debootstrap stable rootfs
rm -rf rootfs/etc/apt/sources.list
touch rootfs/etc/apt/sources.list
echo "deb http://deb.debian.org/debian stable main contrib non-free-firmware
deb-src http://deb.debian.org/debian stable main contrib non-free-firmware

deb http://deb.debian.org/debian-security/ stable-security contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian-security/ stable-security contrib main non-free non-free-firmware

deb http://deb.debian.org/debian stable-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian stable-updates main contrib non-free non-free-firmware" >> rootfs/etc/apt/sources.list
chroot rootfs apt update
chroot rootfs apt upgrade -y
rm -rf rootfs/etc/apt/sources.list
touch rootfs/etc/hostname
echo "Batarong" > rootfs/etc/hostname
chroot rootfs apt install -y network-manager
chroot rootfs apt install -y linux-image-amd64
chroot rootfs apt install -y firmware-linux
chroot rootfs apt install -y grub-pc
