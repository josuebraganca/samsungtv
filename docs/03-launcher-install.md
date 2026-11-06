# 3. Install the launcher

Using [Arn0](https://github.com/NelsonEU/arn0-tv) (MIT), forked and
customized in [`launcher/arn0/`](../launcher/arn0/) — see
[`launcher/README.md`](../launcher/README.md) for exactly what was changed.

**Honest risk note:** Arn0's own docs say it's "tested on one TV" — a 2022
Q70B on Tizen 6.5. Yours is a 2024 Frame on Tizen 9.0, a different
architecture generation. The install itself (this doc) is low-risk —
it's an ordinary sideloaded app, reversible by uninstalling, and the
project's own docs describe this half as transferring "to any Tizen TV with
modest effort." If it doesn't run cleanly on your firmware, fall back to
AeroTizen instead — see the note at the bottom.

**Not attempted: Home-button takeover.** Arn0 has a "Part 2" that reroutes
the physical Home button, but it needs a custom native runner the project
doesn't ship — explicitly "source for review, not a ready-to-run procedure"
per their own docs. Skipping it. You'll open the launcher manually from the
app list, or use the `Autorun Last App` toggle from
[`02-ad-telemetry-checklist.md`](02-ad-telemetry-checklist.md) so the TV
reopens it automatically after you've used it once.

## Already built for you

A ready-to-install package is attached separately:
`launcher/arn0/dist/arn0-launcher.wgt` (not committed to git — gitignored by
the upstream project's own `.gitignore`, sent to you directly instead).
You don't need Node.js installed to use it — only to rebuild it after
further edits.

## Install steps

1. **Developer Mode on the TV**: `Apps` → type `12345` (or `Apps → App
   Settings` on newer firmware) → Developer mode **On** → set **Host PC IP**
   to your computer's IP (check all four octets) → unplug the TV 60 seconds,
   power back on.

2. **Install [Apps2Samsung](https://github.com/Apps2Samsung/Apps2Samsung)**
   on your computer (handles device detection and Samsung certificate
   signing — simpler than Tizen Studio for a one-off sideload).

3. In Apps2Samsung: connect to your TV's IP, choose **Custom WGT File**,
   point it at `arn0-launcher.wgt`, install.

4. Open it from the TV's app list.

## Checkpoint — screenshot
Photograph the TV showing the launcher's Home screen (not a desktop
preview — the actual panel). Send it over before anything else. I want to
see: the forest wallpaper, the clock, and whichever of your 8 apps actually
matched installed apps on your TV.

## If an app tile is missing
The dock matches apps by name, so an app that's store-installed under a
slightly different internal name might not match. Open **All apps** in the
launcher, find it, note the id shown at the bottom of the screen, then edit
`launcher/arn0/src/js/config.js` — swap that entry's `match: '...'` for
`id: '<that exact id>'` — and rebuild (`npm run build`) and reinstall.

## Checkpoint — screenshot
Full dock with all 8 apps resolved. If any didn't resolve after the fix
above, send a screenshot of **All apps** too so I can see the actual
installed app names/ids.

## Fallback: AeroTizen
If Arn0 fails to install, crashes, or behaves badly on your firmware,
[AeroTizen](https://github.com/helalaou/AeroTizen) is the safer alternative
— it's confirmed working on your exact 2024 Frame LS03D model. Trade-off:
no custom photo background (bundled presets only — Snowfall, Lava), so
you'd rely on native Art Mode (see
[`04-art-mode-wallpapers.md`](04-art-mode-wallpapers.md)) for the nature
photos instead of having them behind the dock. Tell me and I'll write the
AeroTizen install steps if you need them.
