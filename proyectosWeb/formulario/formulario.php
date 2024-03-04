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
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <body>
        <header class="header">
            <div class="nav">
                <nav class="nav">
                    <ul>
                        <li>
                            <a>
                                Inicio
                            </a>
                        </li>
                        <li>
                            <a>
                                Quien Soy
                            </a>
                        </li>
                        <li>
                            <a>
                                Servisios
                            </a>
                        </li>
                        <li>
                            <a>
                                Contactos
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <main class="main">
<form method="post">
<input type="text" placeholder="name" name="name" required="">
<input type="email" placeholder="email" name="email" required="">
<input type="text" placeholder="asunto" name="asunto" required="">
<textarea placeholder="mensaje" name="msg"></textarea>
<input type="submit" name="enviar">
</form>
<?php
include("correo.php");
?>
        </main>
        <footer class="footer">
        </footer>
    </body>
</html>




