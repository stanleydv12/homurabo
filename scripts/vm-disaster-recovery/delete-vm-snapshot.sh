#!/bin/bash

# Retention period in days
RETENTION_PERIOD=7

# Get current date
date=$(date +"%d-%m-%Y")
retention_date=$(date -d "-$RETENTION_PERIOD days" +"%d-%m-%Y")

echo "Current date: $date"
echo "Retention date: $retention_date"

# List all VMs
vms=$(virsh list --all --name)

# Delete snapshot for each VM
for vm in $vms; do
    if [ -n "$vm" ]; then
        echo "Deleting snapshot for $vm VM"

        # List all snapshots for the VM
        snapshots=$(virsh snapshot-list "$vm" --name)

        # Delete the snapshot with the specified file path
        for snapshot in $snapshots; do
            snapshot_date=$(echo "$snapshot" | grep -oE '[0-9]{2}-[0-9]{2}-[0-9]{4}')
            snapshot_name="${vm}-snapshot-${snapshot_date}"

            if [[ "$snapshot_date" < "$retention_date" ]]; then
                echo "Deleting snapshot: $snapshot_name"
                virsh snapshot-delete "$vm" --snapshotname "$snapshot_name"
            fi
        done
    fi
done


