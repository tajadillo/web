'use strict';

function initSearch() {
  const overlay = document.createElement('div');
  overlay.className = 'search-overlay';
  overlay.innerHTML = `
    <form class="search-form" role="search" aria-label="Buscar">
      <span class="input-group" style="width:100%">
        <svg class="input-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="11" cy="11" r="8"/><path d="M21 21l-4.35-4.35"/>
        </svg>
        <input class="form-input" type="search" placeholder="Buscar cursos, volúmenes, artículos..." aria-label="Buscar" autocomplete="off">
      </span>
      <button class="btn btn-primary search-close-btn" type="button" aria-label="Cerrar búsqueda">ESC</button>
    </form>
    <div class="search-results"></div>
  `;
  document.body.appendChild(overlay);

  const input = overlay.querySelector('input');
  const results = overlay.querySelector('.search-results');
  const closeBtn = overlay.querySelector('.search-close-btn');

  const searchData = [
    ...document.querySelectorAll('[data-search]')
  ].map(el => ({
    title: el.dataset.searchTitle || el.textContent.trim().slice(0, 60),
    url: el.dataset.searchUrl || '#',
    category: el.dataset.searchCategory || 'General',
    text: el.dataset.search || el.textContent.trim().slice(0, 120)
  }));

  function openSearch() {
    overlay.classList.add('active');
    input.value = '';
    results.innerHTML = '';
    setTimeout(() => input.focus(), 100);
    document.body.style.overflow = 'hidden';
  }

  function closeSearch() {
    overlay.classList.remove('active');
    document.body.style.overflow = '';
    input.blur();
  }

  document.addEventListener('keydown', e => {
    if ((e.key === 'k' && (e.ctrlKey || e.metaKey)) || e.key === '/') {
      if (!overlay.classList.contains('active')) {
        e.preventDefault();
        openSearch();
      }
    }
    if (e.key === 'Escape' && overlay.classList.contains('active')) {
      closeSearch();
    }
  });

  if (closeBtn) closeBtn.addEventListener('click', closeSearch);
  overlay.addEventListener('click', e => { if (e.target === overlay) closeSearch(); });

  let debounceTimer;
  input.addEventListener('input', () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
      const term = input.value.trim().toLowerCase();
      if (!term) { results.innerHTML = ''; return; }

      const filtered = searchData.filter(item =>
        item.title.toLowerCase().includes(term) ||
        item.text.toLowerCase().includes(term) ||
        item.category.toLowerCase().includes(term)
      );

      if (!filtered.length) {
        results.innerHTML = '<p style="text-align:center;padding:2rem;opacity:0.6">No se encontraron resultados</p>';
        return;
      }

      results.innerHTML = filtered.map((item, i) => `
        <a href="${item.url}" class="search-result-item" data-index="${i}">
          <h4>${highlight(item.title, term)}</h4>
          <span class="badge" style="margin-bottom:4px">${item.category}</span>
          <p>${highlight(item.text.slice(0, 100), term)}</p>
        </a>
      `).join('');
    }, 300);
  });

  function highlight(text, term) {
    const regex = new RegExp(`(${term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')})`, 'gi');
    return text.replace(regex, '<mark style="background:#FFEA00;color:#000;padding:0 2px">$1</mark>');
  }
}
