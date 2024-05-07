#!/bin/bash


# To run this script automatically every day at 3am please add the following line to the cronjobs via crontab -e
# 0 3 * * * ./backup_database.sh


# Configuration
DB_USER="$MYSQL_USER"
DB_PASSWORD="$MYSQL_PASSWORD"
DB_NAME="gigachadcorp"
BACKUP_DIR="/var/backups"
DAYS_TO_KEEP=7

# Ensure that credentials are set
if [ -z "$DB_USER" ] || [ -z "$DB_PASSWORD" ]; then
    echo "Error: Database credentials are not set."
    exit 1
fi

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Format for the backup filename: db_name-yyyy-mm-dd.sql.gz
FILENAME="$DB_NAME-$(date +%F).sql.gz"

# Backup command using credentials from environment variables
mysqldump --user="$DB_USER" --password="$DB_PASSWORD" $DB_NAME | gzip > "$BACKUP_DIR/$FILENAME"

# Remove backups older than 7 days
find "$BACKUP_DIR" -type f -mtime +$DAYS_TO_KEEP -name '*.sql.gz' -exec rm {} +