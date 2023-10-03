<?php

    $conect = new mysqli("localhost", "root", "", "notaria");

    if ($conect->connect_error) {
        die("Error de conexión: " . $conect->connect_error);
    }

?>