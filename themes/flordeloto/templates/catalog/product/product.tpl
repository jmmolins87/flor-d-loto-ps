{extends file='layouts/layout-full-width.tpl'}

{assign var=product_category value=$category}
{assign var=product_category_id value=$category.id|default:0}
{assign var=product_category_name value=$category.name|default:''}
{assign var=category value=['id' => $product_category_id, 'name' => $product_category_name]}

{block name='content'}
  <section id="main" class="section product-page">
    <meta content="{$product.url|escape:'html':'UTF-8'}">

    <div class="container product-layout js-product-container">
      <div class="product-gallery">
        {include file='catalog/_partials/product-flags.tpl'}

        {block name='product_cover_thumbnails'}
          {include file='catalog/_partials/product-cover-thumbnails.tpl'}
        {/block}
      </div>

      <div class="product-summary">
        <p class="eyebrow">{if $product_category_name}{$product_category_name|escape:'html':'UTF-8'}{else}{l s='Flor de Loto' d='Shop.Theme.Catalog'}{/if}</p>
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
              {block name='product_variants'}
                {include file='catalog/_partials/product-variants.tpl'}
              {/block}

              {block name='product_pack'}
                {if $packItems}
                  <section class="product-pack">
                    <h2>{l s='Este pack contiene' d='Shop.Theme.Catalog'}</h2>
                    {foreach from=$packItems item='product_pack'}
                      {block name='product_miniature'}
                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                      {/block}
                    {/foreach}
                  </section>
                {/if}
              {/block}

              {block name='product_discounts'}
                {include file='catalog/_partials/product-discounts.tpl'}
              {/block}

              {block name='product_add_to_cart'}
                {include file='catalog/_partials/product-add-to-cart.tpl'}
              {/block}

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

    <div class="container product-page__details">
      {if $product.description}
        <section class="product-long-description product-page__panel">
          <h2>{l s='Descripcion' d='Shop.Theme.Catalog'}</h2>
          {$product.description nofilter}
        </section>
      {/if}

      <section class="product-page__panel product-page__panel--details">
        <h2>{l s='Detalles del producto' d='Shop.Theme.Catalog'}</h2>
        {block name='product_details'}
          {include file='catalog/_partials/product-details.tpl'}
        {/block}
      </section>

      {if $product.attachments}
        <section class="product-page__panel product-attachments">
          <h2>{l s='Archivos adjuntos' d='Shop.Theme.Catalog'}</h2>
          {foreach from=$product.attachments item=attachment}
            <article class="product-attachments__item">
              <h3><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name|escape:'html':'UTF-8'}</a></h3>
              {if $attachment.description}
                <p>{$attachment.description|escape:'html':'UTF-8'}</p>
              {/if}
            </article>
          {/foreach}
        </section>
      {/if}

      {foreach from=$product.extraContent item=extra key=extraKey}
        <section class="product-page__panel product-extra-content {$extra.attr.class|default:''|escape:'html':'UTF-8'}" id="extra-{$extraKey|escape:'html':'UTF-8'}">
          <h2>{$extra.title|escape:'html':'UTF-8'}</h2>
          {$extra.content nofilter}
        </section>
      {/foreach}
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="container product-accessories">
          <div class="section-heading">
            <p class="eyebrow">Tambien te puede gustar</p>
            <h2>{l s='Completa tu eleccion' d='Shop.Theme.Catalog'}</h2>
          </div>
          <div class="products row">
            {foreach from=$accessories item='product_accessory' key='position'}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses='col-xs-12 col-sm-6 col-lg-4 col-xl-3'}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      <div class="container">
        {hook h='displayFooterProduct' product=$product category=$product_category}
      </div>
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}
  </section>
{/block}
