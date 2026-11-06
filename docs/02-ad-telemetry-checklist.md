# 2. Ads, ACR and telemetry: reversible menu toggles

No tools needed, just the remote. Labels below are from a 2024 Tizen 9.0 set
(AeroTizen's own verified settings guide) — yours should match closely since
it's the same generation; if a label's missing, it moved under a slightly
different submenu, search Settings for the bolded term.

Every toggle here reverses by flipping it back — screenshot each screen first
per [`01-backup.md`](01-backup.md).

## Boot past the ad-filled Home screen
`Settings > All Settings > General & Privacy > Start Screen Option`
- **Start with Smart Hub Home**: Off — wakes to your last input instead of the ad-laden Home row.
- **Autorun Last App**: your call — On reopens whatever you were watching.
- **Autorun Samsung TV Plus**: Off, if listed.

## Stop personalized "Top Picks" and targeted ads
`Settings > All Settings > General & Privacy > Terms & Privacy > Privacy Choices`
(older firmware: `Settings > Support > Terms & Privacy`)
- **Viewing Information Services**: Off — this is ACR, Samsung fingerprinting what's on screen to target ads.
- **Interest-Based Advertisements**: Off.
- **Voice Recognition Services**: Off, unless you actually use voice search.
- Anything named **Personalized Content**, **Customization Service**, or **Recommendations**: Off.

## Hide Samsung TV Plus
Highlight **Samsung TV Plus** on Home → press **Down** (or hold **OK**) → **Disable**.
Can't be uninstalled (no shell), but Disable removes the icon and its channel guide.

## Clean up the Home row
On Home's app/suggestion row: scroll to the end → **Edit List** → select an app → **Down** → **Remove**.

## Delete store apps you'll never use
`Home > Apps > Settings (gear, top right) > select app > Delete` — works for
most preinstalled/store apps on Tizen 6+. **Don't delete anything you listed
as a dock app** (YouTube, YouTube TV, Hulu, Disney+, Paramount+, HBO Max/Max,
Prime Video, Netflix) — check what's actually there before deleting.

## DNS-level ad blocking (TV-only, no router needed)
`Settings > All Settings > Connection > Network > Network Status > IP Settings`
- **DNS Setting**: Enter manually
- **DNS Server**: `94.140.14.14` (AdGuard public DNS — free, no account, verified to keep YouTube/Netflix/Samsung app store working while blocking `samsungads.com`/`samsungacr.com`)

To undo: set **DNS Setting** back to **Obtain automatically**.

For blocking at the router instead (covers every device, not just the TV),
see [`../pihole/README.md`](../pihole/README.md) — same list, applied once for your whole network.

## Checkpoint
Screenshot each screen before and after. Send both sets — I'll confirm nothing's
broken (specifically: open Netflix and the Samsung app store afterward and
confirm they still load) before you move to the launcher install.
