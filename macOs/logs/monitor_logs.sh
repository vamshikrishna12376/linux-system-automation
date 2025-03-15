#!/bin/bash
# monitor_logs.sh - Monitor system logs for errors (macOS version)

LOG_FILE="/var/log/system.log"
ALERT_KEYWORDS=("error" "failed" "critical")
ALERT_LOG="/var/log/monitor_alerts.log"

echo "Monitoring $LOG_FILE for critical issues..."

log stream --predicate 'subsystem contains "com.apple"' --style syslog | while read line; do
    for keyword in "${ALERT_KEYWORDS[@]}"; do
        if echo "$line" | grep -i "$keyword" > /dev/null; then
            echo "[ALERT] $(date): $line" | tee -a "$ALERT_LOG"
        fi
    done
done

