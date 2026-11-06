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
  ([AeroTizen](https://github.com/helalaou/AeroTizen)) that gives you an
  app-dock home screen. AeroTizen has its own backup/restore workflow built in.
- For rotating nature wallpapers, use the Frame's **native Art Mode** +
  SmartThings "My Photos" slideshow instead of hacking the launcher's
  background system — it's a first-class supported feature of this exact TV,
  fully reversible (delete the photos / switch Art Mode off), and more
  reliable than anything a sideloaded app can do with backgrounds.

Everything here runs from **your own computer**, on the same Wi-Fi as the TV.
I can't reach your TV or take screenshots from it myself — this cloud session
has no path to your home network. Run each step yourself and send me
screenshots at the checkpoints marked below; I'll check them.

## Order of operations

1. [`docs/01-backup.md`](docs/01-backup.md) — what to back up and how, before touching anything
2. [`docs/02-ad-telemetry-checklist.md`](docs/02-ad-telemetry-checklist.md) — reversible menu toggles for ads/ACR/voice data
3. [`pihole/README.md`](pihole/README.md) — optional DNS-level ad/telemetry blocking
4. [`docs/03-launcher-install.md`](docs/03-launcher-install.md) — sideload AeroTizen, add your dock apps
5. [`docs/04-art-mode-wallpapers.md`](docs/04-art-mode-wallpapers.md) — rotating nature wallpapers via Art Mode
6. [`docs/05-restore.md`](docs/05-restore.md) — full restore, step by step

Scripts live in `scripts/` and wrap the real `aerotizen` CLI — they're guided
(they pause for the manual TV-side steps, like entering your PC's IP in
Developer Mode) rather than one-shot, because several steps can only be done
with the remote in your hand.
