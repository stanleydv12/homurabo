#!/bin/bash

# Directory to store snapshots
SNAPSHOT_DIR="/var/lib/libvirt/snapshots"
# Current date
DATE=$(date +%Y-%m-%d)
# Current Snapshot directory
BASE_SNAPSHOT_DIR="$SNAPSHOT_DIR/$DATE"
mkdir -p "$BASE_SNAPSHOT_DIR"

# List all VMs
vms=$(virsh list --all --name)

# Create snapshot for each VM
for vm in $vms; do
    if [ -n "$vm" ]; then
        echo "Creating disk-only snapshot for $vm VM"

         # Define the snapshot file path
        snapshot_file="${BASE_SNAPSHOT_DIR}/${vm}_snapshot.qcow2"

        # Create the disk-only snapshot with the specified file path
        virsh snapshot-create-as --domain "$vm" --name "${vm}_snapshot" \
          --disk-only --diskspec vda,file="$snapshot_file" --atomic

        echo "Snapshot created: $snapshot_file"
    fi
done

