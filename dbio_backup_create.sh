#!/bin/bash
# Backs up dbio directory and splits to chunks for easier backup to Proton Drive
mkdir -p /mnt/md0/backup/dbio_backup_$(date -I)/
tar --exclude=/mnt/md0/dbio/data \
        --exclude=/mnt/md0/dbio/client/*/data \
        -zcvpf -  /mnt/md0/dbio/ | \
        split -b 5G --numeric-suffixes - /mnt/md0/backup/dbio_backup_$(date -I)/dbio_backup_
