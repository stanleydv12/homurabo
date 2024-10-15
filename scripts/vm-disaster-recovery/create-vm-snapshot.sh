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

        virsh snapshot-create-as --domain "$vm" --name "$name" \
        && echo "[$(date)] Snapshot created successfully for $vm: $name" >> "$LOG_FILE" \
        || echo "[$(date)] Failed to create snapshot for $vm" >> "$LOG_FILE"
    fi 
done

# Log the end of the snapshot process
echo "[$(date)] Snapshot process completed" >> "$LOG_FILE"
