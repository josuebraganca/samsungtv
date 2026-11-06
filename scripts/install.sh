#!/usr/bin/env bash
# FALLBACK ONLY. The primary launcher (Arn0, see docs/03-launcher-install.md)
# installs via Developer Mode + Apps2Samsung's GUI — there's no CLI to script.
# This wraps AeroTizen instead, for if Arn0 fails to install/run on your TV.
# Run this on your own computer, on the same Wi-Fi as the TV.
# This is NOT one-shot: it pauses at every step that needs the remote in your hand.
#
# Requires: the `aerotizen` CLI on your PATH (download from
# https://github.com/helalaou/AeroTizen/releases, or `pip install git+https://github.com/helalaou/AeroTizen`).
#
# See docs/03-launcher-install.md for what each command actually does.

set -euo pipefail

pause() {
  echo
  echo "=== $1 ==="
  read -rp "Press Enter once done... "
}

if ! command -v aerotizen >/dev/null 2>&1; then
  echo "aerotizen CLI not found on PATH." >&2
  echo "Install it first: https://github.com/helalaou/AeroTizen/releases" >&2
  exit 1
fi

echo "Finding your TV on the network..."
aerotizen discover

pause "On the TV: Apps > type 12345 (or Apps > App Settings on newer firmware) > Developer mode ON > Host PC IP = this computer's IP (check all four octets) > then unplug the TV for 60 seconds and power it back on"

echo "Checking developer mode status..."
aerotizen status

pause "Confirm the status above shows developerMode=1. If not, redo the previous step before continuing"

echo "Signing in for TV certificates (opens your browser, one-time)..."
aerotizen certs

echo "Installing the launcher..."
aerotizen install launcher

echo
echo "Done. Open AeroTizen from the TV's app list, then:"
echo "  1. Screenshot the Home tab and send it over"
echo "  2. Add your dock apps (hold OK on a tile > Add to Home) per docs/03-launcher-install.md"
echo "  3. Screenshot the finished dock"
echo
echo "Native Home (optional, do this later, separately) is NOT run by this script."
echo "See docs/03-launcher-install.md's 'Optional: Native Home' section when you're ready."
