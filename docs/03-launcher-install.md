# 3. Install the AeroTizen home screen + dock

[AeroTizen](https://github.com/helalaou/AeroTizen) (MIT license) is a
sideloaded Tizen home-screen app. It's been tested on your exact TV family —
the 2024 Frame LS03D — so this is the best-fit launcher, not a generic Android
TV tool misapplied to Tizen.

Two modes:
- **Watcher** (default, safer): reopens AeroTizen when you press Home from
  Samsung Home or Netflix. Doesn't intercept Home from every app (YouTube,
  Prime, HbbTV apps still go to Samsung Home on Home-press from inside them).
  No TV-side state is changed beyond installing the app.
- **Native Home** (opt-in, labeled experimental by the project): rewrites
  which app Home/power-on actually launches, TV-wide. Confirmed working on a
  2024 Frame LS03D by the project's own compatibility testing. Fully backed
  up/restorable via the CLI (that's what `scripts/install.sh` and
  `scripts/restore.sh` wrap).

**Start with Watcher mode, live with it a few days, then decide if you want
Native Home.** Don't jump straight to Native Home.

## One-time setup on your computer

1. Download the prebuilt CLI from [AeroTizen's Releases page](https://github.com/helalaou/AeroTizen/releases)
   (Linux x64 / Windows x64 / macOS) — it bundles Python, nothing else to install.
   Or, if you already have Python 3.10+: `pip install git+https://github.com/helalaou/AeroTizen`
2. Run [`scripts/install.sh`](../scripts/install.sh) — it walks you through every
   step below with pauses at the TV-side actions.

## What the script does, in order (all real `aerotizen` CLI commands)

```
./aerotizen discover
```
Finds the TV on your network.

**On the TV**: Open **Apps**, type `12345` (remote or on-screen pad — on some
newer firmware this is under **Apps → App Settings** instead), switch
**Developer mode** on, set **Host PC IP** to your computer's IP (check all
four octets before OK). Then unplug the TV for a minute and power back on.

```
./aerotizen status
```
Confirms `developerMode=1`.

```
./aerotizen certs
```
One-time Samsung sign-in in your browser, to sign the app for your TV.

```
./aerotizen install launcher
```
Downloads the latest stable launcher, checks its checksum, signs it, installs it.

## Checkpoint — screenshot
Once installed, open AeroTizen from the app list and screenshot the Home tab.
Send it before adding your dock apps.

## Adding your dock apps
Hold **OK** on a tile → **Add to Home** (or **Move** / **Remove from Home**).
Add these in order — screenshot the dock after each 2-3 so I can check it's
building up correctly:

1. Netflix
2. YouTube
3. YouTube TV
4. Prime Video
5. Disney+
6. Hulu
7. Max (HBO Max was renamed "Max" on some Tizen store listings — search both
   names if you don't see it)
8. Paramount+

If any aren't preinstalled on your TV, install them from the Samsung app
store first (`Home > Apps > search`), then add to the dock.

In `Settings → Appearance` within the launcher you can set 3, 4, or 5 apps
per row — screenshot that menu so I can see your choice.

## Checkpoint — screenshot
Full dock with all 8 apps, plus the Settings → Appearance screen.

## Optional: Native Home (only after you're happy with Watcher mode)
```
./aerotizen --tv <TV_IP> home status
./aerotizen --tv <TV_IP> home backup      # writes ~/.config/aerotizen/backups/<TV>/original-home.json — keep this
# open AeroTizen on the TV once, to start its control service
./aerotizen --tv <TV_IP> home apply --yes
```
Then power-cycle the TV (unplug 60s) and test Home from YouTube, Prime Video,
and Samsung Home itself. If Home ever stops behaving, run
[`scripts/restore.sh`](../scripts/restore.sh) immediately — don't troubleshoot
further with Native Home active.

Known project caveats, verbatim: "Native Home is experimental," some models
(e.g. U8092F) fail apply outright, and restore-after-uninstall is "still
awaiting a controlled physical test" — so always restore *before*
uninstalling, never after.
