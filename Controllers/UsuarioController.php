<?php
include "../Connection/conect.php";
require_once "../Models/Usuario.php";

    $Operacion = $_GET["Operacion"];

    function IniciarSesion($Usuario, $Contrasenia, $conect)
    {

        $stmt = $conect->prepare("SELECT * FROM usuario WHERE nombre = ? AND contrasenia = ?");

        $stmt->bind_param("ss", $Usuario, $Contrasenia);
        
        $resultado = $stmt->execute()->get_result();

        if ($resultado->num_rows > 0) 
        {
            $registro = $resultado->fetch_assoc();

            session_start();

            $miUsuario = new Usuario();

            $miUsuario->NombreCompleto = $registro["nombre_completo"];
            $miUsuario->NombreUsuario = $registro["nombre_usuario"];

            $_SESSION['usuario'] = $miUsuario;

            header("Content-Type: application/json");
            echo json_encode(true);
        } 
        else 
        {
            header("Content-Type: application/json");
            echo json_encode(false);
        }

        mysqli_stmt_close($stmt);
    }

    function CerrarSesion()
    {
        session_start();
        session_destroy();
    }

    switch($Operacion)
    {
        case "login":
                $Usuario = $_GET["txtUsuario"];
                $Contrasenia = $_GET["txtContrasenia"];

                IniciarSesion($Usuario, $Contrasenia, $conect);
            break;
        case "logout":
                CerrarSesion();
            break;
        default:

            break;
    }
?>