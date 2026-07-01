document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".accordion-header").forEach(btn => {
    btn.addEventListener("click", () => {
      const item = btn.closest(".accordion-item");
      const isOpen = item.classList.contains("active");
      item.closest(".accordion").querySelectorAll(".accordion-item.active").forEach(el => el.classList.remove("active"));
      if (!isOpen) item.classList.add("active");
    });
  });
});
