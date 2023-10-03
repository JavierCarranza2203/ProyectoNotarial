<?php

require_once "IdentificacionPersona.php";

    abstract class DocumentosPersona extends IdentificacionPersona
    {
        public $ActaDeNacimiento;
        public $ActaDeMatrimonio;
        public $ComprobanteDomicilio;
        public $ReciboAgua;
        public $HojaGenerales;
    }

?>