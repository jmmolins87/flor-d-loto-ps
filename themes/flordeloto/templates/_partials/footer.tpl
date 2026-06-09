<footer id="footer" class="site-footer">
  <div class="container site-footer__inner">
    <section class="site-footer__brand" aria-label="Flor de Loto">
      <a class="site-footer__logo" href="{$urls.pages.index|escape:'html':'UTF-8'}" aria-label="{$shop.name|escape:'html':'UTF-8'}">
        <img src="{$urls.theme_assets|escape:'html':'UTF-8'}img/logo-loto-horizontal.png" alt="{$shop.name|escape:'html':'UTF-8'}" loading="lazy">
      </a>
      <p>Floristeria en Segovia especializada en arreglos florales para cada ocasion, regalos y eventos.</p>
    </section>

    <nav class="site-footer__links" aria-label="Comprar por categoria">
      <h2>Tienda</h2>
      <a href="{$link->getCategoryLink(3)|escape:'html':'UTF-8'}">Ramos</a>
      <a href="{$link->getCategoryLink(4)|escape:'html':'UTF-8'}">Rosas</a>
      <a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}">Plantas</a>
      <a href="{$link->getCategoryLink(8)|escape:'html':'UTF-8'}">Funerales</a>
    </nav>

    <address class="site-footer__contact">
      <h2>Contacto</h2>
      <span>Segovia, Espana</span>
      <a href="mailto:info@flordeloto.es">info@flordeloto.es</a>
      <a href="https://wa.me/34000000000" rel="noopener noreferrer">WhatsApp</a>
    </address>
  </div>

  <p class="site-footer__copyright">&copy; {$smarty.now|date_format:'%Y'|escape:'html':'UTF-8'} {$shop.name|escape:'html':'UTF-8'}</p>
</footer>
