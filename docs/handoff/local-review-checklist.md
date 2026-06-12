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
- Homepage: `http://localhost:8080/` returned `200 OK`; header, hero, featured categories, and product cards are present in the rendered HTML. Source includes duplicated `theme.css` and `theme.js` asset tags.
- Mobile menu: `.menu-toggle` and `#mobileMenu` markup are present on storefront pages, and `themes/flordeloto/assets/js/theme.js` toggles `aria-expanded` and `hidden`; interactive behavior was not visually exercised in a browser.
- Category listing: `http://localhost:8080/3-ramos` returned `200 OK` and rendered two product cards with image, title, and price.
- Product page: `http://localhost:8080/funerales/7-corona-lisboa.html` returned `200 OK` and includes product image, `120,00 EUR` price, short description, quantity input, and add-to-cart button.
- Cart: `http://localhost:8080/cart?action=show` returned a storefront `404`; posting the product form to `http://localhost:8080/carrito` created a cart page with one item, so the cart route exists under the localized slug.
- Back Office products: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
- Back Office categories: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
- Back Office CMS: Not visually verified; no browser automation or confirmed local admin URL/credentials were available during this audit pass.
