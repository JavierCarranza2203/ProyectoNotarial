<?php 
require_once "../Connection/conect.php";
require_once "../Models/Cliente.php";

    $operacion = $_GET["operacion"];

    function VerificarCliente($np, $ap, $am, $rfc, $conect)
    {
        $clienteExiste = false;
        $nuevoNombre = $np.' '.$ap.' '.$am;

        $stmt = mysqli_prepare($conect, "SELECT nombre, apellido_paterno, apellido_materno, rfc FROM clientes");

        mysqli_stmt_execute($stmt);

        $resultadoClientesRegistrados = mysqli_stmt_get_result($stmt);

        while ($row = mysqli_fetch_assoc($resultadoClientesRegistrados)) {
            $nombreCompletoRegistroExistente = $row["nombre"].' '.$row["apellido_paterno"].' '.$row["apellido_materno"];

            $rfcRegistroExistente = $row["rfc"];
            // Valida la existencia mediante el nombre y CURP

            if ($nuevoNombre == $nombreCompletoRegistroExistente && $rfc == $rfcRegistroExistente) {
                $clienteExiste = true;
                break;
            }
        }

        header("Content-Type: application/json");

        if ($clienteExiste == true) {
            echo json_encode(true);
        } else {
            echo json_encode(false);
        }

        mysqli_stmt_close($stmt);
    }

    function AgregarCliente($conect)
    {
        $miCliente = new Cliente();

        $miCliente->NombreDePila = $_GET["txtNombreDePila"];
        $miCliente->ApellidoPaterno = $_GET["txtApellidoPaterno"];
        $miCliente->ApellidoMaterno = $_GET["txtApellidoMaterno"];
        $miCliente->Rfc = $_GET["txtRfc"];
        $miCliente->Curp = $_GET["txtCurp"];
        $miCliente->Correo = $_GET["txtCorreo"];

        if(VerificarCliente($miCliente->NombreDePila, $miCliente->ApellidoPaterno, $miCliente->ApellidoMaterno, $miCliente->Rfc, $conect) == false)
        {
            $stmt = mysqli_prepare($conect, "INSERT INTO clientes (nombre_de_pila, apellido_paterno, apellido_materno, rfc, curp, correo) VALUES (?, ?, ?, ?, ?, ?)");

            mysqli_stmt_bind_param($stmt, "s", $miCliente->NombreDePila, $miCliente->ApellidoPaterno, $miCliente->ApellidoMaterno, $miCliente->Rfc, $miCliente->Curp, $miCliente->Correo);

            $resultado = mysqli_stmt_execute($stmt);

            header("Content-Type: application/json");

            echo json_encode($resultado);

            mysqli_stmt_close($stmt);
        }
        else
        {
            header("Content-Type: application/json");

            echo json_encode(false);
        }
    }

    function EliminarCliente ($id, $conect)
    {
        $stmt = mysqli_prepare($conect, "DELETE FROM clientes WHERE id = ?");

        mysqli_stmt_bind_param($stmt, "i", $id);

        $resultado = mysqli_stmt_execute($stmt);

        header("Content-Type: application/json");

        echo json_encode($resultado);

        mysqli_stmt_close($stmt);
    }

    function BuscarCliente($id, $conect)
    {
        $stmt = $conect->prepare("SELECT * FROM cliente WHERE id = ?");

        $stmt->bind_param("i", $id);

        $resultado = $stmt->execute()->get_result();

        if ($resultado->num_rows > 0) {
            $registro = $resultado->fetch_assoc();

            $miCliente = new Cliente($registro["id"]);

            $miCliente->NombreDePila = $registro["nombre_de_pila"];
            $miCliente->ApellidoPaterno = $registro["apellido_paterno"];
            $miCliente->ApellidoMaterno = $registro["apellido_materno"];
            $miCliente->Rfc = $registro["Rfc"];
            $miCliente->Curp = $registro["Curp"];
            $miCliente->Correo = $registro["Correo"];

            echo json_encode($miCliente);
        } 
        else 
        {
            echo "Registro no encontrado";
        }

        $stmt->close();
    }

    switch($operacion)
    {
        case "add":
                AgregarCliente($conect);
            break;
        case "search":
                $idCliente = $_GET["txtHiddenId"];
                BuscarCliente($idCliente, $conect);
            break;
        case "delete":
                $idCliente = $_GET["txtHiddenId"];
                EliminarCliente($idCliente, $conect);
            break;
        default:
            break;
    }
?>