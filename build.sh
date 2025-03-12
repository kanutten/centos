
#!/bin/bash
##!/usr/bin/env bash

set -ouex pipefail

MAJOR_VERSION_NUMBER="$(sh -c '. /usr/lib/os-release ; echo $VERSION_ID')"
export MAJOR_VERSION_NUMBER
dnf -y install fuse
dnf -y install "Virtualization Hypervisor" 
 #dnf -y group install "Virtualization Tools"

# ZFS Kernel Module
# Documentation on https://openzfs.github.io/openzfs-docs/Getting%20Started/RHEL-based%20distro/index.html
# Prefer DKMS installation since it has support for kernels that arent the current EL ones
# dnf -y install https://zfsonlinux.org/epel/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm
# Kernel needs to be updated to get ZFS support
# for pkg in kernel kernel-core kernel-modules kernel-modules-core ; do rpm --erase $pkg --nodeps ; done
# dnf install -y kernel kernel-core kernel-modules{,-core,-extra}
# dnf -y install kernel-devel # Is also required for building DKMS module
# dnf -y install zfs
# echo "zfs" | tee /etc/modules-load.d/zfs.conf
