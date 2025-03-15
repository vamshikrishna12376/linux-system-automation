#!/bin/bash
# backup_files.sh - Automate file backups on macOS

SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="$HOME/Backup"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform backup using tar
echo "Starting backup of $SOURCE_DIR to $BACKUP_FILE..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR" && echo "Backup completed successfully."

# Retain only the last 5 backups
echo "Cleaning up old backups..."
ls -1t "$BACKUP_DIR"/*.tar.gz | tail -n +6 | xargs rm -f

echo "Backup process finished."

