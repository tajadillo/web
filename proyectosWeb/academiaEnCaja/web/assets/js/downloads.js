'use strict';

function initDownloads() {
  document.querySelectorAll('[data-download]').forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault();
      const file = this.dataset.download;
      const name = this.dataset.downloadName || 'descarga';
      const format = this.dataset.downloadFormat || 'pdf';
      const isPremium = this.dataset.premium === 'true';

      if (isPremium) {
        showPremiumModal();
        return;
      }

      downloadFile(file, name, format);
    });
  });

  document.querySelectorAll('.download-card').forEach(card => {
    const countEl = card.querySelector('.download-count');
    if (countEl) {
      const count = parseInt(countEl.dataset.count) || 0;
      countEl.textContent = count.toLocaleString('es-PE') + ' descargas';
    }
  });
}

function downloadFile(url, name, format) {
  const badge = { pdf: 'PDF', mp3: 'MP3', mp4: 'MP4', zip: 'ZIP', docx: 'DOCX', xlsx: 'XLSX' };
  try {
    const a = document.createElement('a');
    a.href = url;
    a.download = name + '.' + format;
    a.target = '_blank';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    trackDownload(name, format);
  } catch (err) {
    console.warn('Descarga no disponible:', err);
  }
}

function trackDownload(name, format) {
  try {
    if (window.gtag) {
      gtag('event', 'download', { file_name: name, file_format: format });
    }
  } catch (e) {}
}

function showPremiumModal() {
  const existing = document.querySelector('.premium-modal');
  if (existing) existing.remove();

  const modal = document.createElement('div');
  modal.className = 'modal-overlay premium-modal active';
  modal.innerHTML = `
    <div class="modal-content" style="text-align:center">
      <button class="modal-close" aria-label="Cerrar">&times;</button>
      <h2 class="h3" style="margin-bottom:1rem">Contenido Premium</h2>
      <p style="margin-bottom:2rem;color:#616161">Este recurso está disponible para miembros de Academia en Caja. Inicia sesión o adquiere el curso para acceder.</p>
      <div class="btn-group" style="justify-content:center">
        <a href="/campus/login.html" class="btn btn-primary">Iniciar sesión</a>
        <a href="/cursos.html" class="btn btn-secondary">Ver cursos</a>
      </div>
    </div>
  `;
  document.body.appendChild(modal);

  modal.querySelector('.modal-close').addEventListener('click', () => modal.remove());
  modal.addEventListener('click', e => { if (e.target === modal) modal.remove(); });
  document.addEventListener('keydown', function close(e) {
    if (e.key === 'Escape') { modal.remove(); document.removeEventListener('keydown', close); }
  });
}
