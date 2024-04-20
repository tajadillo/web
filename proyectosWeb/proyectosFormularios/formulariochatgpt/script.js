
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

  // Aquí puedes agregar la lógica para enviar los datos por correo electrónico
  var subject = 'Nuevo mensaje de contacto';
  var body = 'Nombre: ' + name + '\nCorreo Electrónico: ' + email + '\nNúmero de WhatsApp: ' + whatsapp;
  var mailtoLink = 'mailto:richard_tajadillo@outlook.com?subject=' + encodeURIComponent(subject) + '&body=' + encodeURIComponent(body);
  window.location.href = mailtoLink;

  // Limpiar el formulario
  document.getElementById('contactForm').reset();
});
