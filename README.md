# Allan's Umbrel community app store

Add in umbrelOS: App Store → ⋯ → Community App Stores → `https://github.com/allanltdpaperclip/umbrel-apps`.

| App | Port | What |
|---|---|---|
| allan-tdarr | 8265 | Tdarr server with internal node: encodes on the Pi (CPU, libx265, capped at 2 cores) |
| allan-cleanuparr | 11011 | Cleanuparr: removes stalled/slow/failed downloads |
| allan-transmission-vpn | 9093 | Transmission behind Gluetun + PIA (port forwarding) |

Images are digest-pinned. Media lives in Umbrel's Downloads folder (`/downloads` inside the apps).

## Jellyfin plugin mirror
`jellyfin/manifest.json` is a copy of the IAmParadox27 plugin index (Home Screen Sections, File Transformation, Plugin Pages) for Jellyfin 12.x. The Pi's Jellyfin cannot fetch the original from iamparadox.dev (the request hangs). Downloads still point to the official GitHub releases with their checksums. Refresh it from https://www.iamparadox.dev/jellyfin/plugins/manifest.json when new versions ship.
