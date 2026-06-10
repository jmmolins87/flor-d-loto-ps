{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="section listing-page">
    <div class="container">
      <div class="section-heading">
        <h1>{$page.meta.title|escape:'html':'UTF-8'}</h1>
        {if $listing.description}
          <div class="category-description">{$listing.description nofilter}</div>
        {/if}
      </div>

      {if $listing.products|count > 0}
        <div class="products-grid">
          {foreach from=$listing.products item=product}
            <article class="product-card">
              <a href="{$product.url|escape:'html':'UTF-8'}">
                <div class="product-image">
                  {if isset($product.cover.bySize.home_default.url)}
                    <img
                      src="{$product.cover.bySize.home_default.url|escape:'html':'UTF-8'}"
                      alt="{$product.name|escape:'html':'UTF-8'}"
                      loading="lazy"
                    >
                  {/if}
                  <span>{l s='Ver producto' d='Shop.Theme.Catalog'}</span>
                </div>
                <div class="product-info">
                  <h2>{$product.name|escape:'html':'UTF-8'}</h2>
                  <p class="product-price">{$product.price|escape:'html':'UTF-8'}</p>
                </div>
              </a>
            </article>
          {/foreach}
        </div>

        {include file='_partials/pagination.tpl' pagination=$listing.pagination}
      {else}
        <div class="empty-state">
          <h2>{l s='No hay productos disponibles' d='Shop.Theme.Catalog'}</h2>
          <p>{l s='Pronto tendremos nuevas flores en esta categoria.' d='Shop.Theme.Catalog'}</p>
        </div>
      {/if}
    </div>
  </section>
{/block}
