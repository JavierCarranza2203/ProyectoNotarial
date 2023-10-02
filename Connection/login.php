<?php 

include 'conect.php';

    $nombre = $_GET["user"];
    $password = $_GET["password"];

    $stmt = mysqli_prepare($conect, "SELECT * FROM usuario WHERE nombre = ? AND contrasenia = ?");

    mysqli_stmt_bind_param($stmt, "ss", $nombre, $password);

    mysqli_stmt_execute($stmt);
    
    mysqli_stmt_store_result($stmt);

    $nr = mysqli_stmt_num_rows($stmt);

    if ($nr == 1) {
        session_start();
        $_SESSION['usuario'] = $nombre;

        header("Content-Type: application/json");
        echo json_encode(true);
    } else {
        header("Content-Type: application/json");
        echo json_encode(false);
    }

    mysqli_stmt_close($stmt);

?>