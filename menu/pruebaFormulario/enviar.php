<?
$destino = "richard_tajadillo@outlook.com";
$Nombre = $_POST["Nombre"];
$Correo = $_POST["Correo"];
$Telefono = $_POST["Telefono"];
$Mensaje = $_POST["Mensaje"];
$contenido = "Nombre: " .$Nombre . "\nCorreo: " . $Correo . "\nTeléfono: " . $Telefono . "\nMensaje: " . $Mensaje;
mail($destino, "Contacto", $contenido);
header("Location:gracias.html")
?>
