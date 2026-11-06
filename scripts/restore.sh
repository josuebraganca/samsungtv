#!/usr/bin/env bash
# Restore script: reverts AeroTizen Native Home (if it was ever applied) and
# optionally uninstalls the launcher. Order matters — restore BEFORE uninstall.
# Run this on your own computer, on the same Wi-Fi as the TV.
#
# Usage: ./scripts/restore.sh <TV_IP> [--uninstall]
#   <TV_IP>       required — your TV's IP address (same one from `aerotizen discover`)
#   --uninstall   optional — also removes the launcher app after restoring Home

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <TV_IP> [--uninstall]" >&2
  exit 1
fi

TV_IP="$1"
DO_UNINSTALL=false
if [ "${2:-}" = "--uninstall" ]; then
  DO_UNINSTALL=true
fi

if ! command -v aerotizen >/dev/null 2>&1; then
  echo "aerotizen CLI not found on PATH." >&2
  exit 1
fi

BACKUP_DIR="$HOME/.config/aerotizen/backups"
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Warning: no backup directory found at $BACKUP_DIR" >&2
  echo "If you never ran 'aerotizen home backup' or 'scripts/install.sh', there may be nothing to restore from." >&2
  read -rp "Continue anyway? [y/N] " ans
  [ "$ans" = "y" ] || exit 1
fi

echo "Checking current Home status..."
aerotizen --tv "$TV_IP" home status

echo
read -rp "Restore Home/startup bindings to their original values now? [y/N] " ans
if [ "$ans" != "y" ]; then
  echo "Aborted — nothing changed."
  exit 0
fi

aerotizen --tv "$TV_IP" home restore --yes

echo
echo "Restore command sent. Now:"
echo "  1. Unplug the TV (or One Connect box) for 60 seconds, then power back on"
echo "  2. Confirm Home behaves normally from Samsung Home, YouTube, and Prime Video"
echo

if [ "$DO_UNINSTALL" = true ]; then
  read -rp "Home confirmed working normally? Only answer yes if you actually tested it. [y/N] " confirmed
  if [ "$confirmed" = "y" ]; then
    echo "Uninstalling launcher..."
    aerotizen uninstall launcher
    echo "Done."
  else
    echo "Skipping uninstall — confirm Home works first, then re-run with --uninstall."
  fi
else
  echo "Launcher left installed (no --uninstall passed). Re-run with --uninstall once you've confirmed Home works, if you want it fully removed."
fi
