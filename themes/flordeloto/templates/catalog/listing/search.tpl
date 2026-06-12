{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <header id="js-product-list-header" class="section-heading listing-page__header listing-page__header--search">
    <p class="eyebrow">Busqueda en catalogo</p>
    <h1>{l s='Resultados de busqueda' d='Shop.Theme.Catalog'}</h1>
    {if $search_string}
      <p class="listing-page__search-query">{l s='Has buscado:' d='Shop.Theme.Catalog'} <strong>{$search_string|escape:'html':'UTF-8'}</strong></p>
    {else}
      <p class="listing-page__search-query">{l s='Explora los productos disponibles y refina tu consulta cuando lo necesites.' d='Shop.Theme.Catalog'}</p>
    {/if}
  </header>
{/block}

{block name='error_content'}
  <h2 id="product-search-no-matches">{l s='No hemos encontrado resultados para tu busqueda' d='Shop.Theme.Catalog'}</h2>
  <p>{l s='Prueba con otro termino, una flor concreta o una ocasion especial.' d='Shop.Theme.Catalog'}</p>
{/block}
