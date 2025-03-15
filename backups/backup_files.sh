#!/bin/bash
# backup_files.sh - Automate system file backups

BACKUP_SRC="/home"
BACKUP_DEST="/backups"
LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DEST/backup_$TIMESTAMP.tar.gz"

# Ensure backup destination exists
if [[ ! -d "$BACKUP_DEST" ]]; then
    mkdir -p "$BACKUP_DEST"
    echo "Created backup directory: $BACKUP_DEST" | tee -a "$LOG_FILE"
fi

# Perform backup
echo "Starting backup at $(date)" | tee -a "$LOG_FILE"
tar -czf "$BACKUP_FILE" "$BACKUP_SRC" 2>> "$LOG_FILE"

if [[ $? -eq 0 ]]; then
    echo "Backup successful: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    echo "Backup failed! Check logs." | tee -a "$LOG_FILE"
fi

