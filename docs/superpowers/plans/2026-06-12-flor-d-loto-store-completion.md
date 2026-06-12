# Flor De Loto Store Completion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Finish the existing Flor de Loto PrestaShop store in the implementation worktree so the storefront is polished, the starter content feels complete, local review works end to end, and deployment handoff is ready except for production MySQL data.

**Architecture:** Work only inside the existing PrestaShop installation at `.worktrees/implementation`, concentrating on project-owned theme templates, theme assets, small helper docs, and local verification. Preserve PrestaShop Back Office as the editing surface for products, categories, homepage modules, and CMS content; use manual browser verification for storefront behavior instead of inventing new custom tooling.

**Tech Stack:** PrestaShop 8.x, Smarty templates, CSS, vanilla JavaScript, PHP CLI, browser-based Back Office and storefront verification, git.

---

## File Structure

Modify or create only these project-owned files for this completion pass:

- Modify: `.worktrees/implementation/themes/flordeloto/templates/index.tpl` to finish homepage structure and editable home sections.
- Modify: `.worktrees/implementation/themes/flordeloto/templates/_partials/header.tpl` to stabilize navigation, cart access, and mobile menu labels.
- Modify: `.worktrees/implementation/themes/flordeloto/templates/_partials/footer.tpl` to finish contact, trust, and legal handoff links.
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/listing/product-list.tpl` to finish category and search listing presentation.
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/listing/search.tpl` if search needs wording or wrapper changes.
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/product/product.tpl` to finish product detail layout without breaking native add-to-cart behavior.
- Modify: `.worktrees/implementation/themes/flordeloto/assets/css/theme.css` to close visual gaps across home, listing, product, cart, and responsive navigation.
- Modify: `.worktrees/implementation/themes/flordeloto/assets/js/theme.js` only if the mobile menu or small UI interactions still need fixes.
- Modify: `.worktrees/implementation/themes/flordeloto/config/theme.yml` only if module expectations or theme metadata need alignment with the final storefront.
- Modify: `.worktrees/implementation/docs/handoff/back-office.md` so editing instructions match the final local setup.
- Modify: `.worktrees/implementation/docs/handoff/production-deployment.md` so deployment notes match the final local readiness and remaining production blocker.
- Create: `.worktrees/implementation/docs/handoff/local-review-checklist.md` to record the exact manual validation path for storefront and Back Office review.
- Create: `.worktrees/implementation/docs/handoff/catalog-seed-checklist.md` to document the expected starter categories, homepage sections, and seeded product coverage.

Do not hand-edit vendor-owned PrestaShop source outside these files unless a concrete blocker forces it.

---

### Task 1: Audit The Existing Storefront Baseline

**Files:**
- Create: `.worktrees/implementation/docs/handoff/local-review-checklist.md`

- [ ] **Step 1: Confirm the implementation worktree is the active target**

Run: `git worktree list`

Expected: output includes `/Users/juanmamolinncortes/Documentos/flor-d-loto-ps/.worktrees/implementation` on branch `feature/flor-d-loto-ps`.

- [ ] **Step 2: Inspect the current theme files before changing anything**

Run: `git status --short && php -l themes/flordeloto/templates/index.tpl && php -l themes/flordeloto/templates/catalog/product/product.tpl`

Expected: git status prints the current worktree state and each `php -l` line ends with `No syntax errors detected`.

- [ ] **Step 3: Start a local PHP server if one is not already available**

Run: `php -S localhost:8080`

Expected: terminal prints `PHP ... Development Server (http://localhost:8080) started` and keeps running until stopped.

- [ ] **Step 4: Create the review checklist file with the baseline verification path**

Create `.worktrees/implementation/docs/handoff/local-review-checklist.md` with this exact content:

```markdown
# Local Review Checklist

## Front Office

1. Open `http://localhost:8080/` and verify the homepage loads.
2. Open the mobile viewport and verify the menu button opens and closes the mobile navigation.
3. Open a category page from the main navigation and verify product cards render correctly.
4. Open a product page and verify image, price, description, quantity, and add-to-cart controls are visible.
5. Add one product to cart and verify the cart page loads.

## Back Office

1. Open the admin URL created by the local PrestaShop install.
2. Log in with the temporary admin account.
3. Open `Catalog > Products` and verify seeded products are editable.
4. Open `Catalog > Categories` and verify the main storefront categories are editable.
5. Open `Design > Pages` and verify CMS pages are still editable.

## Outcome Log

- Homepage:
- Mobile menu:
- Category listing:
- Product page:
- Cart:
- Back Office products:
- Back Office categories:
- Back Office CMS:
```

- [ ] **Step 5: Record the first visual audit pass manually**

Open these URLs in the browser and write the observed issues into `docs/handoff/local-review-checklist.md` under `Outcome Log`:

- `http://localhost:8080/`
- the first visible category URL from the homepage or header
- the first visible product URL from that category
- `http://localhost:8080/cart?action=show`

Expected: the checklist contains short notes describing what looks complete and what still needs fixing.

- [ ] **Step 6: Commit the baseline review document**

Run:

```bash
git add docs/handoff/local-review-checklist.md
git commit -m "docs: add local storefront review checklist"
```

Expected: commit succeeds.

---

### Task 2: Finish The Shared Theme Shell

**Files:**
- Modify: `.worktrees/implementation/themes/flordeloto/templates/_partials/header.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/templates/_partials/footer.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/assets/css/theme.css`
- Modify: `.worktrees/implementation/themes/flordeloto/assets/js/theme.js`

- [ ] **Step 1: Write down the exact shell problems found in the audit**

Copy the shell-related issues from `docs/handoff/local-review-checklist.md` into your working notes, limited to:

- header navigation
- cart access
- mobile menu behavior
- footer contact/trust/legal presentation
- responsive spacing or overflow

Expected: you have a short issue list focused only on shared shell problems.

- [ ] **Step 2: Update the header markup with minimal semantic fixes**

Edit `themes/flordeloto/templates/_partials/header.tpl` so it keeps the existing category links but adds any missing accessibility text, current labels, and stable button wording discovered in the audit.

Keep this structure intact:

```smarty
<nav class="site-nav" aria-label="Navegacion principal">
  ...category links...
</nav>

<button class="menu-toggle" type="button" aria-controls="mobileMenu" aria-expanded="false">
  Menu
</button>
```

Expected: no category link IDs are changed unless the existing IDs are proven wrong in the local catalog.

- [ ] **Step 3: Update the footer markup to reflect the final local handoff state**

Edit `themes/flordeloto/templates/_partials/footer.tpl` so it includes only real or clearly temporary client-facing contact points.

Use this rule exactly:

```text
If a phone, WhatsApp link, email, or legal page URL is not confirmed locally, keep it generic or route to the PrestaShop contact page instead of inventing a real production contact value.
```

Expected: the footer no longer implies unverified production contact data.

- [ ] **Step 4: Fix shell layout and responsive issues in theme CSS**

Edit `themes/flordeloto/assets/css/theme.css` only in the selectors related to header, footer, mobile menu, spacing, and shared containers.

Keep changes focused to selectors like these:

```css
.site-header__inner {}
.site-nav {}
.site-header__actions {}
.mobile-menu {}
.site-footer {}
.container {}
```

Expected: the shell no longer overflows on mobile and the nav remains usable on desktop and mobile.

- [ ] **Step 5: Fix the mobile menu script only if the audit proves it necessary**

Edit `themes/flordeloto/assets/js/theme.js` only if one of these issues was reproduced:

- menu does not open
- menu does not close
- focus is lost after close
- menu remains open on desktop resize

Keep the implementation inside the existing `DOMContentLoaded` block.

Expected: no new JS feature is added beyond menu stability.

- [ ] **Step 6: Clear caches and verify the shared shell pages**

Run:

```bash
./scripts/clear-prestashop-cache.sh
php -l themes/flordeloto/templates/_partials/header.tpl
php -l themes/flordeloto/templates/_partials/footer.tpl
```

Expected: the cache clears without a fatal error and both template lint commands report no syntax errors.

- [ ] **Step 7: Re-test the homepage and cart manually**

Open these pages in the browser after cache clear:

- `http://localhost:8080/`
- `http://localhost:8080/cart?action=show`

Expected: header, footer, cart access, and mobile menu behave correctly.

- [ ] **Step 8: Commit the shared shell fixes**

Run:

```bash
git add themes/flordeloto/templates/_partials/header.tpl themes/flordeloto/templates/_partials/footer.tpl themes/flordeloto/assets/css/theme.css themes/flordeloto/assets/js/theme.js
git commit -m "fix: polish flor de loto storefront shell"
```

Expected: commit succeeds.

---

### Task 3: Finish Home, Listing, And Product Templates

**Files:**
- Modify: `.worktrees/implementation/themes/flordeloto/templates/index.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/listing/product-list.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/listing/search.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/templates/catalog/product/product.tpl`
- Modify: `.worktrees/implementation/themes/flordeloto/assets/css/theme.css`

- [ ] **Step 1: Verify the current template files still parse cleanly before editing**

Run:

```bash
php -l themes/flordeloto/templates/index.tpl
php -l themes/flordeloto/templates/catalog/listing/product-list.tpl
php -l themes/flordeloto/templates/catalog/listing/search.tpl
php -l themes/flordeloto/templates/catalog/product/product.tpl
```

Expected: all four commands report `No syntax errors detected`.

- [ ] **Step 2: Finish the homepage structure without hardcoding day-to-day business data**

Edit `themes/flordeloto/templates/index.tpl` so the page keeps these sections in this order:

```smarty
{block name='content'}
  <section class="home-hero">...</section>
  <section class="featured-categories">...</section>
  <section class="home-modules">{hook h='displayHome'}</section>
  <section class="home-services">...</section>
{/block}
```

Expected: hero copy, category cards, and service cards remain present, but text or links can be corrected to match the actual catalog IDs and local content.

- [ ] **Step 3: Finish the category and search listing presentation**

Edit `themes/flordeloto/templates/catalog/listing/product-list.tpl` and `themes/flordeloto/templates/catalog/listing/search.tpl` so they preserve native PrestaShop product loops while improving heading, description, and empty-state presentation.

Do not replace the core product listing loop with custom data loading.

Expected: category and search pages still use native PrestaShop listing data.

- [ ] **Step 4: Finish the product detail page without breaking native add-to-cart**

Edit `themes/flordeloto/templates/catalog/product/product.tpl` so it keeps the native cart form and add-to-cart include.

Preserve this structure exactly:

```smarty
<form action="{$urls.pages.cart|escape:'html':'UTF-8'}" method="post" id="add-to-cart-or-refresh">
  ...
  {block name='product_add_to_cart'}
    {include file='catalog/_partials/product-add-to-cart.tpl'}
  {/block}
</form>
```

Expected: product layout can be polished, but add-to-cart must remain native.

- [ ] **Step 5: Finish visual polish for home, listing, and product selectors in CSS**

Edit `themes/flordeloto/assets/css/theme.css` only in selectors related to these page areas:

```css
.home-hero {}
.featured-categories {}
.home-services {}
.category-card {}
.products-grid {}
.product-miniature {}
.product-detail {}
.product-buy-row {}
```

Expected: the storefront feels consistent across homepage, listings, and product pages on desktop and mobile.

- [ ] **Step 6: Clear caches and verify the main storefront pages**

Run:

```bash
./scripts/clear-prestashop-cache.sh
php -l themes/flordeloto/templates/index.tpl
php -l themes/flordeloto/templates/catalog/listing/product-list.tpl
php -l themes/flordeloto/templates/catalog/listing/search.tpl
php -l themes/flordeloto/templates/catalog/product/product.tpl
```

Expected: cache clears and all templates lint cleanly.

- [ ] **Step 7: Manually verify homepage, one category, one search, and one product page**

Open these locally after cache clear:

- `http://localhost:8080/`
- one category URL from the navigation
- `http://localhost:8080/search`
- one product URL from the category listing

Expected: each page renders without major layout defects.

- [ ] **Step 8: Commit the template and storefront layout fixes**

Run:

```bash
git add themes/flordeloto/templates/index.tpl themes/flordeloto/templates/catalog/listing/product-list.tpl themes/flordeloto/templates/catalog/listing/search.tpl themes/flordeloto/templates/catalog/product/product.tpl themes/flordeloto/assets/css/theme.css
git commit -m "feat: complete flor de loto storefront pages"
```

Expected: commit succeeds.

---

### Task 4: Complete Starter Content And Theme Configuration

**Files:**
- Modify: `.worktrees/implementation/themes/flordeloto/config/theme.yml`
- Create: `.worktrees/implementation/docs/handoff/catalog-seed-checklist.md`

- [ ] **Step 1: Document the expected starter catalog and homepage content**

Create `.worktrees/implementation/docs/handoff/catalog-seed-checklist.md` with this exact content:

```markdown
# Catalog Seed Checklist

## Main Categories

- Ramos
- Rosas
- Orquideas
- Plantas
- Bodas
- Funerales

## Homepage Coverage

- Hero image and copy
- Featured category cards
- Featured products from `displayHome`
- Services section

## Starter Product Coverage

- At least 4 bouquet products
- At least 3 rose products
- At least 2 orchid products
- At least 3 plant products
- At least 2 wedding or event examples
- At least 2 funeral arrangements

## Review Notes

- Category IDs confirmed in local install:
- Featured products module populated:
- Missing images:
- Missing descriptions:
- Prices reviewed:
```

- [ ] **Step 2: Verify the category IDs used by the theme match the local catalog**

Open `Catalog > Categories` in Back Office and compare the local IDs or URLs to the category links used in:

- `themes/flordeloto/templates/index.tpl`
- `themes/flordeloto/templates/_partials/header.tpl`
- `themes/flordeloto/templates/_partials/footer.tpl`

Expected: each storefront category link points to the intended local category.

- [ ] **Step 3: Populate or correct starter content in Back Office**

Use Back Office to ensure these minimums are true:

- six main categories exist
- homepage featured products show real seeded products
- each required category has enough products to avoid an empty store feel
- product cover images and short descriptions are present

Expected: the catalog seed checklist can be filled with real local outcomes.

- [ ] **Step 4: Align theme module expectations only if the local homepage requires it**

If the homepage depends on a module enabled by the theme, verify `themes/flordeloto/config/theme.yml` still lists only the needed modules:

```yml
to_enable:
  - ps_categorytree
  - ps_contactinfo
  - ps_customtext
  - ps_featuredproducts
  - ps_imageslider
  - ps_mainmenu
```

Expected: no unnecessary module list changes are introduced.

- [ ] **Step 5: Update the catalog seed checklist with the actual local outcome**

Write the confirmed category IDs, missing assets if any, and the final seeded product coverage counts into `docs/handoff/catalog-seed-checklist.md`.

Expected: the file reflects the actual local state, not an aspirational one.

- [ ] **Step 6: Commit the content and config alignment**

Run:

```bash
git add themes/flordeloto/config/theme.yml docs/handoff/catalog-seed-checklist.md
git commit -m "docs: record flor de loto catalog seed state"
```

Expected: commit succeeds. If `theme.yml` was unchanged, commit only the checklist file.

---

### Task 5: Final Verification And Handoff Alignment

**Files:**
- Modify: `.worktrees/implementation/docs/handoff/back-office.md`
- Modify: `.worktrees/implementation/docs/handoff/production-deployment.md`
- Modify: `.worktrees/implementation/docs/handoff/local-review-checklist.md`
- Modify: `.worktrees/implementation/docs/handoff/catalog-seed-checklist.md`

- [ ] **Step 1: Update the Back Office handoff guide to match the final store state**

Edit `docs/handoff/back-office.md` so it reflects the final editable areas that were actually used during completion.

Make sure it still includes these sections:

```markdown
## Editable Areas
## Content Editing Rules
## Temporary Admin
```

Expected: no instruction points the client to code for normal catalog updates.

- [ ] **Step 2: Update deployment notes to reflect verified local readiness and the production blocker**

Edit `docs/handoff/production-deployment.md` so it states clearly that local verification is complete if and only if the checklist was completed, while production upload still requires MySQL data.

Expected: the file distinguishes local completion from production readiness.

- [ ] **Step 3: Run the final local verification pass**

Open and check these flows in the browser:

- homepage on desktop
- homepage on mobile viewport
- one category page
- one product page
- add one product to cart
- cart page
- Back Office login
- `Catalog > Products`
- `Catalog > Categories`

Expected: each flow works at a basic review level with no major visual or functional blocker.

- [ ] **Step 4: Record the final outcomes in the handoff docs**

Update these files with the final results:

- `docs/handoff/local-review-checklist.md`
- `docs/handoff/catalog-seed-checklist.md`

Expected: both documents contain real final notes instead of blanks.

- [ ] **Step 5: Run final repository checks**

Run:

```bash
git status --short
git diff -- docs/handoff/back-office.md docs/handoff/production-deployment.md docs/handoff/local-review-checklist.md docs/handoff/catalog-seed-checklist.md themes/flordeloto/config/theme.yml themes/flordeloto/templates/index.tpl themes/flordeloto/templates/_partials/header.tpl themes/flordeloto/templates/_partials/footer.tpl themes/flordeloto/templates/catalog/listing/product-list.tpl themes/flordeloto/templates/catalog/listing/search.tpl themes/flordeloto/templates/catalog/product/product.tpl themes/flordeloto/assets/css/theme.css themes/flordeloto/assets/js/theme.js
rg -n "ftpupload.net.*password|password.*ftpupload.net|admin password|mysql password" . --glob '!vendor/**' --glob '!.git/**' --glob '!.superpowers/**'
```

Expected: the diff shows only intended storefront and handoff changes, and the secret scan shows no committed real credentials.

- [ ] **Step 6: Commit the final handoff alignment**

Run:

```bash
git add docs/handoff/back-office.md docs/handoff/production-deployment.md docs/handoff/local-review-checklist.md docs/handoff/catalog-seed-checklist.md themes/flordeloto/config/theme.yml themes/flordeloto/templates/index.tpl themes/flordeloto/templates/_partials/header.tpl themes/flordeloto/templates/_partials/footer.tpl themes/flordeloto/templates/catalog/listing/product-list.tpl themes/flordeloto/templates/catalog/listing/search.tpl themes/flordeloto/templates/catalog/product/product.tpl themes/flordeloto/assets/css/theme.css themes/flordeloto/assets/js/theme.js
git commit -m "docs: finalize flor de loto local handoff"
```

Expected: commit succeeds.
