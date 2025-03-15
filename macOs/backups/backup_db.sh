#!/bin/bash
# backup_db.sh - Automate MySQL database backups on macOS

DB_NAME="your_database"
DB_USER="your_user"
DB_PASSWORD="your_password"
BACKUP_DIR="$HOME/Backup"
BACKUP_FILE="$BACKUP_DIR/db_backup_$(date +%Y%m%d_%H%M%S).sql.gz"

# Ensure MySQL is installed
if ! command -v mysqldump &> /dev/null; then
    echo "Error: MySQL is not installed. Install it using Homebrew: brew install mysql"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform database backup
echo "Starting database backup for $DB_NAME..."
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" | gzip > "$BACKUP_FILE"

if [[ $? -eq 0 ]]; then
    echo "Database backup completed successfully: $BACKUP_FILE"
else
    echo "Database backup failed."
fi

# Retain only the last 5 backups
echo "Cleaning up old database backups..."
ls -1t "$BACKUP_DIR"/*.sql.gz | tail -n +6 | xargs rm -f

echo "Database backup process finished."

