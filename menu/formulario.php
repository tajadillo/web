<?php
$destino = "richard_tajadillo@outlook.com";
$nombre = $POST["nombre"];
$correo = $POST["correo"];
$mensaje = $POST["mensaje"];
$contenido = "Nombre: " . $nombre . "\nCorreo: " . $correo . "\nMensaje: " . $mensaje
    mail($destino, "Contacto",  $contenido);
header("Location:gracias.html");
?>
