'use strict';

function initNavigation() {
  const toggle = document.querySelector('.navbar-toggle');
  const menu = document.querySelector('.navbar-links');
  const overlay = document.createElement('div');

  if (!toggle || !menu) return;

  overlay.className = 'nav-overlay';
  Object.assign(overlay.style, {
    position: 'fixed', inset: '0', backgroundColor: 'rgba(0,0,0,0.5)',
    zIndex: '250', opacity: '0', visibility: 'hidden', transition: 'all 0.3s'
  });
  document.body.appendChild(overlay);

  function openMenu() {
    menu.classList.add('active');
    toggle.classList.add('active');
    overlay.style.opacity = '1';
    overlay.style.visibility = 'visible';
    document.body.style.overflow = 'hidden';
    toggle.setAttribute('aria-expanded', 'true');
  }

  function closeMenu() {
    menu.classList.remove('active');
    toggle.classList.remove('active');
    overlay.style.opacity = '0';
    overlay.style.visibility = 'hidden';
    document.body.style.overflow = '';
    toggle.setAttribute('aria-expanded', 'false');
  }

  toggle.addEventListener('click', () => {
    menu.classList.contains('active') ? closeMenu() : openMenu();
  });

  overlay.addEventListener('click', closeMenu);

  document.querySelectorAll('.navbar-links a').forEach(link => {
    link.addEventListener('click', closeMenu);
    const currentPath = window.location.pathname.split('/').pop();
    const linkPath = link.getAttribute('href');
    if (linkPath === currentPath || (currentPath === '' && linkPath === 'index.html')) {
      link.classList.add('active');
    }
  });

  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') closeMenu();
  });

  toggle.setAttribute('aria-expanded', 'false');
  toggle.setAttribute('aria-label', 'Abrir menú');
}
