

/**  backup series 
/**** BACKS UP TO USB AND DISK

########################################################################
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
########################################################################



/**  create tree series  */
/*	create without override - does not override nor delete. if file 
/*   exists, quiet fail.

/**** USE THIS SERIES TO WRITE FRESH DIRECTORIES/CONTENTS TO DISK

########################################################################
#    create_tree_1.1
#
#	  Takes input from a text file 
#     and generates directories
#	  and subdirectories.
#
#	  Takes files from folder as boilerplate
#     to create default files containing
#	  boilerplate for each directory.
#
#     Does NOT overwrite nor delete.
#
#	NOTE: Directories will appear in same directory
#		as script.
#		
#
########################################################################


########################################################################
#    create_tree_1.2
#
#	  Takes input from a text file 
#     and generates directories
#	  and subdirectories.
#
#	  Takes files from folder as boilerplate
#     to create default files containing
#	  boilerplate for each directory.
#
#     Does NOT overwrite nor delete.
#
#	NEW: Updated sources and target.
#		Can now set paths from command line
#		for source and target.
#		
#	USAGE: ./create_tree_1-2.sh path/to/structure.txt path/to/boilerplate/ path/to/target-directory 
#
#	NOTE: path to target directory is relative to the directory from
#	where the script is run
#	eg. script location: /home/blue/webace/library/scripts
#		target location: /home/blue/webace/library
#		path to target: ../components
#
#	PLUS: BOILERPLATE_DIR now grabs all files.
#
########################################################################


########################################################################
#    create-tree-v1-3.sh
#
#	  Takes input from a text file 
#     and generates directories
#	  and subdirectories.
#
#	  Takes files from folder as boilerplate
#     to create default files containing
#	  boilerplate for each directory.
#
#     Does NOT overwrite nor delete existing directories/files.
#
#	NEW: Updated sources and target.
#		Can now set paths from command line
#		for source and target.
#		
#	USAGE: ./create-tree-v1-3.sh path/to/structure.txt path/to/boilerplate/ path/to/target-directory 
#
#	NOTE: target directory path is relative to the directory from
#			where the script is run.
#	
#	eg. script location: /home/blue/webace/library/scripts
#		target location: /home/blue/webace/library
#		path to target: ../components
#
#	UPDATE: changed order of inputs: entering just target path will
#			execute well.
#
########################################################################





/** overrides series
/****  USE THIS SERIES TO UPDATE EXISTING FILES


########################################################################
#    override-tree-files.sh
#
#	Overrides existing files in directory with
#		files of the same name in BOILERPLATE_DIR
#
#   DOES override directory files. Does not change or delete any documents
#		whose file names are not in boilerplate.
#		
#	USAGE: ./override-tree-files.sh path/to/target-directory 
#
#	NOTE: target directory path is relative to the directory from
#			where the script is run.
#	
#	eg. script location: /home/blue/webace/library/scripts
#		target location: /home/blue/webace/library
#		path to target: ../
#
#	UPDATE: changed order of inputs: entering just target path will
#			execute well.
#
########################################################################

########################################################################
#    copy-boilerplate.sh
#
#	Overrides existing files in directory with
#		files of the same name in BOILERPLATE_DIR
#
#   DOES override directory files. Does not change or delete any documents
#		whose file names are not in boilerplate. Creates backup .bak of 
#		overridden file.
#		
#	# Usage: ./copy_boilerplate.sh [TARGET_DIR] [INPUT_FILE] [BOILERPLATE_DIR] [--dry-run] [--backup] [--log] [--confirm]
#
#	NOTE: target directory path is relative to the directory from
#			where the script is run.
#	
#
########################################################################



