# 1. Back up before changing anything

Nothing here can brick the TV outright — there's no root, no system-partition
writes, no firmware flashing. But cover yourself anyway:

## Settings state (for the manual toggles in step 2)

Before you touch any menu, screenshot or photograph each screen you're about
to change, in this order. Send them to me — I'll confirm each one before and
after.

1. `Settings > All Settings > General & Privacy > Start Screen Option`
2. `Settings > All Settings > General & Privacy > Terms & Privacy > Privacy Choices`
   (on older firmware: `Settings > Support > Terms & Privacy`)
3. `Settings > All Settings > Connection > Network > Network Status > IP Settings`
   (your current DNS setting — almost certainly "Obtain automatically" right now)

That's your restore reference for step 2 — the "restore" there is just setting
each toggle back to what you photographed.

## Installed apps / Home layout

Take one screenshot of your current Home screen (app order, what's pinned)
before you install anything. If you ever want to go back to stock Home with
nothing changed, this is what you're restoring to.

## AeroTizen's own backup (automatic)

The launcher install script in step 4 runs `aerotizen home backup` before it
changes anything. This writes the TV's actual Home/startup-app bindings to:

```
~/.config/aerotizen/backups/<TV identity>/original-home.json
```

**Keep that whole folder** (including the `transactions/` subfolder it creates
later) — don't delete it, don't edit it by hand. It's what `scripts/restore.sh`
reads to put things back exactly as they were. Copy it somewhere safe (a
second drive, cloud backup) once it exists; if your computer dies, you lose
your fastest path back to stock.

## Checkpoint

Send me:
- [ ] Screenshots of the 3 settings screens above
- [ ] Screenshot of current Home screen
- [ ] Confirmation that `~/.config/aerotizen/backups/` exists and has a file in it (after step 4's backup command runs — you'll do this one later, just know to check it)

Once I've seen the first two, move to [`02-ad-telemetry-checklist.md`](02-ad-telemetry-checklist.md).
