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
