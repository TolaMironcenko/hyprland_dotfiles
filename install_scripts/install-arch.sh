#!/usr/bin/env sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

# ----- variables ----
disk="/dev/sde"
efi_part_size=200
swap_size=1024
hostname="arch"
normal_user="tola"
# -------------------

# -------------- cheking system -----------------
if [[ $(uname) != "Linux" ]]; then
    printf "$RED This is working only on Linux systems (only Arch Linux)\n$RESET"
    exit 1
fi
# ----------------------------------------------

# ---- umounting disks ----
umount ${disk}*
# -------------------------

# --------- partitioning disks -------------------
wipefs -af $disk

printf "g\nn\n1\n2048\n$((($efi_part_size+1)*2048))\nn\n2\n$(((($efi_part_size+1)*2048)+2048))\n$(((($efi_part_size+1)*2048)+4096))\nn\n3\n$(((($efi_part_size+1)*2048)+6144))\n$((((($efi_part_size+1)*2048)+6144)+($swap_size*2048)))\nn\n4\n\n\nt\n1\nEFI System\nt\n2\nBIOS boot\nt\n3\nLinux swap\nt\n4\nLinux filesystem\nw\n" | fdisk $disk
# ------------------------------------------------

# --------------- formatting partitions -----------
mkfs.vfat -F 32 ${disk}1
mkswap ${disk}3
mkfs.ext4 ${disk}4
# -------------------------------------------------

# ----------- mounting partitions -----------------
mount ${disk}4 /mnt
mkdir -p /mnt/boot/EFI
mount ${disk}1 /mnt/boot/EFI
swapon ${disk}3
# -------------------------------------------------

# ------------ installing the system --------------
pacstrap /mnt base linux linux-firmware vim
# -------------------------------------------------

# ---------------- system configuration --------------------

# ----- generating fstab -------------------
genfstab -U /mnt > /mnt/etc/fstab
# ------------------------------------------

# ----- installing timezone ----------------
arch-chroot /mnt bash -c 'ln -svf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime'
# ------------------------------------------

# ------ configuring system clock ---------------
arch-chroot /mnt bash -c 'hwclock --systohc --utc'
# -----------------------------------------------

# ------- installing locale ------------------
arch-chroot /mnt bash -c 'printf "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen;locale-gen'
arch-chroot /mnt bash -c 'printf "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" > /etc/locale.conf'
# --------------------------------------------

# -------- configuring console ----------------------
arch-chroot /mnt bash -c 'printf "FONT=Lat2-Terminus16\nKEYMAP=ruwin_alt_sh-UTF-8" > /etc/vconsole.conf'
# ---------------------------------------------------

# ----- configuring networking hostname and hosts -------
arch-chroot /mnt /usr/bin/env -i hostname=$hostname bash -c 'echo $hostname > /etc/hostname'
arch-chroot /mnt /usr/bin/env -i hostname=$hostname bash -c 'printf "127.0.0.1 localhost\n::1 localhost\n127.0.1.1 ${hostname}.localdomain ${hostname}" >> /etc/hosts'
# -------------------------------------------------------

# ----- installing root password and normal user -----------------------
arch-chroot /mnt /usr/bin/env -i arch_user=$normal_user bash -c 'passwd;useradd -m -g users -G wheel -s /bin/bash $arch_user;passwd $arch_user'
# ----------------------------------------------------------------------

# ------------ installing and configuring sudo -------------------
arch-chroot /mnt bash -c 'pacman -S sudo;echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers'
# -------------------------------------------------

# ----------- installing and configuring grub ----------
arch-chroot /mnt /usr/bin/env -i grubdisk=$disk bash -c 'pacman -S grub efibootmgr os-prober;grub-install $grubdisk;grub-mkconfig -o /boot/grub/grub.cfg'
# ------------------------------------------------------

# --------- installing and enabling networkmanager --------------------
arch-chroot /mnt bash -c 'pacman -S netctl dhcpcd networkmanager network-manager-applet;systemctl enable NetworkManager'
# --------------------------------------------------------

# ------ deps for connecting iphone ----------------------
arch-chroot /mnt bash -c 'pacman -S libimobiledevice usbmuxd'
# -------------------------------------------------------

# ----------------------------------------------------------

# -- umounting filesystem ---
#umount -R /mnt
# ---------------------------

