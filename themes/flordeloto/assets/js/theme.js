document.addEventListener('DOMContentLoaded', function () {
  var menuToggle = document.querySelector('.menu-toggle');
  var mobileMenu = document.getElementById('mobileMenu');

  if (!menuToggle || !mobileMenu) {
    return;
  }

  menuToggle.setAttribute('aria-expanded', String(!mobileMenu.hidden));

  menuToggle.addEventListener('click', function () {
    var isExpanded = menuToggle.getAttribute('aria-expanded') === 'true';

    menuToggle.setAttribute('aria-expanded', String(!isExpanded));
    mobileMenu.hidden = isExpanded;
  });
});
