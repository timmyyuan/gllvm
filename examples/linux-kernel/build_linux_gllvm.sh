#!/usr/bin/env bash

export GOPATH=/vagrant/go

mkdir -p ${GOPATH}
go get github.com/SRI-CSL/gllvm/cmd/...

mkdir ${HOME}/linux_kernel
cd ${HOME}/linux_kernel
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

cd linux-stable
git checkout tags/v4.14.34
cp /vagrant/tinyconfig64 .config

make CC=gclang HOSTCC=gclang

get-bc -m -b built-in.o
get-bc -m vmlinux