# Flor D Loto PS Design

## Goal

Build a new PrestaShop project named `flor-d-loto-ps` for a flower shop called Flor de Loto. The project must be visually polished, use assets from `/Users/juanmamolinncortes/Documentos/ng-flor-loto`, and be editable by a non-technical client from the PrestaShop Back Office.

## Approved Approach

Use a clean PrestaShop installation with a custom warm editorial theme.

This approach gives the client a real ecommerce CMS while keeping the implementation compatible with standard FTP hosting. The client will edit products, categories, prices, images, stock, orders, and CMS pages from Back Office without touching code.

## Visual Direction

Selected style: editorial warm.

The shop should feel elegant, handmade, local, and premium without becoming dark or heavy. The visual system will use cream backgrounds, warm neutral surfaces, terracotta accents, soft green details, large product photography, refined spacing, and a calm editorial hierarchy.

## Content Structure

The store will include these main catalogue areas:

- Ramos
- Rosas
- Orquideas
- Plantas
- Bodas
- Funerales

The homepage will include:

- Header with logo, navigation, search, account, cart, and mobile menu
- Hero section with editable promotional copy and image
- Featured categories
- Featured products
- Services section for delivery, floral advice, and custom arrangements
- Customer opinions or trust block
- Contact/WhatsApp call to action
- Footer with links, contact data, social links, and legal links

## CMS Editing Model

The client edits standard ecommerce content through PrestaShop Back Office:

- Products: name, price, description, images, stock, categories
- Categories: names, descriptions, cover images
- Orders and customers
- CMS pages: legal notice, privacy policy, terms, delivery information
- Homepage modules: banner/slider/custom text/featured products where possible through standard PrestaShop modules

The theme should avoid hardcoding day-to-day business content unless no standard Back Office editing path exists.

## Assets

Source assets are in `/Users/juanmamolinncortes/Documentos/ng-flor-loto/src/assets`.

Important asset groups:

- Logos: `logo-loto.png`, `logo-new-loto.jpg`, `logo-loto-horizontal.png`
- Product photos: bouquet, roses, orchids, plants, events, funerals
- Service icons: plant, delivery, advice
- Social/contact icons: WhatsApp, Instagram, Facebook, Bodas.net, Glovo, Flowwow, Just Eat
- Opinion avatars

The PrestaShop theme will copy only the assets needed for the final theme and seed catalogue.

## Back Office Access

The project must provide Back Office credentials after local installation.

Credential policy:

- Generate a temporary admin user for setup.
- Do not commit passwords to files.
- Share credentials only in the final handoff message or separate secure channel.
- The client should change the password after first login.

## Production Deployment

Deployment target uses FTP:

- FTP host: `ftpupload.net`
- FTP user: `if0_41663171`
- FTP port: `21`

The FTP password is known in the conversation but must not be written into repository files.

PrestaShop also requires a MySQL database in production. The database details are not known yet and must be obtained from vPanel before final installation:

- Database name
- Database user
- Database password
- Database host

## Technical Design

Project root: `/Users/juanmamolinncortes/Documentos/flor-d-loto-ps`.

Implementation will install or stage PrestaShop in this folder, then create a custom theme, likely named `flordeloto`, with standard PrestaShop template structure.

The theme should use:

- Responsive layout for desktop and mobile
- Standard PrestaShop hooks where practical
- Theme CSS and JS kept small and focused
- No dependency on Angular runtime
- No custom admin system outside PrestaShop

## Seed Content

Initial content should be created from available assets so the shop looks complete on first review.

Seed products should cover:

- Several bouquets
- Rose packs
- Orchids
- Plants
- Wedding/event examples
- Funeral arrangements

Prices and descriptions will be initial sample business content based on the available product photos, and the client can replace them later from Back Office.

## Risks And Constraints

The production hosting may have constraints around PHP version, memory limits, upload limits, and database access. These must be checked before uploading.

FTP credentials alone are not enough to complete a working production installation. MySQL details are required.

PrestaShop passwords and configuration files must not be committed with real production secrets.

## Verification Requirements

Before handoff:

- Local front office loads without template errors
- Back Office login works
- Products and categories are editable from Back Office
- Homepage displays theme assets correctly
- Mobile header/menu works
- Cart and product pages load
- Theme CSS is loaded from the custom theme
- No production credentials are stored in tracked files
