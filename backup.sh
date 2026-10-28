#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"

SOURCE_DIR="$SCRIPT_DIR/source"

BACKUP_DIR="$SCRIPT_DIR/backups"

BACKUP_DATE=$(date "+%d-%m-%Y")
BACKUP_TIME=$(date "+%r")

LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

if [ -d "$BACKUP_DIR" ]; then
	echo "Backup started at ${BACKUP_TIME} on ${BACKUP_DATE}" >> "$LOG_FILE"
	echo "Backup started at ${BACKUP_TIME} on ${BACKUP_DATE}"
	exit 1
else
	echo "Backup Folder does not exist. Backup could not be started." >> "$LOG_FILE"
	echo "Backup Folder does not exist. Backup could not be started."
fi

if [ ! -d "$SOURCE_DIR" ]; then
	echo "The file '${BACKUP_TIME}__${BACKUP_DATE}__backup.tar.gz' has not been created."
	echo "The file '${BACKUP_TIME}__${BACKUP_DATE}__backup.tar.gz' has not been created." >> "$LOG_FILE"
	echo "Directory does not exist."
	echo "Error: Directory '$SOURCE_DIR' does not exist." >> "$LOG_FILE"
	exit 1
fi

if [ -z "$(find $SOURCEDIR -maxdepth 0 -empty)" ]; then
	echo "Folder is not empty"
	echo "Folder is not empty" >> "$LOG_FILE"
else
	echo "Folder is empty"
	echo "Folder is empty" >> "$LOG_FILE"
fi

cd "$SOURCE_DIR" || exit 1
echo "The file '${BACKUP_TIME}__${BACKUP_DATE}__backup.tar.gz' has been created."
echo "The file '${BACKUP_TIME}__${BACKUP_DATE}__backup.tar.gz' has been created." >> "$LOG_FILE"
tar -czvf "$BACKUP_DIR/${BACKUP_TIME}__${BACKUP_DATE}__backup.tar.gz" .

EXIT_STATUS=$?
echo "Exit Status is ${EXIT_STATUS}." >> "$LOG_FILE"

if [ "$EXIT_STATUS" -eq 0 ]; then
	echo "Backup file was created successfully. \n" >> "$LOG_FILE"
else
	echo "Backup file was not created successfully. \n" >> "$LOG_FILE"
fi


