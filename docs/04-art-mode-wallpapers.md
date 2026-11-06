# 4. Rotating nature wallpapers

AeroTizen's background system is bundled presets only (Snowfall, Lava,
weather scenes) — confirmed from its own docs, no custom image or folder
support, no remote URL loading. Don't fight that.

Use the Frame's **native Art Mode** instead — it's the actual headline
feature of this TV, built exactly for this, fully supported, and trivially
reversible (delete photos or turn Art Mode off).

## Setup
1. Install the **SmartThings** app on your phone, pair it to this TV if not already.
2. In SmartThings → your TV → **Art Mode** → **My Photos**.
3. Upload a nature photo folder (SmartThings resizes/crops for the panel automatically).
4. Set the slideshow: **Settings (within Art Mode) → Photo change interval** —
   choose rotation timing (e.g. every few minutes, hourly, daily).
5. Set **Art Mode** to activate automatically when the TV is idle/off:
   `Settings > General & Privacy > Power and Energy Saving > Art Mode` (or
   motion-sensor-triggered, if your Frame has the sensor option).

This runs independently of AeroTizen — idle/off shows rotating Art Mode
photos, pressing Home or a source button takes you straight to your
AeroTizen dock.

## Reversing
Delete the uploaded photos in SmartThings, or just turn **Art Mode** off in
the same settings menu. Nothing else is touched.

## Checkpoint — screenshot
Once a couple of photos are uploaded and rotating, photograph the TV in Art
Mode (just snap it with your phone — this isn't an ADB screenshot, it's the
physical display) so I can confirm it's cycling.
