<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="Author" content="Richard Alexander Tajadillo Pérez">
        <meta name="Description" content="plantilla html">
        <meta name="Keywords" content="">

        <title>Plantilla html</title>

        <link rel="shortcut icon" href="medios/logo-richard-tajadillo.ico">
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
       <header class="header">
        </header>
        <main class="main">
            <form action="enviar.php" method="post">
                <h2>CONTACTO</h2>
                <input type="text" name="Nombre" placeholder="Nombre" required>
                <input type="text" name="Correo" placeholder="Correo" required>
                <input type="text" name="Telefono" placeholder="Teléfono">
                <textarea name="Mensaje" placeholder="Escribe aquí tu mensaje" required></textarea>
                <input type="submit" value="ENVIAR" id="boton">
                <?php
include("enviar.php");
?>
            </form>
        </main>
        <footer class="footer">
        </footer>
    </body>
</html>



