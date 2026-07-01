'use strict';

function initApp() {
  initNavigation();
  initAnimations();
  initCarousel();
  initCounter();
  initFavicon();
  initFaq();
  initSearch();
  initScrollHeader();
  initBackToTop();
  initSmoothScroll();
  initLazyLoading();
  console.log('%c Academia en Caja %c v1.0 ', 'background:#FFEA00;color:#000;padding:4px 8px;font-weight:bold', 'background:#000;color:#FFEA00;padding:4px 8px');
}

document.addEventListener('DOMContentLoaded', initApp);

function initScrollHeader() {
  const navbar = document.querySelector('.navbar');
  if (!navbar) return;
  let lastScroll = 0;
  window.addEventListener('scroll', () => {
    const current = window.scrollY;
    if (current > 100) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
    if (current > lastScroll && current > 300) {
      navbar.classList.add('navbar-hidden');
    } else {
      navbar.classList.remove('navbar-hidden');
    }
    lastScroll = current;
  }, { passive: true });
}

function initBackToTop() {
  const btn = document.createElement('button');
  btn.className = 'back-to-top';
  btn.innerHTML = '<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 15l-6-6-6 6"/></svg>';
  btn.setAttribute('aria-label', 'Volver arriba');
  Object.assign(btn.style, {
    position: 'fixed', bottom: '30px', right: '30px', width: '48px', height: '48px',
    backgroundColor: '#FFEA00', color: '#000', border: 'none', borderRadius: '50%',
    cursor: 'pointer', opacity: '0', visibility: 'hidden', transition: 'all 0.3s',
    zIndex: '999', display: 'flex', alignItems: 'center', justifyContent: 'center',
    boxShadow: '0 2px 10px rgba(0,0,0,0.2)'
  });
  document.body.appendChild(btn);
  window.addEventListener('scroll', () => {
    const show = window.scrollY > 500;
    btn.style.opacity = show ? '1' : '0';
    btn.style.visibility = show ? 'visible' : 'hidden';
  }, { passive: true });
  btn.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));
}

function initSmoothScroll() {
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', e => {
      const id = anchor.getAttribute('href');
      if (id === '#') return;
      const target = document.querySelector(id);
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });
}

function initLazyLoading() {
  if ('loading' in HTMLImageElement.prototype) {
    document.querySelectorAll('img[loading="lazy"]').forEach(img => {
      img.src = img.dataset.src || img.src;
    });
  } else {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src;
          observer.unobserve(img);
        }
      });
    });
    document.querySelectorAll('img[data-src]').forEach(img => observer.observe(img));
  }
}

function initFavicon() {
  const link = document.querySelector('link[rel="icon"]');
  if (!link) return;
  const path = getComputedStyle(document.documentElement).getPropertyValue('--brand-favicon').trim().replace(/^url\(['"]?|['"]?\)$/g, '').replace(/^['"]|['"]$/g, '');
  if (path) link.href = path;
}
