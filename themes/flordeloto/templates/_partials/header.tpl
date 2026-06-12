{assign var=current_category_id value=$category.id|default:0}

<div class="site-header__inner">
  <a class="site-header__logo" href="{$urls.pages.index|escape:'html':'UTF-8'}" aria-label="{$shop.name|escape:'html':'UTF-8'}">
    <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/logo-loto-horizontal.png" alt="{$shop.name|escape:'html':'UTF-8'}" loading="eager">
  </a>

  <nav class="site-nav" aria-label="Navegacion principal">
    <a href="{$urls.pages.index|escape:'html':'UTF-8'}"{if $page.page_name == 'index'} aria-current="page"{/if}>Inicio</a>
    <a href="{$link->getCategoryLink(2)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 2} aria-current="page"{/if}>Tienda</a>
    <a href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 3} aria-current="page"{/if}>Ramos</a>
    <a href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 4} aria-current="page"{/if}>Rosas</a>
    <a href="{$link->getCategoryLink(5)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 5} aria-current="page"{/if}>Orquideas</a>
    <a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 6} aria-current="page"{/if}>Plantas</a>
    <a href="{$link->getCategoryLink(7)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 7} aria-current="page"{/if}>Bodas</a>
    <a href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 8} aria-current="page"{/if}>Funerales</a>
    <a href="{$urls.pages.contact|escape:'html':'UTF-8'}"{if $page.page_name == 'contact'} aria-current="page"{/if}>Contacto</a>
  </nav>

  <div class="site-header__actions">
    <a class="site-header__action" href="{$urls.pages.search|escape:'html':'UTF-8'}">Buscar</a>
    <a class="site-header__action" href="{$urls.pages.my_account|escape:'html':'UTF-8'}">Cuenta</a>
    <a class="site-header__action site-header__action--cart" href="{$urls.pages.cart|escape:'html':'UTF-8'}"{if $page.page_name == 'cart'} aria-current="page"{/if}>
      Carrito
      {if isset($cart.products_count) && $cart.products_count > 0}
        <span class="cart-count" aria-hidden="true">{$cart.products_count|escape:'html':'UTF-8'}</span>
        <span class="visually-hidden">, {$cart.products_count|escape:'html':'UTF-8'} producto{if $cart.products_count != 1}s{/if} en el carrito</span>
      {/if}
    </a>
    <button class="menu-toggle" type="button" aria-controls="mobileMenu" aria-expanded="false">
      Menu
    </button>
  </div>
</div>

<nav id="mobileMenu" class="mobile-menu" aria-label="Navegacion movil" hidden>
  <a href="{$urls.pages.index|escape:'html':'UTF-8'}"{if $page.page_name == 'index'} aria-current="page"{/if}>Inicio</a>
  <a href="{$link->getCategoryLink(2)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 2} aria-current="page"{/if}>Tienda</a>
  <a href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 3} aria-current="page"{/if}>Ramos</a>
  <a href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 4} aria-current="page"{/if}>Rosas</a>
  <a href="{$link->getCategoryLink(5)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 5} aria-current="page"{/if}>Orquideas</a>
  <a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 6} aria-current="page"{/if}>Plantas</a>
  <a href="{$link->getCategoryLink(7)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 7} aria-current="page"{/if}>Bodas</a>
  <a href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}"{if $page.page_name == 'category' && $current_category_id == 8} aria-current="page"{/if}>Funerales</a>
  <a href="{$urls.pages.contact|escape:'html':'UTF-8'}"{if $page.page_name == 'contact'} aria-current="page"{/if}>Contacto</a>
</nav>
