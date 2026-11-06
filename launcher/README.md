# launcher/arn0

A vendored fork of [NelsonEU/arn0-tv](https://github.com/NelsonEU/arn0-tv) (MIT
license, `launcher/arn0/LICENSE`), customized for this TV:

- `src/js/config.js` — dock set to your 8 apps (Netflix, YouTube, YouTube TV,
  Hulu, Disney+, Paramount+, Max, Prime Video), matched by name so exact Tizen
  app IDs aren't needed. `inputs` left empty — add your own HDMI devices if
  you want that row.
- `src/js/brands.js` — added brand tiles for YouTube TV, Hulu, and Paramount+
  (the upstream project didn't have these three).
- `src/index.html` + `src/js/settings.js` — "Consoles" renamed to "Inputs"
  throughout the UI.
- `src/js/config.js` theme — starting wallpaper set to `forest` (static, not
  rotating), one of 10 real nature photos already bundled by upstream
  (Unsplash License, credited in `src/js/wallpapers.js`). Changeable anytime
  from the launcher's own Settings → Background on the TV.

**Only the "Part 1" install is covered here** — the launcher as an ordinary
sideloaded app, reversible by uninstalling. Upstream's "Part 2" (rebinding
the physical Home button) requires a custom native helper whose execution
runner the upstream repo explicitly does not ship — their own docs call it
"source for review rather than a ready-to-run procedure" and say a hosted
session can't do it. Not attempted here. See
[`../docs/03-launcher-install.md`](../docs/03-launcher-install.md).

To rebuild after further edits: `cd launcher/arn0 && npm run build` →
`dist/arn0-launcher.wgt` (gitignored, not committed — rebuild locally or use
the one sent to you directly).
