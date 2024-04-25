var correo = document.querySelector('#emailPre');
var nombre = document.querySelector('#nombPre');
var apell = document.querySelector('#apelPre')
var numero = document.querySelector('#celPre');
var fech = document.querySelector('#fechPre');
var botonCont = document.querySelector('#botonPre');
var form = document.querySelector('#adopcion');
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
  if (/[\w']+/.test(apell.value)) {
    validar(apell);
  }else{
    error(apell);
  }
  if (fech.value == "") {
    error(fech);
  }else{
    validar(fech);
  }
  if (/[\d]{4}[-][\d]{7}/.test(numero.value)) {
    validar(numero);
  }else {
    error(numero);
  }

  if (valida) {
    form.submit();
    window.alert('Formulario de Adopción Enviado.');
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