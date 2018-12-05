#!/bin/bash

VM_NAME="AutoVM"
DEBIAN_CD_IMAGE="/sgoinfre/ISOs/debian-9.6.0-amd64-netinst.iso"

# Create VM
VBoxManage createvm --name "$VM_NAME" --ostype Debian_64 --register

# VM Settings
VBoxManage hostonlyif create
VBoxManage modifyvm "$VM_NAME" \
	--memory 4096 \
	--cpus 4 \
	--accelerate3d on \
	--vram 128 \
	--nic1 NAT --nic2 hostonly --hostonlyadapter2 vboxnet0 \
	--mouse usbtablet

# If error delete the medium listed in :
# VBoxManage list hdds
# VBoxManage closemedium disk $UUID --delete
# If you have a duplicate UUID error try
# vboxmanage internalcommands sethduuid newhdd.vdi

# Virtual disk creation
 VBoxManage createhd --filename "HD.$VM_NAME.vdi"  --size 8188
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata \
	--controller IntelAhci 
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 \
	--device 0 --type hdd --medium "HD.$VM_NAME.vdi"

VBoxManage storagectl "$VM_NAME" --name "IDE Controller" --add ide \
	--controller PIIX4
VBoxManage storageattach "$VM_NAME" --storagectl "IDE Controller" --port 0 \
	--device 0 --type dvddrive --medium "$DEBIAN_CD_IMAGE" 
