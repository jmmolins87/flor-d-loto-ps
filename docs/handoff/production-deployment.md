# Production Deployment

## FTP

- Host: `ftpupload.net`
- User: `if0_41663171`
- Port: `21`

The FTP password is intentionally not stored in this repository.

## Required MySQL Data

PrestaShop cannot run in production until these values are created in vPanel and provided:

- Database name
- Database user
- Database password
- Database host

## Upload Policy

Upload the prepared PrestaShop files after local verification. Do not upload local cache folders, local logs, local database dumps, or development-only `.env` files.

Do not start the actual FTP upload yet if the production MySQL values listed above are still missing. This handoff stops before any live upload until those values exist.

## Recommended FTP Exclusions

Do not upload these local-only paths:

- `.git/`
- `.superpowers/`
- `prestashop_8.2.1.zip`
- `prestashop.zip`
- `var/cache/*`
- `cache/smarty/cache/*`
- `cache/smarty/compile/*`
- local database dumps ending in `.sql`

## Production Install Sequence

1. Create MySQL database in vPanel.
2. Upload files by FTP to the hosting web root.
3. Open the production domain in browser.
4. Complete PrestaShop install with production MySQL values.
5. Remove or rename `install/` after installation.
6. Log into Back Office and activate the `Flor de Loto` theme.
7. Replace temporary admin password.
