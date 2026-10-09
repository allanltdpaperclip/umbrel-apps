# Allan's Umbrel community app store

Add in umbrelOS: App Store → ⋯ → Community App Stores → `https://github.com/allanltdpaperclip/umbrel-apps`.

| App | Port | What |
|---|---|---|
| allan-seerrng | 5058 | SeerrNG: requests for movies, shows, music, ebooks, audiobooks |
| allan-bookshelf | 8787 | BookshelfNG: Readarr-style ebooks + audiobooks (Hardcover metadata via hosted rreading-glasses) |
| allan-audiobookrequest | 8000 | AudioBookRequest: audiobook wishlist/requests via Prowlarr |
| allan-tdarr | 8265 (node port 8266) | Tdarr server, no internal node; encoding runs on external nodes |

Images are digest-pinned. Media lives in Umbrel's Downloads folder (`/downloads` inside the apps).

## Jellyfin plugin mirror
`jellyfin/manifest.json` is a copy of the IAmParadox27 plugin index (Home Screen Sections, File Transformation, Plugin Pages) for Jellyfin 12.x. The Pi's Jellyfin cannot fetch the original from iamparadox.dev (the request hangs). Downloads still point to the official GitHub releases with their checksums. Refresh it from https://www.iamparadox.dev/jellyfin/plugins/manifest.json when new versions ship.
