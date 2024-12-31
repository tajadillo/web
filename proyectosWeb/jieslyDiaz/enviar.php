<?php
	$para = "richard_tajadillo@outlook.com";
	$nombre = $_POST["nombre"];
	$correo = $_POST["correo"];
	$edad = $_POST["edad"];
	$telefono = $_POST["telefono"];
    $mensaje = $_POST["mensaje"];
    $contenido = "nombre: " . $nombre . "\ncorreo: " . $correo . "\nedad: " . $edad . "\ntelefono: " . $telefono . "\nmensaje: " . $mensaje

        mail($para,"mensajeGeneralDeLaPagina", $contenido);
    header("Location:gracias.html")
?>
