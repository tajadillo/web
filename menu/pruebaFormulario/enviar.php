<?
$destino = "richard.tajadillo@gmail.com";
$Nombre = $_post["Nombre"];
$Correo = $_post["Correo"];
$Telefono = $_post["Telefono"];
$Mensaje = $_post["Mensaje"];
$contenido = "Nombre: " .$Nombre . "\nCorreo: " . $Correo . "\nTeléfono: " . $Telefono . "\nMensaje: " . $Mensaje;
mail($destino, "Contacto", $contenido);
header("Location:gracias.html")
?>
