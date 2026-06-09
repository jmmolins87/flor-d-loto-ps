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
