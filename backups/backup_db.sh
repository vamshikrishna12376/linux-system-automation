DB_NAME="your_database"
DB_USER="your_user"
DB_PASSWORD="your_password"
DB_BACKUP_FILE="$BACKUP_DIR/db_backup_$(date +%Y%m%d_%H%M%S).sql.gz"

if ! command -v mysqldump &> /dev/null; then
    echo "Error: MySQL is not installed. Install it using: sudo apt install mysql-client"
    exit 1
fi

echo "Starting database backup for $DB_NAME..."
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" | gzip > "$DB_BACKUP_FILE"

echo "Database backup completed successfully."

ls -1t "$BACKUP_DIR"/*.sql.gz | tail -n +6 | xargs rm -f

echo "Database backup process finished."
