#!/bin/bash

REPO_URL="https://github.com/Ammarkhan96/github-action-cicd-project"
BACKUP_DIR="opt/backups/git"
REPO_NAME=$(basename "REPO_URL" .git)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="$BACKUP_DIR/$REPO_NAME"_"$TIMESTAMP".tar.gz

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

echo "Backing up repository: $REPO_URL to $BACKUP_PATH"

# Create a mirrored clone
git clone --mirror "$REPO_URL" "$BACKUP_DIR/$REPO_NAME.mirror"

# Create a compressed archive of the mirrored clone
tar -czvf "$BACKUP_PATH" "$BACKUP_DIR/$REPO_NAME.mirror"

# Removed the mirrored clone 
rm -rf "$BACKUP_DIR/$REPO_NAME.mirror"

echo "Backup completed successfully"

exit 0
