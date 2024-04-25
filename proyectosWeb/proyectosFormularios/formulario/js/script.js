var usuarios = localStorage.getItem("usuarios");
var log = document.querySelector('#log');
var user = document.querySelector('#user');
var pass = document.querySelector('#pass');
var wel = document.querySelector('#wel');
sesion();
if (usuarios === null  || usuarios === undefined) {
  usuarios = {};
} else {
  usuarios = JSON.parse(usuarios);
}
log.addEventListener('click', function(){
  console.log(user.value);
  console.log(pass.value);
  if (usuarios[user.value] !== undefined && usuarios[user.value].password == pass.value) {
    window.alert('Bienvenido, '+ user.value);
    $('#myModal').modal('hide');
    sessionStorage.setItem('user',user.value);
    sesion();
  }else {
    window.alert('Usuario y/o Contraseña Incorrectos');
  }
});

function sesion(){
  if (sessionStorage.getItem('user') !== null) {
    document.querySelector('#reg').remove();
    document.querySelector('#ini').remove();
    var li = document.createElement('li');
    var a = document.createElement('a');
    a.innerHTML = 'Bienvenido, '+ sessionStorage.getItem('user');
    wel.appendChild(li);
    li.appendChild(a);
  }
}
