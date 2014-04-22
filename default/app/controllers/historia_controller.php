<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of historia_controller
 *
 * @author cristhianlombana
 */


class HistoriaController extends AppController {
     
    //put your code here
    function index() {
        
        Load::model("Historia");
        $obj = new Historia();
        $this->historias = array();
        $this->historias = $obj->find();

        if (Input::hasPost("textoBusqueda")) {
            $comboBusqueda = Input::post("comboBusqueda");
            $textoBusqueda = Input::post("textoBusqueda");

            $obj = new Historia();
            $this->historias = array();

            if ($textoBusqueda!="") {

                //IDENTIFICACION
                if ($comboBusqueda == 0) {
                    $this->historias = $obj->find("identificacion=$textoBusqueda");
                }//APELLIDO
                else if ($comboBusqueda == 1) {
                    $this->historias = $obj->find("apellidos like'%$textoBusqueda%'");
                }
            }
            else{
                Flash::success("Escriba texto de búsqueda");
            }
        }
    }

    function nuevo() {
        Load::model("historia");

        if (Input::hasPost("tipoidentificacion")) {

            $ti = Input::post("tipoidentificacion");
            $tp = Input::post("tipoprograma");
            $te = Input::post("tipoeps");
            $tr = Input::post("tiporegimen");
            $tg = Input::post("tipogenero");
            $tec = Input::post("tipoestadocivil");
            $tz = Input::post("tipozona");

            $his = new Historia(Input::post("historia"));


            $his->tipoidentificacion_id = $ti["tipoidentificacion_id"];
            $his->tipoprograma_id = $tp["tipoprograma_id"];
            $his->tipoeps_id = $te["tipoeps_id"];
            $his->tiporegimen_id = $tr["tiporegimen_id"];
            $his->tipogenero_id = $tg["tipogenero_id"];
            $his->tipoestadocivil_id = $tec["tipoestadocivil_id"];
            $his->tipozona_id = $tz["tipozona_id"];

            if ($his->save()) {
                Flash::info("Registro exitoso.");
            } else {
                Flash::info("No se puede grabar...");
            }
        }
    }

    function modificar($idhistoria) {
        Load::model("Historia");
        $this->obj = new Historia();
        $this->obj->find_first($idhistoria);

        if (Input::hasPost("tipoidentificacion")) {


            $ti = Input::post("tipoidentificacion");
            $tp = Input::post("tipoprograma");
            $te = Input::post("tipoeps");
            $tr = Input::post("tiporegimen");
            $tg = Input::post("tipogenero");
            $tec = Input::post("tipoestadocivil");
            $tz = Input::post("tipozona");

            $his = new Historia(Input::post("historia"));
            $his->id = Input::post("idhistoria");
            $his->tipoidentificacion_id = $ti["tipoidentificacion_id"];
            $his->tipoprograma_id = $tp["tipoprograma_id"];
            $his->tipoeps_id = $te["tipoeps_id"];
            $his->tiporegimen_id = $tr["tiporegimen_id"];
            $his->tipogenero_id = $tg["tipogenero_id"];
            $his->tipoestadocivil_id = $tec["tipoestadocivil_id"];
            $his->tipozona_id = $tz["tipozona_id"];

            if ($his->update()) {
                $this->obj = new Historia();
                $this->obj->find_first($idhistoria);
                Flash::success("Modificación exitosa");
            } else {
                Flash::error("No se puede actualizar..");
            }
        }
    }

    function eliminar($idhistoria) {
        Load::model("Historia");
        $this->obj = new Historia();
        $this->obj->find_first($idhistoria);

        if (Input::hasPost("tipoidentificacion")) {
            $obj = new Historia();
            $obj->find_first($idhistoria);
            if ($obj->delete()) {
                $this->redirect("historia/index");
            } else {
                Flash::error("No se pudo eliminar.");
            }
        }
    }

}

?>
