
#!/bin/bash
##!/usr/bin/env bash

set -ouex pipefail

MAJOR_VERSION_NUMBER="$(sh -c '. /usr/lib/os-release ; echo $VERSION_ID')"
export MAJOR_VERSION_NUMBER
#set -xeuo pipefail
#dnf config-manager --add-repo "registry.fedoraproject.org"
#dnf config-manager 
#dnf config-manager --set-disabled docker-ce-stable
#dnf -y --enablerepo docker-ce-stable install docker-ce \
dnf config-manager --set-enabled crb
dnf -y install "https://dl.fedoraproject.org/pub/epel/epel-release-latest-$MAJOR_VERSION_NUMBER.noarch.rpm"
dnf -y install --nogpgcheck "https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm"
#dnf -y install "https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-9.noarch.rpm"
#dnf -y install "https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-9.noarch.rpm"
dnf -y install fuse \
flameshot \
fuse-libs
#flameshot \
#nextcloud-client-nautilus \ 
#nextcloud-client






#nextcloud-client-nautilus

 #nextcloud-client
 #"nextcloud-client-nautilus" \
 #"fuse" \
 #"fuse-libs"
 #sg3_utils
#dnf config-manager --add-repo "https://download.docker.com/linux/centos/docker-ce.repo"
#dnf config-manager --set-disabled docker-ce-stable
#dnf -y --enablerepo docker-ce-stable install docker-ce \
#   docker-ce-cli \
#   containerd.io \
#   docker-buildx-plugin \
#   docker-compose-plugin && \
#   systemctl enable docker 

 #dnf -y group install "Virtualization Hypervisor" 
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
