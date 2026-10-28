#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backups"
LOG_DIR="$SCRIPT_DIR/logs"
RLOG_DIR="$LOG_DIR/restore.log"

ls "$BACKUP_DIR"/*.tar.gz 2>/dev/null

read -p "Enter the name of the archive you wish to restore: " ARCHIVE_NAME

if [ -f "$BACKUP_DIR/$ARCHIVE_NAME" ]; then
	echo "File exists"
	echo "File exists: $ARCHIVE_NAME" >> "$RLOG_DIR"
else
	echo "File does not exist"
	echo "File does not exist: $ARCHIVE_NAME" >> "$RLOG_DIR"
	exit 1
fi

read -p "Enter the directory where the files should be restored: " NEW_ARCHIVE_NAME

mkdir -p "$NEW_ARCHIVE_NAME"

if [ -d "$NEW_ARCHIVE_NAME" ]; then

	echo "Directory exists"
	echo "Directory exists: $NEW_ARCHIVE_NAME" >> "$RLOG_DIR"

	tar -xvzf "$BACKUP_DIR/$ARCHIVE_NAME" -C "${NEW_ARCHIVE_NAME}"

	EX_STATUS=$?

	if [ "$EX_STATUS" -eq 0 ]; then
		echo "Files restored successfully"
		echo "Files restored successfully" >> "$RLOG_DIR"
	else
		echo "Files could not be restored"
		echo "Files could not be restored" >> "$RLOG_DIR"
		exit "$EX_STATUS"
	fi

else
	echo "Couldn't create directory: $NEW_ARCHIVE_NAME"
	echo "Couldn't create directory: $NEW_ARCHIVE_NAME" >> "$RLOG_DIR"
	exit 1
fi
