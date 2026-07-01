'use strict';

function initCarousel(containerSelector = '.carousel') {
  const containers = document.querySelectorAll(containerSelector);
  containers.forEach(container => {
    const track = container.querySelector('.carousel-track');
    const slides = container.querySelectorAll('.carousel-slide');
    const prevBtn = container.querySelector('.carousel-prev');
    const nextBtn = container.querySelector('.carousel-next');
    const dots = container.querySelectorAll('.carousel-dot');

    if (!track || !slides.length) return;

    const autoplay = container.dataset.autoplay === 'true';
    const interval = parseInt(container.dataset.interval) || 5000;
    const infinite = container.dataset.infinite !== 'false';

    let currentIndex = 0;
    let autoplayTimer = null;
    let isTransitioning = false;

    function getSlidesPerView() {
      if (window.innerWidth < 576) return 1;
      if (window.innerWidth < 992) return parseInt(container.dataset.tablet) || 2;
      return parseInt(container.dataset.desktop) || 4;
    }

    function goTo(index) {
      if (isTransitioning) return;
      isTransitioning = true;
      const slidesPerView = getSlidesPerView();
      const maxIndex = Math.max(0, slides.length - slidesPerView);

      currentIndex = Math.max(0, Math.min(index, maxIndex));
      if (infinite && currentIndex > maxIndex) currentIndex = 0;
      if (infinite && currentIndex < 0) currentIndex = maxIndex;

      track.style.transform = `translateX(-${currentIndex * (100 / slidesPerView)}%)`;

      dots.forEach((dot, i) => {
        dot.classList.toggle('active', i === currentIndex);
      });

      setTimeout(() => { isTransitioning = false; }, 400);
    }

    if (nextBtn) nextBtn.addEventListener('click', () => { goTo(currentIndex + 1); resetAutoplay(); });
    if (prevBtn) prevBtn.addEventListener('click', () => { goTo(currentIndex - 1); resetAutoplay(); });

    dots.forEach((dot, i) => {
      dot.addEventListener('click', () => { goTo(i); resetAutoplay(); });
    });

    function startAutoplay() {
      if (!autoplay) return;
      autoplayTimer = setInterval(() => goTo(currentIndex + 1), interval);
    }

    function resetAutoplay() {
      if (!autoplay) return;
      clearInterval(autoplayTimer);
      startAutoplay();
    }

    container.addEventListener('mouseenter', () => clearInterval(autoplayTimer));
    container.addEventListener('mouseleave', startAutoplay);

    let touchStartX = 0;
    let touchEndX = 0;
    container.addEventListener('touchstart', e => {
      touchStartX = e.changedTouches[0].screenX;
    }, { passive: true });
    container.addEventListener('touchend', e => {
      touchEndX = e.changedTouches[0].screenX;
      const diff = touchStartX - touchEndX;
      if (Math.abs(diff) > 50) {
        diff > 0 ? goTo(currentIndex + 1) : goTo(currentIndex - 1);
        resetAutoplay();
      }
    }, { passive: true });

    document.addEventListener('keydown', e => {
      if (container.matches(':focus-within')) {
        if (e.key === 'ArrowLeft') { goTo(currentIndex - 1); resetAutoplay(); }
        if (e.key === 'ArrowRight') { goTo(currentIndex + 1); resetAutoplay(); }
      }
    });

    container.setAttribute('aria-live', 'polite');
    container.setAttribute('role', 'region');
    container.setAttribute('aria-roledescription', 'carousel');

    goTo(0);
    startAutoplay();

    window.addEventListener('resize', () => goTo(currentIndex));
  });
}
