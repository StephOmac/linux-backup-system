# Linux Backup System

A Bash-based Linux administration project that automates the process of creating compressed backups, restoring files, and managing backup archives through a simple menu-driven interface.

## Features

- **Compressed backups:** Creates `.tar.gz` archives of a specified directory.
- **Timestamped filenames:** Uses timestamps to distinguish backup archives and reduce accidental overwriting.
- **Backup logging:** Records backup attempts, exit statuses, and success or failure messages.
- **Input validation:** Checks directory paths and archive existence before performing operations.
- **File restoration:** Extracts selected backup archives into a specified destination directory.
- **Backup listing:** Displays available backup archives.
- **Menu-driven interface:** Provides a central menu for accessing backup and restoration features.
- **Error handling:** Handles invalid inputs and failed operations.

## Project Structure

```text
linux-backup-system/
├── source/       # Sample files to back up
├── backups/      # Compressed backup archives
├── logs/         # Backup and restoration logs
├── backup.sh     # Creates backups
├── restore.sh    # Restores files
├── main.sh       # Main menu
└── README.md     # Project documentation
```

## Requirements

- Linux or Ubuntu through Windows Subsystem for Linux (WSL)
- Bash shell
- `tar` utility
- Standard Linux command-line utilities

## Installation

1. Clone or download the project into your local machine.
2. Navigate to the project directory.
3. Ensure the `source`, `backups`, and `logs` directories exist.
4. Add sample files to the `source` directory.
5. Make the scripts executable:

```bash
chmod +x main.sh backup.sh restore.sh
```

## Usage

### Start the application

From the project directory, run:

```bash
./main.sh
```

The main menu provides the following options:

1. **Create a backup** — Runs `backup.sh` to create a compressed archive.
2. **Restore a backup** — Runs `restore.sh` to restore files from an existing archive.
3. **List backups** — Displays the available `.tar.gz` archives.
4. **Exit** — Closes the application.

### Create a backup

Select option 1 and provide the directory you want to back up when prompted. The script creates a compressed archive in the `backups` directory and records the result in the backup log.

### Restore files

Select option 2 and enter the filename of an existing archive. Then provide the destination directory for the restored files.

For testing, restore files to a separate directory rather than overwriting the original files.

### View backups

Select option 3 to list the available compressed backup archives.

## Logging

The application stores log records in the `logs` directory:

- `backup.log` — Records backup attempts and their outcomes.
- `restore.log` — Records restoration attempts and their outcomes.

Logs are appended to preserve earlier records.

## Testing

Recommended tests include:

- Creating backups from a directory containing files.
- Running the backup script multiple times to verify timestamped filenames.
- Entering a nonexistent source directory.
- Attempting to restore an invalid or nonexistent archive.
- Restoring an archive to a new directory and checking the restored files.
- Selecting invalid options in the main menu.
- Checking log files after successful and failed operations.

## Limitations

- Backups are initiated manually through the menu; scheduled backups are not included.
- Backup archives are stored locally and may be lost if the same storage device fails.
- Automatic deletion and retention of old backups are not currently included.
- Backup integrity and restoration should be verified through testing.

## Skills Practised

- Bash scripting and variables
- Conditional statements and loops
- User input handling
- File and directory management
- Archive creation and extraction with `tar`
- Exit-status checking and error handling
- Output redirection and logging
- Modular scripts and menu-driven interfaces
- Linux command-line administration

## Future Improvements

- Add backup retention policies.
- Improve archive integrity verification.
- Add clearer reporting and summary statistics.
- Support optional exclusion patterns for files and directories.
- Add configurable backup destinations.

## Author

Developed as a hands-on project to practise Linux administration and Bash scripting for Cloud and DevOps engineering.
