'use strict';

function initAnimations() {
  const elements = document.querySelectorAll('.animate-on-scroll');
  if (!elements.length) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, index) => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const delay = parseInt(el.dataset.delay) || 0;
        const anim = el.dataset.animation || 'fadeInUp';

        setTimeout(() => {
          el.classList.add('animated');
          el.style.animationName = anim;
          el.style.animationDuration = (el.dataset.duration || '0.6s');
          el.style.animationFillMode = 'forwards';
        }, delay);

        observer.unobserve(el);
      }
    });
  }, {
    threshold: 0.15,
    rootMargin: '0px 0px -50px 0px'
  });

  elements.forEach(el => observer.observe(el));

  const staggerContainers = document.querySelectorAll('[data-stagger]');
  staggerContainers.forEach(container => {
    const items = container.children;
    const baseDelay = parseInt(container.dataset.staggerDelay) || 100;
    Array.from(items).forEach((item, i) => {
      item.dataset.delay = String(i * baseDelay);
    });
  });
}
