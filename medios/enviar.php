<?php
	$nombre = $_POST["nombre"];
	$correo = $_POST["correo"];
	$edad = $_POST["edad"];
	$fecha = $_POST["fecha"];
	$mensaje = $_POST["mensaje"];
	$para = "richard.tajadillo@gmail.com";
	$asunto = "Mensaje de la pagina";
	
	$mensaje = "
		nombre del remitente: ".$nombre."
		e-mail: ".$correo."
		edad: ".$edad."
		fecha: ".$fecha."
		mensaje: ".$mensaje."
	";
	
	mail($para,$asunto,utf8_decode($mensaje));
	header ("location:gracias.html");
?>