var correo = document.querySelector('#emailReg');
var nombre = document.querySelector('#nombReg');
var numero = document.querySelector('#celReg');
var apelli = document.querySelector('#apelReg');
var estado = document.querySelector('#estReg');
var boton = document.querySelector('#botonReg');
var form = document.querySelector('#registro');
var userReg = document.querySelector('#userReg');
var passReg = document.querySelector('#passReg');
var valida = true;

boton.addEventListener('click', function(event){
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
  if (/[\w']+/.test(apelli.value)) {
    validar(apelli);
  }else{
    error(apelli);
  }
  if (/[\d]{4}[-][\d]{7}/.test(numero.value)) {
    validar(numero);
  }else {
    error(numero);
  }
  if(estReg.value == ""){
    error(estReg);
  }else{
    validar(estReg)
  }
  if (passReg.value == "") {
    error(passReg);
  }else {
    validar(passReg);
  }
  if (usuarios[userReg.value] === undefined && valida) {
    usuarios[userReg.value] = {};
    usuarios[userReg.value]['correo'] = correo.value;
    usuarios[userReg.value]['nombre'] = nombre.value;
    usuarios[userReg.value]['apellido'] = apelli.value;
    usuarios[userReg.value]['celular'] = numero.value;
    usuarios[userReg.value]['estado'] = estado.value;
    usuarios[userReg.value]['password'] = passReg.value;
    localStorage.setItem("usuarios",JSON.stringify(usuarios));
  }else{
    error(userReg);
  }

  if (valida) {
    form.submit();
    window.alert('Usuario registrado de Forma Exitosa.');
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
