# Linux System Automation with Shell Scripting

## 📌 Project Overview
Automates system administration tasks on Linux using Bash scripting and `cron` for task scheduling.

## 🛠 Features
- **Log Monitoring**: Detects critical issues in system logs.
- **User Management**: Automates user creation and deletion.
- **File & Database Backup**: Automates backup for system files and MySQL databases.
- **Scheduled Execution**: Uses `cron` to run scripts at scheduled intervals.

## 🚀 Setup & Usage

### 1️⃣ **Log Monitoring**
```bash
./monitor_logs.sh
```
This script monitors `/var/log/syslog` for keywords like "error" and "critical".

### 2️⃣ **User Management**
```bash
./manage_users.sh add username  # Add a user
./manage_users.sh delete username  # Delete a user
```
Manages user accounts using `useradd` and `userdel`.

### 3️⃣ **File Backup**
```bash
./backup_files.sh
```
Backs up the `/home` directory to `/backup/` and retains only the latest 5 backups.

### 4️⃣ **Database Backup**
```bash
./backup_db.sh
```
Creates a compressed MySQL database backup and retains the last 5 backups.

### 5️⃣ **Automating Backups with Cron**
1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add the following lines to schedule backups daily at midnight:
   ```bash
   0 0 * * * /path/to/backup_files.sh
   0 0 * * * /path/to/backup_db.sh
   ```
3. Save and exit. Verify with:
   ```bash
   crontab -l
   ```

## THANK YOU!!!

