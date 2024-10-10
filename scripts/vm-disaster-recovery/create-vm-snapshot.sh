#!/bin/bash

# Log file
LOG_FILE="/var/log/snapshot_script.log"

# Get current date
date=$(date +"%d-%m-%Y")

# Log the start of the snapshot process
echo "[$(date)] Snapshot process started" >> "$LOG_FILE"

# List all VMs
vms=$(virsh list --all --name)

# Create snapshot for each VM
for vm in $vms; do
    if [ -n "$vm" ]; then
        echo "[$(date)] Creating snapshot for $vm VM" >> "$LOG_FILE"

        name="${vm}-snapshot-${date}"

        # Create the snapshot with the specified file path
        if virsh snapshot-create-as --domain "$vm" --name "$name"; then
            echo "[$(date)] Snapshot created successfully for $vm: $name" >> "$LOG_FILE"
        else
            echo "[$(date)] Failed to create snapshot for $vm" >> "$LOG_FILE"
        fi
    fi 
done

# Log the end of the snapshot process
echo "[$(date)] Snapshot process completed" >> "$LOG_FILE"
