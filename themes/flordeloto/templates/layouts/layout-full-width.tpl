<!DOCTYPE html>
<html lang="{$language.locale}">
<head>
  {block name='head'}{include file='_partials/head.tpl'}{/block}
  {block name='stylesheets'}{include file='_partials/stylesheets.tpl'}{/block}
</head>
<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
  {hook h='displayAfterBodyOpeningTag'}

  <header id="header">
    {include file='_partials/header.tpl'}
  </header>

  <main id="wrapper">
    {block name='notifications'}{include file='_partials/notifications.tpl'}{/block}
    <div id="content-wrapper" class="js-content-wrapper">
      {block name='content'}{/block}
    </div>
  </main>

  {include file='_partials/footer.tpl'}

  {block name='javascript_bottom'}{include file='_partials/javascript.tpl'}{/block}
  {hook h='displayBeforeBodyClosingTag'}
</body>
</html>
