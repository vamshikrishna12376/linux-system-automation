#!/bin/bash
# crontab_setup.sh - Automate cron job scheduling

LOG_FILE="/var/log/cronjob.log"
CRON_FILE="/tmp/my_cron_jobs"

# Define cron jobs
CRON_JOBS=""
CRON_JOBS+="*/5 * * * * /path/to/logs/monitor_logs.sh >> $LOG_FILE 2>&1\n"
CRON_JOBS+="0 0 * * * /path/to/users/manage_users.sh >> $LOG_FILE 2>&1\n"
CRON_JOBS+="0 2 * * * /path/to/backups/backup_files.sh >> $LOG_FILE 2>&1\n"

# Write cron jobs to a temporary file
echo -e "$CRON_JOBS" > "$CRON_FILE"

# Install new cron jobs
crontab "$CRON_FILE"

# Clean up
rm "$CRON_FILE"

echo "Cron jobs installed successfully!" | tee -a "$LOG_FILE"

