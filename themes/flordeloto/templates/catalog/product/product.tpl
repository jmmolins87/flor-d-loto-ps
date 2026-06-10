{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="section product-page">
    <div class="container product-layout">
      <div class="product-gallery">
        {if $product.cover && isset($product.cover.bySize.large_default.url)}
          <img
            class="product-main-image"
            src="{$product.cover.bySize.large_default.url|escape:'html':'UTF-8'}"
            alt="{$product.cover.legend|default:$product.name|escape:'html':'UTF-8'}"
          >
        {/if}
      </div>

      <div class="product-summary">
        <p class="eyebrow">{l s='Flor de Loto' d='Shop.Theme.Catalog'}</p>
        <h1>{$product.name|escape:'html':'UTF-8'}</h1>

        <div class="product-detail-price">
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}
        </div>

        {if $product.description_short}
          <div class="product-description">{$product.description_short nofilter}</div>
        {/if}

        {if $product.is_customizable && count($product.customizations.fields)}
          {block name='product_customization'}
            {include file='catalog/_partials/product-customization.tpl' customizations=$product.customizations}
          {/block}
        {/if}

        <div class="product-actions js-product-actions">
          {block name='product_buy'}
            <form action="{$urls.pages.cart|escape:'html':'UTF-8'}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token|escape:'html':'UTF-8'}">
              <input type="hidden" name="id_product" value="{$product.id|escape:'html':'UTF-8'}" id="product_page_product_id">
              <input type="hidden" name="id_customization" value="{$product.id_customization|escape:'html':'UTF-8'}" id="product_customization_id" class="js-product-customization-id">
              <input type="hidden" name="add" value="1">

              {block name='product_variants'}
                {include file='catalog/_partials/product-variants.tpl'}
              {/block}

              {block name='product_discounts'}
                {include file='catalog/_partials/product-discounts.tpl'}
              {/block}

              <div class="product-buy-row">
                {block name='product_add_to_cart'}
                  {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}
              </div>

              {block name='product_additional_info'}
                {include file='catalog/_partials/product-additional-info.tpl'}
              {/block}

              {block name='product_refresh'}{/block}
            </form>
          {/block}
        </div>

        {block name='hook_display_reassurance'}
          {hook h='displayReassurance'}
        {/block}
      </div>
    </div>

    {if $product.description}
      <div class="container product-long-description">
        <h2>{l s='Descripcion' d='Shop.Theme.Catalog'}</h2>
        {$product.description nofilter}
      </div>
    {/if}
  </section>
{/block}
