#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════╗
# ║        FINAL_UNIFIED_BACKUP.SH — SAFE BACKUP WORKFLOW               ║
# ╠══════════════════════════════════════════════════════════════════════╣
# ║ USAGE                                                               ║
# ║ ─────────────────────────────────────────────────────────────────── ║
# ║ ./final_unified_backup.sh                  → Dry-run only (default) ║
# ║ ./final_unified_backup.sh --debug          → Dry-run + shell trace ║
# ║ ./final_unified_backup.sh --commit         → Real backup (opt-in)  ║
# ║ ./final_unified_backup.sh --debug --commit → Real backup + trace   ║
# ╠══════════════════════════════════════════════════════════════════════╣
# ║ DESTINATIONS                                                        ║
# ║ ─────────────────────────────────────────────────────────────────── ║
# ║ Primary:   /home/blue/backups/webace/library → Linux-native backup  ║
# ║ USB:       /mnt/d/webace_backup 	         → NTFS via drvfs       ║
# ╠══════════════════════════════════════════════════════════════════════╣
# ║ SAFETY FEATURES                                                     ║
# ║ ─────────────────────────────────────────────────────────────────── ║
# ║ • Dry-run by default — no files copied unless --commit is used     ║
# ║ • Sanity checks for critical paths and unexpanded variables        ║
# ║ • Auto-mount USB with verification                                 ║
# ║ • Logging to ~/backup_logs/backup_log.txt                          ║
# ║ • Log rotation — keeps last 30 entries                             ║
# ║ • Strict shell mode: set -e -u -o pipefail                         ║
# ╠══════════════════════════════════════════════════════════════════════╣
# ║ NOTES                                                               ║
# ║ ─────────────────────────────────────────────────────────────────── ║
# ║ • Backup mirrors source: deletes files not present in source       ║
# ║ • Use --commit only when you're confident in the preview           ║
# ║ • Use --debug to trace execution for troubleshooting               ║
# ╚══════════════════════════════════════════════════════════════════════╝


set -e -u -o pipefail

# --- CONFIGURATION --- 
SOURCE="$HOME/webace/library"
PROJECT=$(basename "$SOURCE")
DRIVE_LETTER="d"
DEST_FOLDER="webace_backup/library"
LOGFILE="$HOME/backup_logs/backup_log.txt"
MAX_LINES="30"

# --- FLAGS ---
DEBUG=false
COMMIT=false

while [[ $# -gt 0 ]]; do
	case "$1" in
		--debug)
			DEBUG=true
			set -x
			;;
		--commit)
			COMMIT=true
			;;
		*)
			echo "❌ Unknown option: $1"
			exit 1
			;;
	esac
	shift
done

# --- PATH SANITY GUARD ---
check_path() {
	local name="$1"
	local val="$2"
	
	if [[ -z "$val" ]]; then
		echo "❌ ERROR: $name is empty. Aborting."
		exit 1
	fi
	if [[ "$val" == \$* ]]; then
		echo "❌ ERROR: $name appears suspicious ('$val'). Aborting."
		exit 1
	fi
	if [[ "$val" == "/" ]]; then
		echo "❌ ERROR: $name points to root '/'. Aborting."
		exit 1
	fi
}

# --- ENSURE LOG DIRECTORY EXISTS ---
mkdir -p "$(dirname "$LOGFILE")"

# --- MOUNT USB DRIVE ---
MOUNT_PATH="/mnt/$DRIVE_LETTER"
check_path "MOUNT_PATH" "$MOUNT_PATH"

if ! mountpoint -q "$MOUNT_PATH"; then
	echo "Drive $DRIVE_LETTER: not mounted. Attempting to mount..."
	sudo mkdir -p "$MOUNT_PATH"
	sudo mount -t drvfs "${DRIVE_LETTER^^}:" "$MOUNT_PATH"
	
	if ! mountpoint -q "$MOUNT_PATH"; then
		echo "Failed to mount $DRIVE_LETTER:. Exiting."
		echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup FAILED (could not mount $DRIVE_LETTER:)" >> "$LOGFILE"
		exit 1
	else
		echo "✅ Mounted $DRIVE_LETTER: at $MOUNT_PATH"
	fi
fi

# --- SET DESTINATIONS ---
USB_DEST="$MOUNT_PATH/$DEST_FOLDER"
PRIMARY_DEST="/home/blue/backups/$PROJECT"

check_path "USB_DEST" "$USB_DEST"
check_path "PRIMARY_DEST" "$PRIMARY_DEST"

echo "Ensuring destination folders exist..."
mkdir -p "$PRIMARY_DEST" && echo "✅ Created: $PRIMARY_DEST"
mkdir -p "$USB_DEST" && echo "✅ Created: $USB_DEST"

# --- RSYNC HELPER FUNCTION ---
run_rsync () {
	local src="$1"
	local dest="$2"
	
	if [[ -z "$src" || -z "$dest" ]]; then
		echo "❌ ERROR: Source or destination is empty. Aborting."
		exit 1
	fi
	if [[ "$dest" =~ ^[A-Z_]+$ ]]; then
		echo "❌ ERROR: Destination looks like an unexpanded variable ('$dest'). Aborting."
		exit 1
	fi
	case "$dest" in
		"/"|"/usr"|"/etc"|"/var"|"/boot"|"/root")
			echo "❌ ERROR: Destination is a critical path system ('$dest'). Aborting."
			exit 1
			;;
	esac
	
	local flags
	if [[ "$dest" == /mnt/* ]]; then
		flags="-rt --no-perms --no-owner --no-group --no-times --delete"
	else
		flags="-a --delete"
	fi
	
	if ! $COMMIT; then
		flags="$flags --dry-run --itemize-changes"
		echo "Dry-run mode: showing what would happen..."
	fi
	
	echo "About to run: rsync $flags '$src/' → '$dest/'"
	rsync $flags "$src/" "$dest/"
}

# --- RUN BACKUPS ---
run_rsync "$SOURCE" "$PRIMARY_DEST"
run_rsync "$SOURCE" "$USB_DEST"

# --- LOG RESULT ---
if $COMMIT; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup SUCCESS: $PROJECT" >> "$LOGFILE"
	echo "Backup completed for $PROJECT."
else
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Dry-run only: $PROJECT" >> "$LOGFILE"
	echo "Dry-run completed for $PROJECT. No files copied."
fi

# --- ROTATE LOG ---
tail -n $MAX_LINES "$LOGFILE" > "$LOGFILE.tmp" && mv "$LOGFILE.tmp" "$LOGFILE"

# --- TURN OFF DEBUG IF ENABLED ---
if $DEBUG; then
	set +x
fi

echo "✅ Log updated. Keeping last $MAX_LINES entries."
