#!/bin/sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

# ----- variables ----
disk="/dev/sda"
efi_part_size=500
swap_size=8192
hostname="arch"
normal_user="tola"
rootfstype="ext4"
answer=n
# -------------------

# -------------- cheking system -----------------
printf "$YELLOW ::$GREEN Cheking system$RESET  "
if [[ $(uname) != "Linux" ]]; then
    printf "$RED This is working only on Linux systems (only Arch Linux)\n$RESET"
    exit 1
fi
printf "[$GREEN OK $RESET]\n"
# ----------------------------------------------

# ---------- cheking root ----------------------
printf "$YELLOW ::$GREEN Cheking permissions$RESET  "
if [[ "$(id -u)" != "0" ]]; then
    printf "$RED ERROR:$RESET You must be root\n"
    exit 1
fi
printf "[$GREEN OK $RESET]\n"
# ---------------------------------------------

# --------------- cheking disk ---------------
printf "$YELLOW Your disk is $disk?$RESET ($(echo $GREEN)y$RESET/$(echo $RED)n$RESET): "
read answer
if [[ "$answer" != "y" ]];then
    printf "$RED ERROR:$RESET Please Write your disk name in this script.\n"
    exit 1
fi
# -------------------------------------------

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
[ "$rootfstype" == "ext4" ] && mkfs.ext4 ${disk}4
[ "$rootfstype" == "btrfs" ] && mkfs.btrfs -L arch -f ${disk}4
# -------------------------------------------------

# ----------- mounting partitions -----------------
mount ${disk}4 /mnt
mkdir -p /mnt/boot/EFI
mount ${disk}1 /mnt/boot/EFI
swapon ${disk}3
# -------------------------------------------------

# ------------ installing the system --------------
printf "$YELLOW ::$GREEN Installing the system$RESET\n"
pacstrap /mnt base base-devel linux linux-firmware vim
# -------------------------------------------------

# ---------------- system configuration --------------------
printf "$YELLOW ::$GREEN System configuration$RESET\n"
# ----- generating fstab -------------------
printf "$YELLOW ::$GREEN Geerating fstab$RESET\n"
genfstab -U /mnt > /mnt/etc/fstab
# ------------------------------------------

# ----- installing timezone ----------------
printf "$YELLOW ::$GREEN Installing timezone$RESET\n"
arch-chroot /mnt bash -c 'ln -svf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime'
# ------------------------------------------

# ------ configuring system clock ---------------
printf "$YELLOW ::$GREEN Configuring system clock$RESET\n"
arch-chroot /mnt bash -c 'hwclock --systohc --utc'
# -----------------------------------------------

# ------- installing locale ------------------
printf "$YELLOW ::$GREEN Installing locale$RESET\n"
arch-chroot /mnt bash -c 'printf "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" >> /etc/locale.gen;locale-gen'
arch-chroot /mnt bash -c 'printf "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" > /etc/locale.conf'
# --------------------------------------------

# -------- configuring console ----------------------
printf "$YELLOW ::$GREEN Configuring console$RESET\n"
arch-chroot /mnt bash -c 'printf "FONT=Lat2-Terminus16\nKEYMAP=ruwin_alt_sh-UTF-8" > /etc/vconsole.conf'
# ---------------------------------------------------

# ----- configuring networking hostname and hosts -------
printf "$YELLOW ::$GREEN Installing hostname and hosts$RESET\n"
arch-chroot /mnt /usr/bin/env -i hostname=$hostname bash -c 'echo $hostname > /etc/hostname'
arch-chroot /mnt /usr/bin/env -i hostname=$hostname bash -c 'printf "127.0.0.1 localhost\n::1 localhost\n127.0.1.1 ${hostname}.localdomain ${hostname}" >> /etc/hosts'
# -------------------------------------------------------

# ----- installing root password and normal user -----------------------
printf "$YELLOW ::$GREEN Installing root password and normal user$RESET\n"
arch-chroot /mnt /usr/bin/env -i arch_user=$normal_user bash -c 'passwd;useradd -m -g users -G wheel -s /bin/bash $arch_user;passwd $arch_user'
# ----------------------------------------------------------------------

# ------------ installing and configuring sudo -------------------
printf "$YELLOW ::$GREEN Installing and configuring sudo$RESET\n"
arch-chroot /mnt bash -c 'pacman -S sudo;echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers'
# -------------------------------------------------

# ----------- installing and configuring grub ----------
printf "$YELLOW ::$GREEN Installing and configuring grub$RESET\n"
arch-chroot /mnt /usr/bin/env -i grubdisk=$disk bash -c 'pacman -S grub efibootmgr os-prober;grub-install $grubdisk;grub-mkconfig -o /boot/grub/grub.cfg'
# ------------------------------------------------------

# --------- installing and enabling networkmanager --------------------
printf "$YELLOW ::$GREEN Installing and configuring NetworkManager$RESET\n"
arch-chroot /mnt bash -c 'pacman -S netctl dhcpcd networkmanager network-manager-applet;systemctl enable NetworkManager'
# --------------------------------------------------------

# ------ deps for connecting iphone ----------------------
printf "$YELLOW ::$GREEN Installing dependencies for connecting iphone$RESET\n"
arch-chroot /mnt bash -c 'pacman -S libimobiledevice usbmuxd'
# -------------------------------------------------------

# ----------------------------------------------------------

# -- umounting filesystem ---
# printf "$YELLOW ::$GREEN Unmounting filesystem$RESET\n"
#umount -R /mnt
# ---------------------------

