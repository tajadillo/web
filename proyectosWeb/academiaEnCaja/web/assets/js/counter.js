'use strict';

function initCounter() {
  const counters = document.querySelectorAll('.counter');
  if (!counters.length) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseInt(el.dataset.target) || 0;
        const duration = parseInt(el.dataset.duration) || 2000;
        const suffix = el.dataset.suffix || '';
        const prefix = el.dataset.prefix || '';
        const decimals = parseInt(el.dataset.decimals) || 0;
        animateCounter(el, target, duration, suffix, prefix, decimals);
        observer.unobserve(el);
      }
    });
  }, { threshold: 0.5 });

  counters.forEach(el => observer.observe(el));
}

function animateCounter(el, target, duration, suffix, prefix, decimals) {
  const start = 0;
  const startTime = performance.now();

  function easeOutCubic(t) {
    return 1 - Math.pow(1 - t, 3);
  }

  function update(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const easedProgress = easeOutCubic(progress);
    const current = start + (target - start) * easedProgress;
    const formatted = current.toFixed(decimals);
    const display = prefix + Number(formatted).toLocaleString('es-PE') + suffix;
    el.textContent = display;
    if (progress < 1) {
      requestAnimationFrame(update);
    } else {
      el.textContent = prefix + target.toLocaleString('es-PE') + suffix;
    }
  }

  requestAnimationFrame(update);
}
