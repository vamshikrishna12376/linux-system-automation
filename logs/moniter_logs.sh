#!/bin/bash
# monitor_logs.sh - Monitor system logs for errors

LOG_FILE="/var/log/syslog"
ALERT_KEYWORDS=("error" "failed" "critical")
ALERT_LOG="/var/log/monitor_alerts.log"

# Check if log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Log file $LOG_FILE not found! Exiting..."
    exit 1
fi

echo "Monitoring $LOG_FILE for critical issues..."

tail -Fn0 "$LOG_FILE" | while read line; do
    for keyword in "${ALERT_KEYWORDS[@]}"; do
        if echo "$line" | grep -i "$keyword" > /dev/null; then
            echo "[ALERT] $(date): $line" | tee -a "$ALERT_LOG"
        fi
    done
done

