# VM Disaster Recovery - Snapshot Management

This folder is part of the **Homelab Project** and contains scripts for managing VM disaster recovery using **virsh snapshots**. The scripts provide functionality for:

- **Snapshot Creation**: Automatically take disk snapshots of VMs.
- **Snapshot Cleanup**: Delete old snapshots based on a configurable retention period.
- **Cron Automation**: Schedule daily execution of snapshot creation and cleanup.

To automate the execution of the snapshot creation and cleanup scripts, you can add the following line to your crontab:

```bash
0 0 * * * /homelab/scripts/vm-disaster-recovery/trigger.sh
