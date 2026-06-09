<div class="site-header__inner">
  <a class="site-header__logo" href="{$urls.pages.index|escape:'html':'UTF-8'}" aria-label="{$shop.name|escape:'html':'UTF-8'}">
    <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/logo-loto-horizontal.png" alt="{$shop.name|escape:'html':'UTF-8'}" loading="eager">
  </a>

  <nav class="site-nav" aria-label="Navegacion principal">
    <a href="{$urls.pages.index|escape:'html':'UTF-8'}">Inicio</a>
    <a href="{$link->getCategoryLink(2)|escape:'html':'UTF-8'}">Tienda</a>
    <a href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}">Ramos</a>
    <a href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}">Rosas</a>
    <a href="{$link->getCategoryLink(5)|escape:'html':'UTF-8'}">Orquideas</a>
    <a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}">Plantas</a>
    <a href="{$link->getCategoryLink(7)|escape:'html':'UTF-8'}">Bodas</a>
    <a href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}">Funerales</a>
    <a href="{$urls.pages.contact|escape:'html':'UTF-8'}">Contacto</a>
  </nav>

  <div class="site-header__actions">
    <a class="site-header__action" href="{$urls.pages.search|escape:'html':'UTF-8'}">Buscar</a>
    <a class="site-header__action" href="{$urls.pages.my_account|escape:'html':'UTF-8'}">Cuenta</a>
    <a class="site-header__action" href="{$urls.pages.cart|escape:'html':'UTF-8'}">
      Carrito
      {if isset($cart.products_count) && $cart.products_count > 0}
        <span class="cart-count">{$cart.products_count|escape:'html':'UTF-8'}</span>
      {/if}
    </a>
    <button class="menu-toggle" type="button" aria-controls="mobileMenu" aria-expanded="false">
      Menu
    </button>
  </div>
</div>

<nav id="mobileMenu" class="mobile-menu" aria-label="Navegacion movil">
  <a href="{$urls.pages.index|escape:'html':'UTF-8'}">Inicio</a>
  <a href="{$link->getCategoryLink(2)|escape:'html':'UTF-8'}">Tienda</a>
  <a href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}">Ramos</a>
  <a href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}">Rosas</a>
  <a href="{$link->getCategoryLink(5)|escape:'html':'UTF-8'}">Orquideas</a>
  <a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}">Plantas</a>
  <a href="{$link->getCategoryLink(7)|escape:'html':'UTF-8'}">Bodas</a>
  <a href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}">Funerales</a>
  <a href="{$urls.pages.contact|escape:'html':'UTF-8'}">Contacto</a>
</nav>
