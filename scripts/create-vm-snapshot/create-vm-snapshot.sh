#!/bin/bash

# Get current date
date=$(date +"%d-%m-%Y")

# List all VMs
vms=$(virsh list --all --name)

# Create snapshot for each VM
for vm in $vms; do
    if [ -n "$vm" ]; then
        echo "Creating snapshot for $vm VM"

        name="${vm}-snapshot-${date}"

        # Create the snapshot with the specified file path
        virsh snapshot-create-as --domain "$vm" --name "$name"
    fi 
done