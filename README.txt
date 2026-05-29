====================================================================
PRODUCT BACKUP UTILITY v1.0
Developed for: Test
====================================================================

DESCRIPTION:
This utility automates the nightly compression and backup of your 
operational files to prevent data loss.

DIRECTORY STRUCTURE:
- Active Data Target: /home/user/Business_Data
- Secure Storage Location: /home/user/Secure_Backups
- Activity Log File: /home/user/portfolio/backup_log.txt

AUTOMATION SCHEDULE:
Configured via system cron to run daily at 2:00 AM.
Retention Policy: Automated pruning removes files older than 30 days 
to protect server storage capacity.

EMERGENCY RESTORATION INSTRUCTIONS:
To restore data from a backup archive, run the following command:
tar -xzf /home/user/Secure_Backups/backup_[DATE].tar.gz -C /home/user/Business_Data
