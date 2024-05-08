<?php

class Controlador{

    private $lista;

    public function __construct()
    {
        $this->lista = [];
    }

    public function getAll(){
        $con = new Conexion();
        $sql = "SELECT id, nombre_completo,direccion,numero_telefono,correo,solicitud_procesada FROM mantenedor";
        $rs = mysqli_query($con->getConnection(), $sql);
        if ($rs){
            while ($tupla = mysqli_fetch_assoc($rs)){
                $tupla['solicitud_procesada'] = $tupla['solicitud_procesada'] == 1 ? true: false;
                array_push($this->lista, $tupla);
            }
            mysqli_free_result($rs);
        }
        $con->closeConnection();
        return $this->lista;
    }

}