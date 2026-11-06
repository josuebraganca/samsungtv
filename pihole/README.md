# Router/DNS-level ad blocking (optional, covers your whole network)

[`samsung-ads.txt`](samsung-ads.txt) is a curated list of Samsung ad and ACR
(automatic content recognition / viewing-tracking) domains, pulled from the
AeroTizen project. It's deliberately conservative — trimmed to avoid breaking
the Samsung app store, app logins, firmware updates or casting. It does
**not** touch Netflix/YouTube/etc. domains.

This is optional and separate from the TV's own DNS field in step 2 — use
this if you run Pi-hole/AdGuard Home and want the blocking to apply to every
device on your network, not just the TV.

## Pi-hole
`Settings > Blocklists` (older UI: `Group Management > Adlists`) → Add:
```
https://raw.githubusercontent.com/helalaou/AeroTizen/main/dns/samsung-ads.txt
```
or point it at the copy in this repo if you'd rather pin a known-good version.
Then **Tools > Update Gravity**.

## AdGuard Home
`Filters > DNS blocklists` → **Add blocklist** → paste the same raw URL above
→ Save.

## Reversing it
Remove the list entry (Pi-hole: delete the adlist and re-run Gravity; AdGuard
Home: remove the blocklist) — no other changes to undo.

## If something breaks
One community report said the *full, unfiltered* upstream lists broke Samsung
TV Plus and some Samsung apps. This trimmed list is scoped to avoid that, but
if anything stops loading: open the TV's network settings, confirm DNS is
still what you expect, and pull the list. Tell me what broke and I'll narrow
the list further.
