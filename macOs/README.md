# Linux System Automation with Shell Scripting (macOS Compatible)

## 📌 Project Overview
Automates system administration tasks on macOS using Bash scripting and `launchd` for task scheduling.

## 🛠 Features
- **Log Monitoring**: Detects critical issues in system logs.
- **User Management**: Automates user creation and deletion.
- **File & Database Backup**: Automates backup for system files and MySQL databases.
- **Scheduled Execution**: Uses `launchd` to run scripts at scheduled intervals.

## 🚀 Setup & Usage

### 1️⃣ **Log Monitoring**
```bash
./monitor_logs.sh
```
This script monitors `/var/log/system.log` for keywords like "error" and "critical".

### 2️⃣ **User Management**
```bash
./manage_users.sh add username  # Add a user
./manage_users.sh delete username  # Delete a user
```
Manages user accounts using `sysadminctl`.

### 3️⃣ **File Backup**
```bash
./backup_files.sh
```
Backs up the `Documents` folder to `Backup/` and retains only the latest 5 backups.

### 4️⃣ **Database Backup**
```bash
./backup_db.sh
```
Creates a compressed MySQL database backup and retains the last 5 backups.

### 5️⃣ **Automating Backups with launchd**
1. Move `com.user.backup.plist` to `~/Library/LaunchAgents/`
2. Load it using:
   ```bash
   launchctl load ~/Library/LaunchAgents/com.user.backup.plist
   ```
3. Confirm it's running:
   ```bash
   launchctl list | grep com.user.backup
   ```
next version loading.....

