# 4. Nature wallpaper

Mostly already done — the launcher itself has a real photo (`forest`, one of
10 bundled Unsplash-licensed nature shots) set as its static background,
directly behind the dock. No Art Mode dependency needed for this anymore.

## Changing the photo
On the TV, open the launcher → **Settings → Background** → pick from the 10
bundled photos (coast, valley-snow, forest, aurora, night-sky, earth,
milky-way, kyoto, hills, waterfall) or **Off** for a plain gradient. The TV
remembers your choice.

## Using your own photos instead of the bundled 10
Requires rebuilding the launcher from a Mac (the prep script shells out to
macOS's `sips` and Chrome.app — not portable, and not something I can run
from this cloud session):
```
node scripts/prepare-wallpapers.mjs ~/path/to/your/photos
npm run build
```
Then reinstall via Apps2Samsung per
[`03-launcher-install.md`](03-launcher-install.md). Not necessary unless you
want different photos than the bundled set.

## Optional: native Art Mode too
The Frame's own Art Mode (SmartThings → TV → Art Mode → My Photos) is still
available as a separate, TV-idle/off screen if you want something showing
even when the launcher itself isn't open. Independent of the launcher,
fully reversible (delete photos / toggle Art Mode off). Not required — the
launcher's own background already covers "nature wallpaper behind the dock,"
which was the main ask.

## Checkpoint — screenshot
Already covered by the Home screen screenshot in step 3 — no separate
checkpoint needed here unless you set up Art Mode too, in which case
photograph the TV in Art Mode.
