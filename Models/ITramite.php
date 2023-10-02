<?php

    public interface ITramite 
    {
        public $NombreCliente;
        public $Folio;
        public $Volumen;
        public $Instrumento;
        public $NombreEmpleado;
        public $Fecha;

        public function GuardarTramite();
        public function BuscarTramite( $id );
        public function EliminarTramite( $id );
    }

?>