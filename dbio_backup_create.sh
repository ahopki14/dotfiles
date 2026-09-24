#!/bin/bash
# Backs up dbio directory and splits to chunks for easier backup to Proton Drive
DATE=$(date -I)
mkdir -p /mnt/md0/backup/dbio_backup_${DATE}/
tar --exclude=/mnt/md0/dbio/data \
        --exclude=/mnt/md0/dbio/client/*/data \
        -zcvpf -  /mnt/md0/dbio/ | \
        split -b 5G --numeric-suffixes - /mnt/md0/backup/dbio_backup_${DATE}/dbio_backup_

# copy to proton drive
proton-drive filesystem upload /mnt/md0/backup/dbio_backup_${DATE}/ /my-files/
