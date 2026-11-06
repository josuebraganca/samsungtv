# 5. Full restore

Everything here reverses independently — you don't have to undo all of it.

| What you changed | How to undo |
|---|---|
| Ad/ACR/voice toggles (step 2) | Flip each toggle back using your step-2 screenshots as reference |
| TV's manual DNS entry (step 2) | `IP Settings > DNS Setting` → **Obtain automatically** |
| Pi-hole/AdGuard Home blocklist (step 2b) | Remove the `samsung-ads.txt` adlist entry, re-run Gravity (Pi-hole) |
| Deleted/disabled Home apps (step 2) | Reinstall from Samsung app store; Samsung TV Plus: Home → highlight it → Down → **Enable** |
| Arn0 launcher (step 3) | Uninstall from the TV's own app list, or via Apps2Samsung. That's it — no Home-button rerouting was done, so there's nothing else to revert |
| `Autorun Last App`, if you enabled it as the auto-open workaround | `Start Screen Option` → **Autorun Last App** → Off |

## Why this is simpler than it could've been
We deliberately skipped Arn0's "Home button takeover" feature (see
[`03-launcher-install.md`](03-launcher-install.md)) — it needs a custom
native runner the project doesn't ship and that we judged too risky to
improvise. That means nothing on the TV's actual Home/startup behavior was
ever touched. Uninstalling the app is the entire restore.

## Full teardown checklist
- [ ] Uninstall the launcher app (TV app list, or Apps2Samsung)
- [ ] All step-2 toggles flipped back
- [ ] DNS set back to automatic (TV and/or Pi-hole)
- [ ] `Autorun Last App` turned back off, if you'd set it
- [ ] Art Mode photos removed / Art Mode off, if you set that up too
- [ ] Developer Mode turned back off on the TV (`Apps`, `12345`, toggle off) — not required, but tidy
