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

### Post-shell retest after `2c1d045d`
- Cache clear: `./scripts/clear-prestashop-cache.sh` completed successfully for both `prod` and `dev`; output included PHP 8.4/8.5 deprecation noise from the legacy PrestaShop stack, but both cache clear steps ended with `[OK]`.
- Template lint: `php -l themes/flordeloto/templates/_partials/header.tpl` and `php -l themes/flordeloto/templates/_partials/footer.tpl` both returned `No syntax errors detected`.
- Homepage retest: `http://localhost:8080/` returned `200 OK` after the cache clear. Rendered HTML still includes the shell elements added in Task 2: `.site-header`, the cart link to `http://localhost:8080/carrito`, `.menu-toggle` with `aria-controls="mobileMenu" aria-expanded="false"`, and `<nav id="mobileMenu" ... hidden>`.
- Mobile menu evidence: Post-shell markup and JS wiring are present after the retest. `themes/flordeloto/assets/js/theme.js` still selects `.menu-toggle` and `#mobileMenu` and toggles `aria-expanded` plus the `hidden` state. Interactive open/close behavior was not visually exercised because no browser automation was available in this pass.
- Cart access retest: `http://localhost:8080/carrito` returned `200 OK` after the cache clear. The rendered HTML includes `aria-current="page"` on the header cart link, `.cart-grid`, and `.cart-overview js-cart` with refresh URL `//localhost:8080/carrito?ajax=1&action=refresh`, which confirms the localized cart route remained reachable after the shell change.
- Other front-office manual checks: Category, product, and add-to-cart visual/manual flows were not re-exercised after `2c1d045d` in this documentation-only pass.
- Back Office products: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
- Back Office categories: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
- Back Office CMS: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
