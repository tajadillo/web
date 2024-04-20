
document.getElementById('contactForm').addEventListener('submit', function(event) {
  event.preventDefault();


  // Obtener los valores del formulario
  var name = document.getElementById('name').value;
  var email = document.getElementById('email').value;
  var whatsapp = document.getElementById('whatsapp').value;

  // Realizar la solicitud AJAX para enviar el formulario
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'sendmail.php', true);
  xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
    if (xhr.status === 200) {
      alert(xhr.responseText);
      document.getElementById('contactForm').reset(); // Limpiar el formulario después de enviarlo
    } else {
      alert('Hubo un error al enviar el formulario. Por favor, inténtalo de nuevo más tarde.');
    }
  };
  xhr.send('name=' + encodeURIComponent(name) + '&email=' + encodeURIComponent(email) + '&whatsapp=' + encodeURIComponent(whatsapp));
});

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


