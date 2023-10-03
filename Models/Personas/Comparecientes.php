<?php

require_once "../Abstractas/IdentificacionPersona.php";

    class Compareciente extends IdentificacionPersona
    {
        public function __construct($an, $am, $cd, $ra, $hg, $ine, $curp, $rfc)
        {
            $this->ActaDeNacimiento = $an;
            $this->ActaDeMatrimonio = $am;
            $this->ComprobanteDomicilio = $cd;
            $this->ReciboAgua = $ra;
            $this->HojaGenerales = $hg;
            $this->Ine = $ine;
            $this->Curp = $curp;
            $this->Rfc = $rfc;
        }
    }

?>