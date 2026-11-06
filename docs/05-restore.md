# 5. Full restore

Everything here reverses independently — you don't have to undo all of it.

| What you changed | How to undo |
|---|---|
| Ad/ACR/voice toggles (step 2) | Flip each toggle back using your step-2 screenshots as reference |
| TV's manual DNS entry (step 2) | `IP Settings > DNS Setting` → **Obtain automatically** |
| Pi-hole/AdGuard Home blocklist (step 2b) | Remove the `samsung-ads.txt` adlist entry, re-run Gravity (Pi-hole) |
| Deleted/disabled Home apps (step 2) | Reinstall from Samsung app store; Samsung TV Plus: Home → highlight it → Down → **Enable** |
| AeroTizen launcher, Watcher mode (step 3) | `./aerotizen uninstall launcher` |
| AeroTizen Native Home (step 3, optional) | Run [`scripts/restore.sh`](../scripts/restore.sh) **before** uninstalling — see below |
| Art Mode photos (step 4) | Delete photos in SmartThings, or toggle Art Mode off |

## Native Home restore — order matters

If you enabled Native Home, restore it **before** uninstalling the launcher.
The project's own docs are explicit about this: uninstalling while Home still
points at AeroTizen leaves the TV in a broken state, and "restore after
uninstall is still awaiting a controlled physical test."

```
./scripts/restore.sh
```

This runs, in order:
```
./aerotizen --tv <TV_IP> home restore --yes
```
(reverts Home/startup bindings to whatever `home backup` saved — not generic
Samsung defaults, *your* actual original values)
then, only if you want the app gone entirely:
```
./aerotizen uninstall launcher
```

Power-cycle the TV (unplug 60s) after `home restore`, then confirm Home
behaves normally before uninstalling.

## If something goes wrong mid-way
Don't improvise fixes. Stop, run `./aerotizen --tv <TV_IP> home status`,
screenshot the output, and send it to me along with what you were doing when
it went wrong. The backup folder (`~/.config/aerotizen/backups/`) is your
real safety net — as long as it's intact, this is recoverable.

## Full teardown checklist
- [ ] `aerotizen home restore --yes` (if Native Home was ever applied)
- [ ] `aerotizen uninstall launcher`
- [ ] All step-2 toggles flipped back
- [ ] DNS set back to automatic (TV and/or Pi-hole)
- [ ] Art Mode photos removed / Art Mode off
- [ ] Developer Mode turned back off on the TV (`Apps`, `12345`, toggle off) — not required, but tidy
