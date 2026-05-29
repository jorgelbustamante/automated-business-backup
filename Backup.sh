#!/bin/bash

#======================================================================
# PROJECT 1 : Automated Business Data Backup Script
# Desciption: Compresses a Source directory, moves it to a backup
#               folder, tracks success in a log, and deletes old files.
#=======================================================================

# 1 Define Directories ( Change these paths to match your system)
SOURCE_DIR="$HOME/Business_Data"
BACKUP_DIR="$HOME/Secure_Backups"
LOG_FILE="$HOME/portfolio/backup_log.txt"

# Create the backup directory if it doesn't already exist
mkdir -p "$BACKUP_DIR"
mkdir -p "$HOME/portfolio"
# 2. Generate A unique Filename Using the Current Date
TODAY=$(date +%F)
BACKUP_FILE="backup_$TODAY.tar.gz"

# 3. RUN THE COMPRESSION AND BACKUP
# 'tar -czf' creates a compressed archive (.tar.gz)
if tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" . 2>> "$LOG_FILE"; then
        # If the tar command succeeds, log a success message
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: Backup created at $BACKUP_DIR/$BACKUP_FILE" >> "$LOG_FILE"
else
        # If the tar command fails, log an error message
        echo "[$(date '+%Y-%m-%D %H:%M:%S')] ERROR: Backup failed. Check System Resources." >> "$LOG_FILE"
fi

# 4. Housekeeping (prune old Back ups)
# find and delete backups in the foler that ore older than 30 Days
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +30 -delete
echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: Housekeeping Complete. Old Backups Pruned."
