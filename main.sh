#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
BACKUP_DIR="$SCRIPT_DIR/backups"

while true
do
	echo "---LINUX BACKUP SYSTEM---"
	echo "1. CREATE A BACKUP"
	echo "2. RESTORE A BACKUP"
	echo "3. LIST BACKUPS"
	echo "4. EXIT"

	read -p "Choose an option: " choice

	case "$choice" in
		1)
			bash "$SCRIPT_DIR"/backup.sh
			;;
		2)
			bash "$SCRIPT_DIR"/restore.sh
			;;
		3)
			echo "AVAILBALE BACKUPS:"
			if compgen -G "BACKUP_DIR/*.tar.gz" > /dev/null; then
				ls -lh "BACKUP_DIR"/*.tar.gz
			else
				echo "No backup files found."
			fi
			;;
		4)
			echo "Exiting the interface"
			break
			;;
		*)
			echo "Invalid option. Try again."
			;;
	esac

	echo
done
