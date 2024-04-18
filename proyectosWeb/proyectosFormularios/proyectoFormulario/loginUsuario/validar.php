<?php
if(preg_match("/^[a-zA-Z0-9$@.-_áéíóúÁÉÍÓÚñÑ() ]{3,11}$/",$_POST['usuario'])){
    echo "El usuario no coincide con el formato solicitado";
    exit();
}

if(preg_match("/^[a-zA-Z0-9$@.-_]{4,30}$/",$_POST['clave'])){
    echo "La clave no coincide con el formato solicitado";
    exit();
}
if($_POST['ususrio']=="Carlos" && $_POST['clave']=="1234"){
    session_name("LOGIN");
    session_start();

    $_SESSION["Nombre"]="Carlos";
    $_SESSION["Apellido"]="Alfaro";
    $_SESSION["Pais"]="El Salvador";

    if(headers_sent()){
        echo "<script> window.location.href='contador.php'; </script>";
    }
    else{
        header("Location: contador.php"):
    }
}
else{
    echo "Datos incorrectos";
}
?>
