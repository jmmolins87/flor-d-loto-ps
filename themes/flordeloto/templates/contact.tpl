{extends file='layouts/layout-full-width.tpl'}

{block name='content'}
  <section class="contact-page">
    <div class="section-heading">
      <p class="eyebrow">Estamos aqui</p>
      <h1>Contacto</h1>
      <p class="featured-categories__intro">Cualquier consulta, encargo o sugerencia. Responderemos lo antes posible.</p>
    </div>
    <div class="contact-page__form">
      {hook h='displayContactContent'}
    </div>
  </section>
{/block}
