document.addEventListener('DOMContentLoaded', function () {
  if (document.documentElement.dataset.flordelotoThemeInitialized === 'true') {
    return;
  }

  document.documentElement.dataset.flordelotoThemeInitialized = 'true';

  var menuToggle = document.querySelector('.menu-toggle');
  var mobileMenu = document.getElementById('mobileMenu');
  var desktopBreakpoint = window.matchMedia('(min-width: 1051px)');

  if (!menuToggle || !mobileMenu) {
    return;
  }

  menuToggle.setAttribute('aria-expanded', String(!mobileMenu.hidden));

  function closeMenu() {
    var shouldRestoreFocus = mobileMenu.contains(document.activeElement);

    menuToggle.setAttribute('aria-expanded', 'false');
    mobileMenu.hidden = true;

    if (shouldRestoreFocus) {
      menuToggle.focus();
    }
  }

  function syncMenuForViewport(event) {
    if (event.matches) {
      closeMenu();
    }
  }

  menuToggle.addEventListener('click', function () {
    var isExpanded = menuToggle.getAttribute('aria-expanded') === 'true';

    menuToggle.setAttribute('aria-expanded', String(!isExpanded));
    mobileMenu.hidden = isExpanded;
  });

  document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') {
      closeMenu();
    }
  });

  document.addEventListener('click', function (event) {
    if (mobileMenu.hidden) {
      return;
    }

    if (!mobileMenu.contains(event.target) && !menuToggle.contains(event.target)) {
      closeMenu();
    }
  });

  if (typeof desktopBreakpoint.addEventListener === 'function') {
    desktopBreakpoint.addEventListener('change', syncMenuForViewport);
  } else if (typeof desktopBreakpoint.addListener === 'function') {
    desktopBreakpoint.addListener(syncMenuForViewport);
  }
});
