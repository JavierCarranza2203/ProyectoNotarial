<?php

    public class Cliente{
        private $id;
        public $NombreDePila;
        public $ApellidoMaterno;
        public $ApellidoPaterno;
        public $Rfc;
        public $Curp;
        public $Correo;

        public function GetId(){ return $this->id }

        public function __construct($id = null) 
        {
            if ($id !== null && is_numeric($id) && $id > 0) 
            {
                $this->id = $id;
            } 
            else 
            {
                $this->id = 0;
            }
        
            $this->NombreDePila = "Desconocido";
            $this->ApellidoMaterno = "Desconocido";
            $this->ApellidoPaterno = "Desconocido";
            $this->Rfc = "Desconocida";
            $this->Curp = "Desconocida";
            $this->Correo = "Desconocido";
        }            
    }

?>