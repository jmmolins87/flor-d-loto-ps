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
        <div class="product-detail-price">{$product.price|escape:'html':'UTF-8'}</div>

        {if $product.description_short}
          <div class="product-description">{$product.description_short nofilter}</div>
        {/if}

        <form action="{$urls.pages.cart|escape:'html':'UTF-8'}" method="post" id="add-to-cart-or-refresh">
          <input type="hidden" name="token" value="{$static_token|escape:'html':'UTF-8'}">
          <input type="hidden" name="id_product" value="{$product.id_product|default:$product.id|escape:'html':'UTF-8'}" id="product_page_product_id">
          <input type="hidden" name="id_customization" value="{$product.id_customization|default:0|escape:'html':'UTF-8'}" id="product_customization_id" class="js-product-customization-id">
          <input type="hidden" name="add" value="1">

          <div class="product-buy-row">
            <input
              class="quantity-input"
              type="number"
              name="qty"
              id="quantity_wanted"
              value="{$product.quantity_wanted|default:$product.minimal_quantity|escape:'html':'UTF-8'}"
              min="{$product.minimal_quantity|escape:'html':'UTF-8'}"
              inputmode="numeric"
              pattern="[0-9]*"
              aria-label="{l s='Cantidad' d='Shop.Theme.Actions'}"
            >
            <button
              class="btn btn-primary"
              type="submit"
              name="add"
              {if !$product.add_to_cart_url || $product.quantity <= 0}disabled{/if}
            >
              {l s='Anadir al carrito' d='Shop.Theme.Actions'}
            </button>
          </div>
        </form>
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
