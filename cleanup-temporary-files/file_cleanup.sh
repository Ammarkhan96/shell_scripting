#!/bin/bash

TEMP_DIRS=("/tmp" "/var/tmp" "/app/cache")
RETENTION_DAYS=7

echo "Starting cleanup of temporary files older than $RETENTION_DAYS days..."

for TEM_DIR in "${TEMP_DIRS[@]}"; do
	echo "Cleaning up files in $TEMP_DIRS..."
	find "$TEMP_DIRS" -type f -mtime +"$RETENTION_DAYS" -delete
	find "$TEMP_DIRS" -type d -empty -delete
done

echo "Temporary file cleanup completed."
exit 0
