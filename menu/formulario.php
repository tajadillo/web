<?php
$destino = "richard_tajadillo@outlook.com";
$nombre = $_POST["nombre"];
$correo = $_POST["correo"];
$mensaje = $_POST["mensaje"];
$contenido = "Nombre: " . $nombre . "\nCorreo: " . $correo . "\nMensaje: " . $mensaje
    mail($destino, "Contacto",  $contenido);
header("Location:gracias.html");

if(isset($_POST['submit'])) {
    if(empty($nombre)) {
        echo "<p class='error'>* Agrega tu nombre </p>";
    }
    else {
        if(strlen(nombre) > 15) {
            echo "<p class='error'>* El nombre es muy largo </p>";
        }
    }
    if(empty($correo)) {
        echo "<p class='error'>* Agrega tu correo </p>";
    }
    else {
        if(!filter_var($correo, FILTER_VALIDATE_EMAL)) {
            echo "<p class='error'>* El corro es incorrecto </p>";
        }
    }
}
?>
