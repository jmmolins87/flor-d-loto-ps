# Back Office Handoff

## Editable Areas

These are the areas the client should use for normal catalog and content updates. No code changes are needed for day-to-day management.

- **Products**: `Catalog > Products` — add, edit, remove products; update prices, descriptions, images, stock, and categories.
- **Categories**: `Catalog > Categories` — add, edit, reorder, or disable storefront categories.
- **Orders**: `Orders > Orders` — view and manage customer orders.
- **Customers**: `Customers > Customers` — view customer accounts.
- **CMS Pages**: `Design > Pages` — edit legal texts, about page, terms, and other static content.
- **Theme & Logo**: `Design > Theme & Logo` — replace the shop logo.
- **Homepage Modules**: `Modules > Module Manager` — configure homepage slider, featured products, custom text blocks.

## Content Editing Rules

- Edit products and categories from Back Office only — never edit catalog data in code or SQL for normal updates.
- Replace sample prices and descriptions from `Catalog > Products`.
- Replace legal texts from `Design > Pages`.
- Change the temporary admin password immediately after first production login.
- Category IDs are referenced by hardcoded links in `index.tpl`, `header.tpl`, and `footer.tpl`. If you add or remove categories that appear in the main navigation or homepage, those template files must be updated by a developer.

## Temporary Admin

The temporary admin email is `admin@flordeloto.local` unless changed during installation. The password is not stored in this repository. The admin directory is randomized (`admin090jfa2wqne3d487ic9`) — the full admin URL is provided during installation.
