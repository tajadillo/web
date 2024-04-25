var correo = document.querySelector('#emailCont');
var nombre = document.querySelector('#nombCont');
var numero = document.querySelector('#celCont');
var botonCont = document.querySelector('#botonCont');
var form = document.querySelector('#contacto');
var valida = true;

botonCont.addEventListener('click', function(event){
  event.preventDefault();
  var alerta = document.querySelectorAll('.alert');
  for (var i = 0; i < alerta.length; i++) {
    alerta[i].remove();
  }
  if(/[A-z][A-z-\.0-9]+[@][A-z-0-9]+(\.[A-z]{2,})+/.test(correo.value)){
    validar(correo);
  }else{
    error(correo);
  }
  if (/[\w']+/.test(nombre.value)) {
    validar(nombre);
  }else{
    error(nombre);
  }
  if (/[\d]{4}[-][\d]{7}/.test(numero.value)) {
    validar(numero);
  }else {
    error(numero);
  }

  if (valida) {
    form.submit();
    window.alert('Mensaje Enviado, Gracias por su Tiempo.');
  }
});

function validar(vari){
  var div = document.createElement('div');
  div.className = 'alert alert-success';
  div.innerHTML = 'Campo Correcto';
  vari.parentElement.appendChild(div);
}
function error(vari){
  var div = document.createElement('div');
  div.className = 'alert alert-danger';
  div.innerHTML = vari.getAttribute('error');
  vari.parentElement.appendChild(div);
  valida = false;
}
