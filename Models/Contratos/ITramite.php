<?php

    interface ITramite 
    {
        // get y set de NombreCliente
        public function getNombreCliente();
        public function setNombreCliente($nombre);

        //get y set de Folio
        public function getFolio();
        public function setFolio($folio);

        //get y set de Volumen
        public function getVolumen();
        public function setVolumen($volumen);

        //get y set de Instrumento
        public function getInstrumento();
        public function setInstrumento($instrumento);

        //get y set de NombreEmpelado
        public function getNombreEmpleado();
        public function setNombreEmpleado($nombre);

        //get y set de Fecha
        public function getFecha();
        public function setFecha($fecha);

        //METODOS
        public function GuardarTramite();
        public function BuscarTramite( $id );
        public function EliminarTramite( $id );
    }

?>