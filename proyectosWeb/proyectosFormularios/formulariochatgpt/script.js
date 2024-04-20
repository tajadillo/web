document.getElementById('contactForm').addEventListener('submit', function(event) {
  event.preventDefault();

  // Obtener los valores del formulario
  var name = document.getElementById('name').value;
  var email = document.getElementById('email').value;
  var whatsapp = document.getElementById('whatsapp').value;

  // Validar el formato del número de WhatsApp
  var whatsappPattern = /^\+[1-9]\d{1,14}$/;
  if (!whatsappPattern.test(whatsapp)) {
    alert('Por favor, introduce un número de WhatsApp válido en el formato adecuado.');
    return;
  }

  // Validar el formato del correo electrónico
  var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailPattern.test(email)) {
    alert('Por favor, introduce una dirección de correo electrónico válida.');
    return;
  }

  // Redireccionar a la página de agradecimiento
  window.location.href = "gracias.html";
});
