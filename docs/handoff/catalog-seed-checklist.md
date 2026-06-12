# Catalog Seed Checklist

## Main Categories

- Planned storefront categories referenced by the theme: `2 Inicio/Tienda`, `3 Ramos`, `4 Rosas`, `5 Orquideas`, `6 Plantas`, `7 Bodas`, `8 Funerales`.
- Verification method: local database query against `ps_category` and `ps_category_lang`, plus template review of `themes/flordeloto/templates/index.tpl`, `themes/flordeloto/templates/_partials/header.tpl`, and `themes/flordeloto/templates/_partials/footer.tpl`.
- Actual local outcome: verified. Current IDs match the theme links exactly.
- Category state observed locally:
  - `2 Inicio` is active and acts as the parent storefront category used for the `Tienda` link.
  - `3 Ramos`, `4 Rosas`, `5 Orquideas`, `6 Plantas`, `7 Bodas`, and `8 Funerales` are active child categories under `2 Inicio`.

## Homepage Coverage

- Planned homepage category coverage: hero CTA to `2`, featured category cards for `3 Ramos`, `4 Rosas`, `6 Plantas`, and `8 Funerales`.
- Planned homepage module coverage: only the `displayHome` content that the local homepage actually renders.
- Verification method: source review of `themes/flordeloto/templates/index.tpl`, local hook/module query, and HTTP fetch of `http://localhost:8080/`.
- Actual local outcome:
  - Verified homepage category links target existing local categories.
  - Verified rendered homepage includes `ps_imageslider`, `ps_customtext`, and `ps_featuredproducts` content. `ps_banner` also renders a sale banner.
  - `ps_mainmenu`, `ps_categorytree`, and `ps_contactinfo` are not rendered in the current custom theme shell or homepage, but they remain in `themes/flordeloto/config/theme.yml` module list.

## Starter Product Coverage

- Planned minimum coverage: each main sellable category used in navigation/homepage should have at least one starter product.
- Verification method: local database query against `ps_category_product`, `ps_product`, and `ps_product_lang`.
- Actual local outcome:
  - `3 Ramos`: 2 products (`Ramo Armonia`, `Ramo Primavera`)
  - `4 Rosas`: 1 product (`Rosas Te Amo`)
  - `5 Orquideas`: 1 product (`Orquidea Phalaenopsis`)
  - `6 Plantas`: 1 product (`Olivo Copa`)
  - `7 Bodas`: 1 product (`Ramo de Novia`)
  - `8 Funerales`: 1 product (`Corona Lisboa`)
  - `2 Inicio`: 0 directly assigned products; acceptable as the parent `Tienda` category because child category coverage exists.
- No direct Back Office mutation was performed in this task pass. The existing local seed already satisfies minimum starter coverage for the linked sellable categories.

## Review Notes

- Back Office was not used interactively from this environment. Verification relied on local database queries, rendered HTTP output, and theme template inspection.
- Because no browser automation or confirmed admin session was used, this checklist records observed local state rather than claiming manual Back Office edits.
- If future content seeding changes category IDs or removes starter products, update the hardcoded category links in `index.tpl`, `header.tpl`, and `footer.tpl` to match the live catalog.
