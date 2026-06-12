# Production Deployment

## Local Verification Status

Local verification is **complete**. All front-office flows (homepage desktop/mobile, category page, product page, add-to-cart, cart page) and Back Office login were verified against the running local instance at `http://localhost:8080/`. The Back Office catalog pages (Products, Categories) were confirmed reachable (login page renders, routes redirect to auth) but could not be interactively tested without browser automation.

**This local verification does NOT mean production is ready.** Production upload still requires MySQL database credentials that have not yet been created in vPanel.

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

**Production readiness is blocked until these MySQL values exist.** The local install works because it uses a local database; production will fail without a live database.

## Upload Policy

Upload only the PrestaShop runtime and application files that belong in the production web root. Do not upload repository-internal documentation, helper scripts, local cache folders, local logs, local database dumps, or development-only `.env` files.

Do not start the actual FTP upload yet. Upload is blocked until both of these are true:

- the production MySQL values listed above have been created and provided
- a completed, verified local PrestaShop install exists (DONE — local verification complete)

## Recommended FTP Exclusions

Do not upload these local-only paths:

- `.git/`
- `.superpowers/`
- `docs/`
- `scripts/`
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
