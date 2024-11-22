#!/bin/sh
#------ cli variables -------------------------------------------------------------------------------------------------------------------------------
PATH=$1                                                                   # path for new root
SHELL=$2                                                                  # shell to use in chroot
#----------------------------------------------------------------------------------------------------------------------------------------------------
#------- Check root func ----------------------------------------------------------------------------------------------------------------------------
check_root() {
    if [ $(/usr/bin/id -u) -ne 0 ]; then                                  # cheking root priveleges
        printf "** You must be root\n"
        exit 1                                                            # exit with exit code 1 error
    fi
}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#----------- checking or create dirs ----------------------------------------------------------------------------------------------------------------
check_or_mkdir() {
    [ ! -d $PATH/dev ] && mkdir -pv $PATH/dev                             # if directory not exists then mkdir
    [ ! -d $PATH/proc ] && mkdir -pv $PATH/proc                           # if directory not exists then mkdir
    [ ! -d $PATH/sys ] && mkdir -pv $PATH/sys                             # if directory not exists then mkdir
    [ ! -d $PATH/run ] && mkdir -pv $PATH/run                             # if directory not exists then mkdir
}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#-------- mount virtual filesystems -----------------------------------------------------------------------------------------------------------------
mount_virtual() {
    /usr/bin/mount -v --bind /dev $PATH/dev                               # mount bind devtmpfs to /dev
    /usr/bin/mount -vt devpts devpts -o gid=5,mode=0620 $PATH/dev/pts     # mount devpts to /dev/pts
    /usr/bin/mount -vt proc proc $PATH/proc                               # mount procfs to /proc
    /usr/bin/mount -vt sysfs sysfs $PATH/sys                              # mount sysfs to /sys
    /usr/bin/mount -vt tmpfs tmpfs $PATH/run                              # mount tmpfs to /run
    if [ -h $PATH/dev/shm ]; then                                         # check
        /usr/bin/install -v -d -m 1777 $PATH$(/usr/bin/realpath /dev/shm) # install directories
    else
        /usr/bin/mount -vt tmpfs -o nosuid,nodev tmpfs $PATH/dev/shm      # mount tmpfs to /dev/shm
    fi
    /usr/bin/cp -v /etc/resolv.conf $PATH/etc/resolv.conf                 # copy resolv.conf file to chroot
}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#------ umount virtual filesystems ------------------------------------------------------------------------------------------------------------------
umount_virtual() {
    /usr/bin/mountpoint -q $PATH/dev/shm && /usr/bin/umount $PATH/dev/shm # umount /dev/shm
    /usr/bin/umount $PATH/dev/pts                                         # umount /dev/pts
    /usr/bin/umount $PATH/{sys,proc,run,dev}                              # umount /sys,/proc,/run,/dev
}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#------ get shell path func -------------------------------------------------------------------------------------------------------------------------
get_shell() {
    if [[ "$SHELL" != "" ]]; then                                         # if shell is not empty
        echo $SHELL                                                       # return shell
    fi
    echo "/bin/sh"                                                        # if shell is empty return /bin/sh
}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#------- main ---------------------------------------------------------------------------------------------------------------------------------------
check_root                                                                # check root priveleges
check_or_mkdir                                                            # check directories for mount virtual filesystems in chroot
mount_virtual                                                             # mount virtual filesystems to chroot
#---- do chroot in chroot path using shell ----------------------------------------------------------------------------------------------------------
/usr/bin/chroot \
    $PATH \
    /usr/bin/env -i \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin \
    $(get_shell)
#----------------------------------------------------------------------------------------------------------------------------------------------------
umount_virtual                                                            # umount virtual filesystems from chroot
#----------------------------------------------------------------------------------------------------------------------------------------------------
