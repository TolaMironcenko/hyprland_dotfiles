#!/bin/sh

PATH=$1
SHELL=$2

#------- Check root func -------------------
check_root() {
    if [ $(/usr/bin/id -u) -ne 0 ]; then
        printf "** You must be root\n"
        exit 1
    fi
}
#-------------------------------------------

#----------- checking or create dirs -------
check_or_mkdir() {
    [ ! -d $PATH/dev ] && mkdir -pv $PATH/dev
    [ ! -d $PATH/proc ] && mkdir -pv $PATH/proc
    [ ! -d $PATH/sys ] && mkdir -pv $PATH/sys
    [ ! -d $PATH/run ] && mkdir -pv $PATH/run
}
#-------------------------------------------

#-------- mount virtual filesystems --------
mount_virtual() {
    /usr/bin/mount -v --bind /dev $PATH/dev
    /usr/bin/mount -vt devpts devpts -o gid=5,mode=0620 $PATH/dev/pts
    /usr/bin/mount -vt proc proc $PATH/proc
    /usr/bin/mount -vt sysfs sysfs $PATH/sys
    /usr/bin/mount -vt tmpfs tmpfs $PATH/run
    if [ -h $PATH/dev/shm ]; then
        /usr/bin/install -v -d -m 1777 $PATH$(/usr/bin/realpath /dev/shm)
    else
        /usr/bin/mount -vt tmpfs -o nosuid,nodev tmpfs $PATH/dev/shm
    fi
    /usr/bin/cp -v /etc/resolv.conf $PATH/etc/resolv.conf
}
#-------------------------------------------

#------ umount virtual filesystems ---------
umount_virtual() {
    /usr/bin/mountpoint -q $PATH/dev/shm && /usr/bin/umount $PATH/dev/shm
    /usr/bin/umount $PATH/dev/pts
    /usr/bin/umount $PATH/{sys,proc,run,dev}
}
#-------------------------------------------

#------ get shell path func ----------------
get_shell() {
    if [[ "$SHELL" != "" ]]; then
        echo $SHELL
    fi
    echo "/bin/sh"
}
#-------------------------------------------

check_root
check_or_mkdir
mount_virtual
/usr/bin/chroot \
    $PATH \
    /usr/bin/env -i \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin \
    $(get_shell)
umount_virtual
