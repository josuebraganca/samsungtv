# Frame TV debloat + Apple-TV-style home screen

For a **2024 Samsung Frame (model `QN50LS03DAFXZA`, LS03D line, Tizen ~9.0)**.

## Reality check first

This TV cannot be debloated the way an Android TV box can. Retail Tizen firmware
has no ADB/root shell — Developer Mode only lets you install and debug your own
sideloaded apps, not disable or inspect Samsung's system packages. So:

- **No `pm disable-user`, no uninstalling Samsung system apps.** That's not
  possible on stock firmware. Rooting exists for a few old models but is
  risky, not reversible the way you asked for, and not covered here.
- What *is* real and reversible: Samsung's own privacy toggles (menu-based),
  DNS/router-level ad blocking, and a sideloaded custom launcher
  ([Arn0](https://github.com/NelsonEU/arn0-tv), forked in `launcher/arn0/`)
  that gives you a clock + app dock + nature-photo background, reversible by
  uninstalling. Its "Home button takeover" feature was deliberately skipped —
  it needs a native runner the project doesn't ship, so nothing on the TV's
  actual Home/startup behavior is touched; you open the launcher from the app
  list instead.
- Arn0's own docs say it's confirmed on only one TV (a 2022 Q70B, different
  Tizen version from yours) — the install itself is low-risk since it's just
  an app, but if it misbehaves on your firmware,
  [AeroTizen](https://github.com/helalaou/AeroTizen) (confirmed on your exact
  2024 Frame LS03D) is the documented fallback, trading the custom photo
  background for guaranteed compatibility.

Everything here runs from **your own computer**, on the same Wi-Fi as the TV.
I can't reach your TV or take screenshots from it myself — this cloud session
has no path to your home network. Run each step yourself and send me
screenshots at the checkpoints marked below; I'll check them.

## Order of operations

1. [`docs/01-backup.md`](docs/01-backup.md) — what to back up and how, before touching anything
2. [`docs/02-ad-telemetry-checklist.md`](docs/02-ad-telemetry-checklist.md) — reversible menu toggles for ads/ACR/voice data
3. [`pihole/README.md`](pihole/README.md) — optional DNS-level ad/telemetry blocking
4. [`docs/03-launcher-install.md`](docs/03-launcher-install.md) — sideload the launcher (dock apps and wallpaper already configured)
5. [`docs/04-art-mode-wallpapers.md`](docs/04-art-mode-wallpapers.md) — changing/adding wallpapers
6. [`docs/05-restore.md`](docs/05-restore.md) — full restore, step by step

Scripts live in `scripts/` and wrap the real `aerotizen` CLI — they're guided
(they pause for the manual TV-side steps, like entering your PC's IP in
Developer Mode) rather than one-shot, because several steps can only be done
with the remote in your hand.
