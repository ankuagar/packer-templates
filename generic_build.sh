#!/bin/bash -x

time PACKER_LOG=1 packer build -on-error=ask -var-file=c6x64/newuser.json c6x64/minimal.json
[ "$?" -ne "0" ] && exit 1
sleep 5
time PACKER_LOG=1 packer build -on-error=ask -var-file=c6x64/newuser.json c6x64/kernel-ml-epel.json
[ "$?" -ne "0" ] && exit 1
sleep 5
time PACKER_LOG=1 packer build -on-error=ask -var-file=c6x64/newuser.json c6x64/gui.json
[ "$?" -ne "0" ] && exit 1
sleep 5
time PACKER_LOG=1 packer build -on-error=ask -var-file=c6x64/newuser.json c6x64/gui-dev-java.json
