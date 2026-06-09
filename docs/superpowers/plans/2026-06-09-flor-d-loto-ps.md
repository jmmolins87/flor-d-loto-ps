# Flor D Loto PS Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a new editable PrestaShop ecommerce project for Flor de Loto using the approved warm editorial visual direction and assets from `ng-flor-loto`.

**Architecture:** Install a clean PrestaShop project in `flor-d-loto-ps`, then add a custom `flordeloto` theme that relies on standard PrestaShop Back Office features for editing products, categories, CMS pages, homepage modules, orders, and customers. Keep deployment credentials out of tracked files and prepare FTP handoff separately from MySQL configuration.

**Tech Stack:** PrestaShop 8.x, PHP, MySQL/MariaDB, Smarty templates, CSS, JavaScript, FTP deployment.

---

## File Structure

Create or modify these project-owned files during implementation:

- Create: `.gitignore` to prevent committing caches, generated archives, credentials, and visual brainstorming files.
- Create: `docs/handoff/back-office.md` to document client editing workflows and credentials handoff policy.
- Create: `docs/handoff/production-deployment.md` to document FTP upload steps and missing MySQL data.
- Create: `scripts/clear-prestashop-cache.sh` to clear Symfony and Smarty caches consistently.
- Create: `scripts/copy-flor-assets.sh` to copy selected `ng-flor-loto` assets into the theme.
- Modify/Create after PrestaShop install: `themes/flordeloto/config/theme.yml` for theme metadata.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/layouts/layout-full-width.tpl` for global layout.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/_partials/head.tpl` for metadata and favicon.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/_partials/stylesheets.tpl` for CSS loading.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/_partials/javascript.tpl` for theme JS loading.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/_partials/header.tpl` for navigation.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/_partials/footer.tpl` for footer/contact.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/index.tpl` for home structure.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/catalog/listing/product-list.tpl` for catalogue grid.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/catalog/listing/search.tpl` for search results.
- Modify/Create after PrestaShop install: `themes/flordeloto/templates/catalog/product/product.tpl` for product detail.
- Modify/Create after PrestaShop install: `themes/flordeloto/assets/css/theme.css` for warm editorial styling.
- Modify/Create after PrestaShop install: `themes/flordeloto/assets/js/theme.js` for mobile menu and small UI interactions.

Generated or vendor-owned PrestaShop files must not be hand-edited unless explicitly listed above.

---

### Task 1: Repository And Secret Safety

**Files:**
- Create: `.gitignore`
- Create: `docs/handoff/production-deployment.md`

- [ ] **Step 1: Initialize git repository if missing**

Run:

```bash
git rev-parse --is-inside-work-tree || git init
```

Expected: either `true` or a message that an empty Git repository was initialized.

- [ ] **Step 2: Create `.gitignore`**

Create `.gitignore` with this exact content:

```gitignore
.DS_Store
.superpowers/
*.zip
*.tar.gz
*.sql
*.log
.env
.env.*
config/settings.inc.php
app/config/parameters.php
var/cache/
var/logs/
cache/smarty/cache/
cache/smarty/compile/
admin*/backups/
```

- [ ] **Step 3: Create production deployment notes without secrets**

Create `docs/handoff/production-deployment.md` with this exact content:

```markdown
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
```

- [ ] **Step 4: Verify no FTP password is tracked**

Run:

```bash
grep -R "FTP password" . --exclude-dir=.git --exclude-dir=.superpowers --exclude="2026-06-09-flor-d-loto-ps.md" || true
grep -R "ftpupload.net.*password\|password.*ftpupload.net" . --exclude-dir=.git --exclude-dir=.superpowers || true
```

Expected: no output containing a real FTP password.

- [ ] **Step 5: Commit repository safety files**

Run:

```bash
git add .gitignore docs/handoff/production-deployment.md docs/superpowers/specs/2026-06-09-flor-d-loto-ps-design.md docs/superpowers/plans/2026-06-09-flor-d-loto-ps.md
```

Expected: commit succeeds.

---

### Task 2: Install Clean PrestaShop Locally

**Files:**
- Create/Extract: PrestaShop application files in project root
- Create after installation: `app/config/parameters.php` or `config/settings.inc.php` depending on PrestaShop version

- [ ] **Step 1: Download PrestaShop package**

Run:

```bash
curl -L "https://github.com/PrestaShop/PrestaShop/releases/download/8.2.1/prestashop_8.2.1.zip" -o prestashop_8.2.1.zip
```

Expected: `prestashop_8.2.1.zip` exists.

- [ ] **Step 2: Extract PrestaShop package**

Run:

```bash
unzip -q prestashop_8.2.1.zip
```

Expected: project root contains PrestaShop installer files or a nested PrestaShop archive.

- [ ] **Step 3: Extract nested PrestaShop archive if present**

Run:

```bash
test -f prestashop.zip && unzip -q prestashop.zip || true
```

Expected: project root contains `index.php`, `install/`, `classes/`, `modules/`, and `themes/`.

- [ ] **Step 4: Verify PHP and required folders**

Run:

```bash
php -v && test -f index.php && test -d install && test -d themes && test -d modules
```

Expected: PHP version prints and command exits `0`.

- [ ] **Step 5: Install locally through browser if CLI install is unavailable**

Run:

```bash
php -S localhost:8080 router.php
```

Expected: local server starts. Open `http://localhost:8080/install/` and install with these values:

```text
Shop name: Flor de Loto
Shop activity: Flowers / Florist
Country: Spain
Default language: Spanish
Admin email: admin@flordeloto.local
Admin password: generate with `openssl rand -base64 18`
Database host: localhost
Database name: flor_d_loto_ps
Database user: local MySQL user
Database password: local MySQL password
```

- [ ] **Step 6: Remove installer after successful install**

Run after installation completes:

```bash
mv install install-disabled
```

Expected: `install-disabled/` exists and `/install/` no longer loads.

- [ ] **Step 7: Commit clean installation baseline**

Run:

```bash
git add .
```

Expected: commit succeeds. If `git status --short` shows secrets in config files, stop and update `.gitignore` before committing.

---

### Task 3: Add Cache And Asset Scripts

**Files:**
- Create: `scripts/clear-prestashop-cache.sh`
- Create: `scripts/copy-flor-assets.sh`

- [ ] **Step 1: Create cache clearing script**

Create `scripts/clear-prestashop-cache.sh` with this exact content:

```bash
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

rm -rf var/cache/dev/* var/cache/prod/* cache/smarty/cache/* cache/smarty/compile/* 2>/dev/null || true

if [ -f ./bin/console ]; then
  php ./bin/console cache:clear --env=prod --no-warmup || true
  php ./bin/console cache:clear --env=dev --no-warmup || true
fi
```

- [ ] **Step 2: Create asset copy script**

Create `scripts/copy-flor-assets.sh` with this exact content:

```bash
#!/usr/bin/env bash
set -euo pipefail

SOURCE="/Users/juanmamolinncortes/Documentos/ng-flor-loto/src/assets"
TARGET="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/themes/flordeloto/assets"

mkdir -p "$TARGET/img"
cp -R "$SOURCE/img/logo-loto.png" "$TARGET/img/"
cp -R "$SOURCE/img/logo-new-loto.jpg" "$TARGET/img/"
cp -R "$SOURCE/img/logo-loto-horizontal.png" "$TARGET/img/"
cp -R "$SOURCE/img/products" "$TARGET/img/"
cp -R "$SOURCE/img/recommends" "$TARGET/img/"
cp -R "$SOURCE/img/icons-services" "$TARGET/img/"
cp -R "$SOURCE/img/icons-dial" "$TARGET/img/"
cp -R "$SOURCE/img/opinions" "$TARGET/img/"
cp -R "$SOURCE/img/no-image.jpg" "$TARGET/img/"
```

- [ ] **Step 3: Make scripts executable**

Run:

```bash
chmod +x scripts/clear-prestashop-cache.sh scripts/copy-flor-assets.sh
```

Expected: command exits `0`.

- [ ] **Step 4: Commit scripts**

Run:

```bash
git add scripts/clear-prestashop-cache.sh scripts/copy-flor-assets.sh
```

Expected: commit succeeds.

---

### Task 4: Create `flordeloto` Theme Skeleton

**Files:**
- Create: `themes/flordeloto/config/theme.yml`
- Create: `themes/flordeloto/templates/layouts/layout-full-width.tpl`
- Create: `themes/flordeloto/templates/_partials/head.tpl`
- Create: `themes/flordeloto/templates/_partials/stylesheets.tpl`
- Create: `themes/flordeloto/templates/_partials/javascript.tpl`

- [ ] **Step 1: Create theme directories**

Run:

```bash
mkdir -p themes/flordeloto/config themes/flordeloto/templates/layouts themes/flordeloto/templates/_partials themes/flordeloto/templates/catalog/listing themes/flordeloto/templates/catalog/product themes/flordeloto/assets/css themes/flordeloto/assets/js themes/flordeloto/assets/img
```

Expected: directories exist.

- [ ] **Step 2: Create theme config**

Create `themes/flordeloto/config/theme.yml` with this exact content:

```yaml
name: flordeloto
display_name: Flor de Loto
version: 1.0.0
author:
  name: Flor de Loto
  email: admin@flordeloto.local
meta:
  compatibility:
    from: 8.0.0
    to: ~
assets:
  use_parent_assets: false
global_settings:
  configuration:
    PS_IMAGE_QUALITY: png_all
  modules:
    to_enable:
      - ps_categorytree
      - ps_contactinfo
      - ps_customtext
      - ps_featuredproducts
      - ps_imageslider
      - ps_mainmenu
theme_settings:
  default_layout: layout-full-width
```

- [ ] **Step 3: Create global layout**

Create `themes/flordeloto/templates/layouts/layout-full-width.tpl` with this exact content:

```smarty
<!DOCTYPE html>
<html lang="{$language.locale}">
<head>
  {block name='head'}{include file='_partials/head.tpl'}{/block}
  {block name='stylesheets'}{include file='_partials/stylesheets.tpl'}{/block}
</head>
<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
  {hook h='displayAfterBodyOpeningTag'}

  <header id="header">
    {include file='_partials/header.tpl'}
  </header>

  <main id="wrapper">
    {block name='notifications'}{include file='_partials/notifications.tpl'}{/block}
    <div id="content-wrapper" class="js-content-wrapper">
      {block name='content'}{/block}
    </div>
  </main>

  {include file='_partials/footer.tpl'}

  {block name='javascript_bottom'}{include file='_partials/javascript.tpl'}{/block}
  {hook h='displayBeforeBodyClosingTag'}
</body>
</html>
```

- [ ] **Step 4: Create head partial**

Create `themes/flordeloto/templates/_partials/head.tpl` with this exact content:

```smarty
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="{$page.meta.description}">
<title>{$page.meta.title}</title>
<link rel="icon" href="{$urls.theme_assets}img/logo-loto.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
{hook h='displayHeader'}
```

- [ ] **Step 5: Create stylesheet partial**

Create `themes/flordeloto/templates/_partials/stylesheets.tpl` with this exact content:

```smarty
<link rel="stylesheet" href="{$urls.theme_assets}css/theme.css">
```

- [ ] **Step 6: Create JavaScript partial**

Create `themes/flordeloto/templates/_partials/javascript.tpl` with this exact content:

```smarty
<script src="{$urls.theme_assets}js/theme.js" defer></script>
```

- [ ] **Step 7: Commit theme skeleton**

Run:

```bash
git add themes/flordeloto/config/theme.yml themes/flordeloto/templates/layouts/layout-full-width.tpl themes/flordeloto/templates/_partials/head.tpl themes/flordeloto/templates/_partials/stylesheets.tpl themes/flordeloto/templates/_partials/javascript.tpl
```

Expected: commit succeeds.

---

### Task 5: Add Header, Footer, Notifications, And Homepage

**Files:**
- Create: `themes/flordeloto/templates/_partials/header.tpl`
- Create: `themes/flordeloto/templates/_partials/footer.tpl`
- Create: `themes/flordeloto/templates/_partials/notifications.tpl`
- Create: `themes/flordeloto/templates/index.tpl`

- [ ] **Step 1: Create header partial**

Create `themes/flordeloto/templates/_partials/header.tpl` with this exact content:

```smarty
<div class="site-header__inner">
  <a class="site-logo" href="{$urls.pages.index}" aria-label="Flor de Loto inicio">
    <img src="{$urls.theme_assets}img/logo-loto-horizontal.png" alt="{$shop.name}">
  </a>

  <nav class="site-nav" aria-label="Principal">
    <a href="{$urls.pages.index}">Inicio</a>
    <a href="{url entity='category' id=2}">Tienda</a>
    <a href="{url entity='category' id=3}">Ramos</a>
    <a href="{url entity='category' id=4}">Rosas</a>
    <a href="{url entity='category' id=5}">Orquideas</a>
    <a href="{url entity='category' id=6}">Plantas</a>
    <a href="{url entity='category' id=7}">Bodas</a>
    <a href="{url entity='category' id=8}">Funerales</a>
    <a href="{$urls.pages.contact}">Contacto</a>
  </nav>

  <div class="site-actions">
    <a href="{$urls.pages.search}" aria-label="Buscar">Buscar</a>
    <a href="{$urls.pages.my_account}" aria-label="Mi cuenta">Cuenta</a>
    <a href="{$urls.pages.cart}" aria-label="Carrito">Carrito {if $cart.products_count > 0}<span>{$cart.products_count}</span>{/if}</a>
    <button class="menu-toggle" type="button" aria-controls="mobileMenu" aria-expanded="false">Menu</button>
  </div>
</div>

<nav class="mobile-menu" id="mobileMenu" aria-label="Menu movil">
  <a href="{$urls.pages.index}">Inicio</a>
  <a href="{url entity='category' id=2}">Tienda</a>
  <a href="{url entity='category' id=3}">Ramos</a>
  <a href="{url entity='category' id=4}">Rosas</a>
  <a href="{url entity='category' id=5}">Orquideas</a>
  <a href="{url entity='category' id=6}">Plantas</a>
  <a href="{url entity='category' id=7}">Bodas</a>
  <a href="{url entity='category' id=8}">Funerales</a>
  <a href="{$urls.pages.contact}">Contacto</a>
</nav>
```

- [ ] **Step 2: Create footer partial**

Create `themes/flordeloto/templates/_partials/footer.tpl` with this exact content:

```smarty
<footer id="footer" class="site-footer">
  <div class="container footer-grid">
    <div>
      <img class="footer-logo" src="{$urls.theme_assets}img/logo-loto-horizontal.png" alt="{$shop.name}">
      <p>Floristeria artesanal especializada en ramos, plantas, bodas y arreglos para momentos especiales.</p>
    </div>
    <div>
      <h3>Tienda</h3>
      <a href="{url entity='category' id=3}">Ramos</a>
      <a href="{url entity='category' id=4}">Rosas</a>
      <a href="{url entity='category' id=6}">Plantas</a>
      <a href="{url entity='category' id=8}">Funerales</a>
    </div>
    <div>
      <h3>Contacto</h3>
      <p>Segovia, Espana</p>
      <p><a href="mailto:info@flordeloto.local">info@flordeloto.local</a></p>
      <p><a href="https://wa.me/34000000000">WhatsApp</a></p>
    </div>
  </div>
  <div class="footer-bottom">© {$smarty.now|date_format:"%Y"} {$shop.name}. Todos los derechos reservados.</div>
</footer>
```

- [ ] **Step 3: Create notifications partial**

Create `themes/flordeloto/templates/_partials/notifications.tpl` with this exact content:

```smarty
{foreach from=$notifications item=notification}
  {if !empty($notification.message)}
    <div class="alert alert-{$notification.type}">{$notification.message}</div>
  {/if}
{/foreach}
```

- [ ] **Step 4: Create homepage template**

Create `themes/flordeloto/templates/index.tpl` with this exact content:

```smarty
{extends 'layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="hero">
    <div class="container hero-grid">
      <div class="hero-copy">
        <p class="eyebrow">Floristeria artesanal</p>
        <h1>Flores con alma para cada momento</h1>
        <p>Ramos, plantas y composiciones creadas a mano para regalar, celebrar y acompanar.</p>
        <div class="hero-actions">
          <a class="btn btn-primary" href="{url entity='category' id=2}">Comprar flores</a>
          <a class="btn btn-secondary" href="{$urls.pages.contact}">Encargo personalizado</a>
        </div>
      </div>
      <div class="hero-media">
        <img src="{$urls.theme_assets}img/products/bouquet/ramo-armonia_1.jpg" alt="Ramo artesanal Flor de Loto">
      </div>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <div class="section-heading">
        <p class="eyebrow">Comprar por ocasion</p>
        <h2>Encuentra el detalle perfecto</h2>
      </div>
      <div class="category-cards">
        <a href="{url entity='category' id=3}" style="background-image:url('{$urls.theme_assets}img/products/bouquet/ramo-primavera_1.jpg')"><span>Ramos</span></a>
        <a href="{url entity='category' id=4}" style="background-image:url('{$urls.theme_assets}img/products/floors/rouses/rosas-te_amo.jpg')"><span>Rosas</span></a>
        <a href="{url entity='category' id=6}" style="background-image:url('{$urls.theme_assets}img/products/floors/more/planta-olivo_copa_1.jpg')"><span>Plantas</span></a>
        <a href="{url entity='category' id=8}" style="background-image:url('{$urls.theme_assets}img/products/funerals/funeral-corona_lisboa.jpeg')"><span>Funerales</span></a>
      </div>
    </div>
  </section>

  <section class="section home-modules">
    <div class="container">
      {hook h='displayHome'}
    </div>
  </section>

  <section class="section services-section">
    <div class="container services-grid">
      <article><img src="{$urls.theme_assets}img/icons-services/charm-plant.svg" alt=""><h3>Arte floral</h3><p>Composiciones cuidadas con flores frescas y criterio artesanal.</p></article>
      <article><img src="{$urls.theme_assets}img/icons-services/service-delivery.svg" alt=""><h3>Entrega local</h3><p>Preparamos tus pedidos para entrega en Segovia y alrededores.</p></article>
      <article><img src="{$urls.theme_assets}img/icons-services/advice.svg" alt=""><h3>Asesoramiento</h3><p>Te ayudamos a elegir el ramo adecuado para cada ocasion.</p></article>
    </div>
  </section>
{/block}
```

- [ ] **Step 5: Commit structural templates**

Run:

```bash
git add themes/flordeloto/templates/_partials/header.tpl themes/flordeloto/templates/_partials/footer.tpl themes/flordeloto/templates/_partials/notifications.tpl themes/flordeloto/templates/index.tpl
```

Expected: commit succeeds.

---

### Task 6: Add Catalogue And Product Templates

**Files:**
- Create: `themes/flordeloto/templates/catalog/listing/product-list.tpl`
- Create: `themes/flordeloto/templates/catalog/listing/search.tpl`
- Create: `themes/flordeloto/templates/catalog/product/product.tpl`

- [ ] **Step 1: Create product listing template**

Create `themes/flordeloto/templates/catalog/listing/product-list.tpl` with this exact content:

```smarty
{extends 'layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="section listing-page">
    <div class="container">
      <div class="section-heading">
        <h1>{$page.meta.title}</h1>
        {if $listing.description}<div class="category-description">{$listing.description nofilter}</div>{/if}
      </div>
      {if $listing.products|count > 0}
        <div class="products-grid">
          {foreach from=$listing.products item=product}
            <article class="product-card">
              <a href="{$product.url}">
                <div class="product-image">
                  <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name}" loading="lazy">
                  <span>Ver producto</span>
                </div>
                <div class="product-info">
                  <h2>{$product.name}</h2>
                  <p class="product-price">{$product.price}</p>
                </div>
              </a>
            </article>
          {/foreach}
        </div>
        {include file='_partials/pagination.tpl'}
      {else}
        <div class="empty-state"><h2>No hay productos disponibles</h2><p>Pronto tendremos nuevas flores en esta categoria.</p></div>
      {/if}
    </div>
  </section>
{/block}
```

- [ ] **Step 2: Create search template**

Create `themes/flordeloto/templates/catalog/listing/search.tpl` with this exact content:

```smarty
{extends 'catalog/listing/product-list.tpl'}
```

- [ ] **Step 3: Create product detail template**

Create `themes/flordeloto/templates/catalog/product/product.tpl` with this exact content:

```smarty
{extends 'layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="section product-page">
    <div class="container product-layout">
      <div class="product-gallery">
        {if $product.cover}
          <img class="product-main-image" src="{$product.cover.bySize.large_default.url}" alt="{$product.name}">
        {/if}
      </div>
      <div class="product-summary">
        <p class="eyebrow">Flor de Loto</p>
        <h1>{$product.name}</h1>
        <div class="product-detail-price">{$product.price}</div>
        {if $product.description_short}<div class="product-description">{$product.description_short nofilter}</div>{/if}

        <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
          <input type="hidden" name="token" value="{$static_token}">
          <input type="hidden" name="id_product" value="{$product.id_product}">
          <input type="hidden" name="id_customization" value="0">
          <div class="product-buy-row">
            <input class="quantity-input" type="number" name="qty" value="{$product.minimal_quantity}" min="{$product.minimal_quantity}">
            <button class="btn btn-primary" type="submit" name="add" {if $product.quantity <= 0}disabled{/if}>Anadir al carrito</button>
          </div>
        </form>
      </div>
    </div>
    {if $product.description}
      <div class="container product-long-description">
        <h2>Descripcion</h2>
        {$product.description nofilter}
      </div>
    {/if}
  </section>
{/block}
```

- [ ] **Step 4: Commit catalogue templates**

Run:

```bash
git add themes/flordeloto/templates/catalog/listing/product-list.tpl themes/flordeloto/templates/catalog/listing/search.tpl themes/flordeloto/templates/catalog/product/product.tpl
```

Expected: commit succeeds.

---

### Task 7: Add Warm Editorial CSS And JavaScript

**Files:**
- Create: `themes/flordeloto/assets/css/theme.css`
- Create: `themes/flordeloto/assets/js/theme.js`

- [ ] **Step 1: Create theme CSS**

Create `themes/flordeloto/assets/css/theme.css` with this exact content:

```css
:root {
  --cream: #fbf7ef;
  --linen: #f3eadc;
  --paper: #fffdf8;
  --ink: #37271f;
  --muted: #7b6658;
  --terracotta: #b76d54;
  --terracotta-dark: #8f4e3d;
  --olive: #6f7d55;
  --border: rgba(55, 39, 31, .12);
  --shadow: 0 24px 70px rgba(82, 52, 37, .14);
  --heading: 'Cormorant Garamond', Georgia, serif;
  --body: 'Inter', Arial, sans-serif;
}

* { box-sizing: border-box; }
html { font-size: 62.5%; scroll-behavior: smooth; }
body { margin: 0; min-width: 320px; background: var(--cream); color: var(--ink); font: 1.6rem/1.7 var(--body); }
img { display: block; max-width: 100%; height: auto; }
a { color: inherit; text-decoration: none; }
.container { width: min(1180px, calc(100% - 40px)); margin: 0 auto; }

#header { position: sticky; top: 0; z-index: 50; background: rgba(251,247,239,.92); border-bottom: 1px solid var(--border); backdrop-filter: blur(18px); }
.site-header__inner { min-height: 82px; width: min(1180px, calc(100% - 40px)); margin: 0 auto; display: flex; align-items: center; justify-content: space-between; gap: 24px; }
.site-logo img { height: 54px; width: auto; }
.site-nav { display: flex; align-items: center; gap: 22px; font-size: 1.3rem; font-weight: 700; text-transform: uppercase; letter-spacing: .08em; color: var(--muted); }
.site-nav a:hover { color: var(--terracotta); }
.site-actions { display: flex; align-items: center; gap: 14px; font-size: 1.3rem; font-weight: 700; }
.site-actions span { display: inline-grid; place-items: center; min-width: 20px; height: 20px; margin-left: 4px; border-radius: 999px; background: var(--terracotta); color: white; }
.menu-toggle { display: none; border: 1px solid var(--border); background: var(--paper); color: var(--ink); padding: 9px 12px; border-radius: 999px; font-weight: 700; }
.mobile-menu { display: none; padding: 0 20px 20px; background: var(--paper); border-bottom: 1px solid var(--border); }
.mobile-menu.is-open { display: grid; gap: 14px; }

.hero { padding: 76px 0 90px; background: radial-gradient(circle at 80% 10%, #f1d5c9 0, transparent 36%), var(--cream); }
.hero-grid { display: grid; grid-template-columns: 1.02fr .98fr; gap: 64px; align-items: center; }
.eyebrow { margin: 0 0 12px; color: var(--terracotta); text-transform: uppercase; letter-spacing: .16em; font-size: 1.2rem; font-weight: 800; }
h1, h2, h3 { margin: 0; font-family: var(--heading); line-height: .98; font-weight: 700; }
h1 { font-size: clamp(5rem, 8vw, 9.2rem); letter-spacing: -.04em; }
h2 { font-size: clamp(3.4rem, 5vw, 5.6rem); }
h3 { font-size: 2.8rem; }
.hero-copy > p:not(.eyebrow) { max-width: 580px; color: var(--muted); font-size: 1.9rem; }
.hero-actions { display: flex; gap: 14px; flex-wrap: wrap; margin-top: 32px; }
.btn { display: inline-flex; align-items: center; justify-content: center; min-height: 48px; padding: 0 24px; border-radius: 999px; font-weight: 800; border: 1px solid transparent; }
.btn-primary { background: var(--terracotta); color: white; }
.btn-primary:hover { background: var(--terracotta-dark); }
.btn-secondary { background: transparent; border-color: var(--border); color: var(--ink); }
.hero-media { padding: 16px; border: 1px solid var(--border); border-radius: 40px; background: rgba(255,255,255,.42); box-shadow: var(--shadow); }
.hero-media img { width: 100%; aspect-ratio: 4 / 5; object-fit: cover; border-radius: 30px; }

.section { padding: 88px 0; }
.section-heading { margin-bottom: 34px; text-align: center; }
.section-heading .category-description { max-width: 760px; margin: 16px auto 0; color: var(--muted); }
.category-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; }
.category-cards a { min-height: 260px; display: flex; align-items: end; padding: 22px; border-radius: 28px; overflow: hidden; background-size: cover; background-position: center; box-shadow: inset 0 -120px 90px rgba(55,39,31,.52); }
.category-cards span { color: white; font-family: var(--heading); font-size: 3rem; font-weight: 700; }
.home-modules { background: var(--linen); border-block: 1px solid var(--border); }
.home-modules .homeslider-container, .home-modules .banner, .home-modules #custom-text { margin: 0 0 28px; border-radius: 28px; overflow: hidden; background: var(--paper); border: 1px solid var(--border); }
.home-modules .rslides, .home-modules .rslides li { margin: 0; padding: 0; list-style: none; }
.home-modules .rslides li:not(:first-child) { display: none; }
.home-modules .caption { display: block; padding: 28px; }
.home-modules #custom-text { padding: 34px; text-align: center; }
.services-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
.services-grid article { padding: 34px; background: var(--paper); border: 1px solid var(--border); border-radius: 28px; box-shadow: 0 14px 38px rgba(82,52,37,.08); }
.services-grid img { width: 54px; height: 54px; margin-bottom: 18px; }

.products-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 22px; }
.product-card { background: var(--paper); border: 1px solid var(--border); border-radius: 28px; overflow: hidden; box-shadow: 0 14px 38px rgba(82,52,37,.08); }
.product-image { position: relative; overflow: hidden; }
.product-image img { width: 100%; aspect-ratio: 1; object-fit: cover; transition: transform .35s ease; }
.product-image span { position: absolute; left: 16px; bottom: 16px; padding: 9px 13px; border-radius: 999px; background: var(--paper); color: var(--ink); font-size: 1.2rem; font-weight: 800; opacity: 0; transform: translateY(8px); transition: .25s ease; }
.product-card:hover img { transform: scale(1.04); }
.product-card:hover .product-image span { opacity: 1; transform: translateY(0); }
.product-info { padding: 18px; }
.product-info h2 { font-size: 2.2rem; line-height: 1.1; }
.product-price, .product-detail-price { color: var(--terracotta); font-weight: 900; }
.product-layout { display: grid; grid-template-columns: 1fr 1fr; gap: 58px; align-items: start; }
.product-main-image { width: 100%; border-radius: 34px; box-shadow: var(--shadow); }
.product-summary { padding: 40px; background: var(--paper); border: 1px solid var(--border); border-radius: 34px; }
.product-detail-price { margin: 22px 0; font-size: 2.8rem; }
.quantity-input { width: 92px; min-height: 48px; padding: 0 12px; border: 1px solid var(--border); border-radius: 999px; background: var(--cream); }
.product-buy-row { display: flex; gap: 12px; flex-wrap: wrap; }
.product-long-description { margin-top: 56px; color: var(--muted); }
.empty-state { padding: 70px 20px; text-align: center; background: var(--paper); border-radius: 28px; }

.site-footer { padding: 70px 0 0; background: #37271f; color: #fff8ee; }
.footer-grid { display: grid; grid-template-columns: 1.4fr 1fr 1fr; gap: 50px; }
.footer-logo { height: 64px; width: auto; margin-bottom: 18px; filter: brightness(0) invert(1); }
.site-footer a, .site-footer p { display: block; color: rgba(255,248,238,.78); }
.footer-bottom { margin-top: 46px; padding: 18px; text-align: center; border-top: 1px solid rgba(255,255,255,.12); color: rgba(255,248,238,.7); }

.alert { width: min(1180px, calc(100% - 40px)); margin: 18px auto; padding: 14px 18px; border-radius: 16px; background: var(--paper); border: 1px solid var(--border); }

@media (max-width: 1050px) {
  .site-nav { display: none; }
  .menu-toggle { display: inline-flex; }
  .hero-grid, .product-layout, .footer-grid { grid-template-columns: 1fr; }
  .category-cards, .products-grid { grid-template-columns: repeat(2, 1fr); }
  .services-grid { grid-template-columns: 1fr; }
}

@media (max-width: 560px) {
  .container, .site-header__inner { width: min(100% - 28px, 1180px); }
  .site-actions a:not(:last-of-type) { display: none; }
  .hero { padding: 44px 0 60px; }
  .section { padding: 58px 0; }
  .category-cards, .products-grid { grid-template-columns: 1fr; }
}
```

- [ ] **Step 2: Create theme JavaScript**

Create `themes/flordeloto/assets/js/theme.js` with this exact content:

```js
document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.querySelector('.menu-toggle');
  const menu = document.querySelector('#mobileMenu');

  if (!toggle || !menu) return;

  toggle.addEventListener('click', () => {
    const isOpen = menu.classList.toggle('is-open');
    toggle.setAttribute('aria-expanded', String(isOpen));
  });
});
```

- [ ] **Step 3: Copy approved assets into theme**

Run:

```bash
./scripts/copy-flor-assets.sh
```

Expected: `themes/flordeloto/assets/img/logo-loto-horizontal.png` and `themes/flordeloto/assets/img/products/bouquet/ramo-armonia_1.jpg` exist.

- [ ] **Step 4: Commit assets and front-end files**

Run:

```bash
git add themes/flordeloto/assets scripts/copy-flor-assets.sh
```

Expected: commit succeeds.

---

### Task 8: Activate Theme And Seed Editable Content

**Files:**
- Modify through Back Office or PrestaShop CLI/database: active theme, categories, products, CMS pages
- Create: `docs/handoff/back-office.md`

- [ ] **Step 1: Activate the custom theme**

Use Back Office: `Design > Theme & Logo`, select `Flor de Loto`, and apply it.

Expected: Front office uses `/themes/flordeloto/assets/css/theme.css`.

- [ ] **Step 2: Create or rename categories in Back Office**

Use Back Office: `Catalog > Categories` and ensure these categories exist:

```text
Inicio
Ramos
Rosas
Orquideas
Plantas
Bodas
Funerales
```

Expected: each category has a name, description, and image from `themes/flordeloto/assets/img/products`.

- [ ] **Step 3: Create seed products in Back Office**

Use Back Office: `Catalog > Products` and create at least these products:

```text
Ramo Armonia | Ramos | 39.90 EUR | img/products/bouquet/ramo-armonia_1.jpg
Ramo Primavera | Ramos | 34.90 EUR | img/products/bouquet/ramo-primavera_1.jpg
Rosas Te Amo | Rosas | 49.90 EUR | img/products/floors/rouses/rosas-te_amo.jpg
Orquidea Phalaenopsis | Orquideas | 29.90 EUR | img/products/floors/orchid/orquidea-phalaenopsis_1.jpg
Olivo Copa | Plantas | 44.90 EUR | img/products/floors/more/planta-olivo_copa_1.jpg
Ramo de Novia | Bodas | 89.90 EUR | img/products/events/wedding_1.webp
Corona Lisboa | Funerales | 120.00 EUR | img/products/funerals/funeral-corona_lisboa.jpeg
```

Expected: products appear in Back Office and front office listing pages.

- [ ] **Step 4: Create back office handoff document**

Create `docs/handoff/back-office.md` with this exact content:

```markdown
# Back Office Handoff

## Editable Areas

- Products: `Catalog > Products`
- Categories: `Catalog > Categories`
- Orders: `Orders > Orders`
- Customers: `Customers > Customers`
- CMS pages: `Design > Pages`
- Theme logo: `Design > Theme & Logo`
- Homepage modules: `Modules > Module Manager`

## Content Editing Rules

- Edit products and categories from Back Office, not code.
- Replace sample prices and descriptions from `Catalog > Products`.
- Replace legal texts from `Design > Pages`.
- Change the temporary admin password after first login.

## Temporary Admin

The temporary admin email is `admin@flordeloto.local` unless changed during installation. The password is not stored in this repository.
```

- [ ] **Step 5: Commit handoff documentation**

Run:

```bash
git add docs/handoff/back-office.md
```

Expected: commit succeeds.

---

### Task 9: Verify Local Storefront And Back Office

**Files:**
- No source file changes expected unless verification finds defects.

- [ ] **Step 1: Clear caches**

Run:

```bash
./scripts/clear-prestashop-cache.sh
```

Expected: command exits `0`.

- [ ] **Step 2: Start local server**

Run:

```bash
php -S localhost:8080 router.php
```

Expected: server starts on `http://localhost:8080`.

- [ ] **Step 3: Verify homepage HTML**

Run in another terminal:

```bash
curl -s http://localhost:8080/ > /tmp/flor-home.html
```

Expected: grep prints matching home sections.

- [ ] **Step 4: Verify theme CSS is served**

Run:

```bash
curl -s http://localhost:8080/themes/flordeloto/assets/css/theme.css > /tmp/flor-theme.css
```

Expected: grep prints matching CSS selectors/variables.

- [ ] **Step 5: Verify catalogue page**

Run:

```bash
curl -s http://localhost:8080/2-inicio > /tmp/flor-category.html
```

Expected: grep prints product grid markup.

- [ ] **Step 6: Verify no secrets in tracked files**

Run:

```bash
grep -R "ftpupload.net.*password\|password.*ftpupload.net" . --exclude-dir=.git --exclude-dir=.superpowers || true
```

Expected: no output containing a real FTP password.

---

### Task 10: Prepare FTP Upload Handoff

**Files:**
- Modify: `docs/handoff/production-deployment.md`

- [ ] **Step 1: Update production handoff with upload exclusions**

Append this content to `docs/handoff/production-deployment.md`:

```markdown

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
```

- [ ] **Step 2: Commit production handoff update**

Run:

```bash
git add docs/handoff/production-deployment.md
```

Expected: commit succeeds.

- [ ] **Step 3: Stop before actual FTP upload if MySQL is missing**

Check whether production MySQL values are available.

Expected: if database name, user, password, and host are missing, do not upload yet. Report that FTP credentials are available but production installation cannot complete without MySQL.

---

## Self-Review

Spec coverage:

- New project name and location are covered in Tasks 1 and 2.
- PrestaShop CMS editing is covered in Tasks 2, 5, 6, and 8.
- Warm editorial visual direction is covered in Tasks 5 and 7.
- Asset reuse from `ng-flor-loto` is covered in Tasks 3 and 7.
- Back Office credentials policy is covered in Tasks 2 and 8.
- FTP production details and missing MySQL are covered in Tasks 1 and 10.
- Verification requirements are covered in Task 9.

Placeholder scan:

- The plan contains no unresolved placeholder markers.
- Passwords are intentionally not embedded in repository files.

Type and path consistency:

- Theme name is consistently `flordeloto`.
- Project root is consistently `/Users/juanmamolinncortes/Documentos/flor-d-loto-ps`.
- Asset source is consistently `/Users/juanmamolinncortes/Documentos/ng-flor-loto/src/assets`.
