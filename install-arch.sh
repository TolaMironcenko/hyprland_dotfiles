#!/usr/bin/env sh

disk="/dev/sde"
efi_part_size=200
swap_size=1024
hostname="arch"
normal_user="tola"

umount ${disk}*

# --------- partitioning disks -------------------
wipefs -af $disk

printf "g\nn\n1\n2048\n$((($efi_part_size+1)*2048))\nn\n2\n$(((($efi_part_size+1)*2048)+2048))\n$(((($efi_part_size+1)*2048)+4096))\nn\n3\n$(((($efi_part_size+1)*2048)+6144))\n$((((($efi_part_size+1)*2048)+6144)+($swap_size*2048)))\nn\n4\n\n\nt\n1\nEFI System\nt\n2\nBIOS boot\nt\n3\nLinux swap\nt\n4\nLinux filesystem\nw\n" | fdisk $disk

mkfs.vfat -F 32 ${disk}1
mkswap ${disk}3
mkfs.ext4 ${disk}4
# -------------------------------------------------

mount ${disk}4 /mnt
mkdir -p /mnt/boot/EFI
mount ${disk}1 /mnt/boot/EFI

pacstrap /mnt base linux linux-firmware vim

genfstab -U /mnt > /mnt/etc/fstab

# ---------------- system configuration --------------------
# timezone
arch-chroot /mnt bash -c 'ln -svf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime'
# system clock
arch-chroot /mnt bash -c 'hwclock --systohc --utc'
# locale
arch-chroot /mnt bash -c 'printf "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen;locale-gen'
arch-chroot /mnt bash -c 'printf "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" > /etc/locale.conf'
# console
arch-chroot /mnt bash -c 'printf "FONT=Lat2-Terminus16\nKEYMAP=ruwin_alt_sh-UTF-8" > /etc/vconsole.conf'
# networking hostname and hosts
arch-chroot /mnt bash -c 'echo $hostname > /etc/hostname'
arch-chroot /mnt bash -c 'printf "127.0.0.1 localhost\n::1 localhost\n127.0.1.1 ${hostname}.localdomain ${hostname}" >> /etc/hosts'
# root password and normal user
arch-chroot /mnt /usr/bin/env -i arch_user=$normal_user bash -c 'passwd;useradd -m -g users -G wheel -s /bin/bash $arch_user;passwd $arch_user'
# sudo configuring
arch-chroot /mnt bash -c 'pacman -S sudo;echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers'
# installing grub and configuring
arch-chroot /mnt /usr/bin/env -i grubdisk=$disk bash -c 'pacman -S grub efibootmgr os-prober;grub-install $grubdisk;grub-mkconfig -o /boot/grub/grub.cfg'
# networkmanager
arch-chroot /mnt bash -c 'pacman -S netctl dhcpcd networkmanager network-manager-applet;systemctl enable NetworkManager'
# for iphone
arch-chroot /mnt bash -c 'pacman -S libimobiledevice usbmuxd'

# ----------------------------------------------------------

#umount -R /mnt

