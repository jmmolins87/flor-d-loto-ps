{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="home-hero" style="background-image: url('{$urls.theme_assets|escape:'html':'UTF-8'}img/ramo-armonia_1.jpg');">
    <div class="container home-hero__content">
      <p class="home-hero__eyebrow">Floristeria en Segovia</p>
      <h1>Flores frescas para cada ocasion</h1>
      <p>Ramos, plantas y arreglos florales preparados con mimo para regalar, decorar y acompanar momentos importantes.</p>
      <div class="home-hero__actions">
        <a class="btn btn-primary" href="{$link->getCategoryLink(2)|escape:'html':'UTF-8'}">Comprar flores</a>
        <a class="btn btn-secondary" href="{$urls.pages.contact|escape:'html':'UTF-8'}">Contactar</a>
      </div>
    </div>
  </section>

  <section class="featured-categories" aria-labelledby="featured-categories-title">
    <div class="container">
      <h2 id="featured-categories-title">Elige tu flor ideal</h2>
      <div class="featured-categories__grid">
        <a class="category-card" href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}" style="background-image: url('{$urls.theme_assets|escape:'html':'UTF-8'}img/category-ramos.jpg');">
          <span>Ramos</span>
        </a>
        <a class="category-card" href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}" style="background-image: url('{$urls.theme_assets|escape:'html':'UTF-8'}img/category-rosas.jpg');">
          <span>Rosas</span>
        </a>
        <a class="category-card" href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}" style="background-image: url('{$urls.theme_assets|escape:'html':'UTF-8'}img/category-plantas.jpg');">
          <span>Plantas</span>
        </a>
        <a class="category-card" href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}" style="background-image: url('{$urls.theme_assets|escape:'html':'UTF-8'}img/category-funerales.jpg');">
          <span>Funerales</span>
        </a>
      </div>
    </div>
  </section>

  <section class="home-modules">
    <div class="container">
      {hook h='displayHome'}
    </div>
  </section>

  <section class="home-services" aria-labelledby="home-services-title">
    <div class="container">
      <h2 id="home-services-title">Servicios florales</h2>
      <div class="home-services__grid">
        <article class="service-card">
          <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/icon-arte-floral.svg" alt="" loading="lazy" aria-hidden="true">
          <h3>Arte floral</h3>
          <p>Composiciones cuidadas para regalos, celebraciones y espacios con personalidad.</p>
        </article>
        <article class="service-card">
          <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/icon-entrega-local.svg" alt="" loading="lazy" aria-hidden="true">
          <h3>Entrega local</h3>
          <p>Reparto en Segovia y alrededores para que tus flores lleguen frescas y puntuales.</p>
        </article>
        <article class="service-card">
          <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/icon-asesoramiento.svg" alt="" loading="lazy" aria-hidden="true">
          <h3>Asesoramiento</h3>
          <p>Te ayudamos a elegir flores, colores y formatos segun el mensaje que quieras enviar.</p>
        </article>
      </div>
    </div>
  </section>
{/block}
