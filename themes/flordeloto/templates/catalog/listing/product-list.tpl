{extends file='layouts/layout-full-width.tpl'}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}
{/block}

{block name='content'}
  <section id="main" class="section listing-page">
    <div class="container">
      {block name='product_list_header'}
        <header id="js-product-list-header" class="section-heading listing-page__header">
          <p class="eyebrow">Coleccion floral</p>
          <h1>{$listing.label|default:$page.meta.title|escape:'html':'UTF-8'}</h1>
          {if isset($listing.description) && $listing.description}
            <div class="category-description">{$listing.description nofilter}</div>
          {/if}
        </header>
      {/block}

      {block name='subcategory_list'}
        {if isset($subcategories) && $subcategories|@count > 0}
          {include file='catalog/_partials/subcategories.tpl' subcategories=$subcategories}
        {/if}
      {/block}

      {hook h='displayHeaderCategory'}

      <section id="products" class="listing-page__products">
        {if $listing.products|count}
          {block name='product_list_top'}
            {include file='catalog/_partials/products-top.tpl' listing=$listing}
          {/block}

          {block name='product_list_active_filters'}
            {if $listing.rendered_active_filters}
              <div class="listing-page__filters hidden-sm-down">
                {$listing.rendered_active_filters nofilter}
              </div>
            {/if}
          {/block}

          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-12 col-sm-6 col-xl-4"}
          {/block}

          {block name='product_list_bottom'}
            {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
          {/block}
        {else}
          <div id="js-product-list-top"></div>

          <div id="js-product-list" class="empty-state">
            {capture assign="errorContent"}
              {block name='error_content'}
                <h2>{l s='No hay productos disponibles todavia' d='Shop.Theme.Catalog'}</h2>
                <p>{l s='Pronto incorporaremos nuevas flores y composiciones a esta coleccion.' d='Shop.Theme.Catalog'}</p>
              {/block}
            {/capture}

            {include file='errors/not-found.tpl' errorContent=$errorContent}
          </div>

          <div id="js-product-list-bottom"></div>
        {/if}
      </section>

      {block name='product_list_footer'}{/block}

      {hook h='displayFooterCategory'}
    </div>
  </section>
{/block}
