<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recibe los datos del formulario
    $name = $_POST['name'];
    $email = $_POST['email'];
    $whatsapp = $_POST['whatsapp'];

    // Dirección de correo a la que enviar el mensaje
    $to = "richard_tajadillo@outlook.com";

    // Asunto del correo
    $subject = "Nuevo mensaje de contacto";

    // Mensaje del correo
    $message = "Nombre: " . $name . "\nCorreo Electrónico: " . $email . "\nNúmero de WhatsApp: " . $whatsapp;

    // Cabeceras del correo
    $headers = "From: " . $email . "\r\n";
    $headers .= "Reply-To: " . $email . "\r\n";

    // Envía el correo
    if (mail($to, $subject, $message, $headers)) {
        header("Location: gracias.html");
    } else {
        echo "Hubo un error al enviar el mensaje.";
    }
} else {
    echo "Acceso denegado.";
}
?>

