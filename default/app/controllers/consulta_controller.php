<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of consulta_controller
 *
 * @author equipo1
 */
class ConsultaController extends AppController {

    //put your code here
    function index($idhistoria) {
        Load::model("Consulta");
        $this->idhistoria = $idhistoria;
        $obj = new Consulta();
        $this->consultas = array();
        Flash::error($idhistoria);
        $this->consultas = $obj->find("historia_id=$idhistoria order by creado_at");
    }

    function nuevo($idhistoria) {
        $this->idhistoria = $idhistoria;
        Load::model("Historia");
        Load::model("Consulta");
        $this->obj = new Historia();
        $this->obj->find_first($idhistoria);


        if (Input::hasPost("idhistoria")) {
            
            $ti = Input::post("tipo_identificacion");
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
                Flash::success("Modificación exitosa de la Historia");
            }

            $con = new Consulta(Input::post("consulta"));
            if ($con->save()) {
                $idhistoria = Input::post("idhistoria");
                 Flash::success("Se grabó la consulta correctamente");
                Router::redirect("consulta/index/$idhistoria");
            } else {
                Flash::error("No se puede grabar...");
            }
        }
    }
    
    function modificar($idconsulta) {
        
        Load::model("Historia");
        Load::model("Consulta");
        $this->objcon = new Consulta();
        $this->objcon->find_first($idconsulta);
        
        $this->idhistoria = $this->objcon->historia_id;
        
        $this->obj = new Historia();
        $this->obj->find_first($this->objcon->historia_id);
        

        if (Input::hasPost("idhistoria")) {
            
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

            $idhistoria = Input::post("idhistoria");
            
            if ($his->update()) {
                $this->obj = new Historia();
                $this->obj->find_first($idhistoria);
                Flash::success("Modificación exitosa de la Historia");
            }

            $con = new Consulta(Input::post("consulta"));
            
            if ($con->update()) {
                $idhistoria = Input::post("idhistoria");
                 Flash::success("Se grabó la consulta correctamente");
                Router::redirect("consulta/index/$idhistoria");
            } else {
                Flash::error("No se puede grabar...");
            }
        }
    }
    function eliminar($idconsulta){
        Load::model("Historia");
        Load::model("Consulta");
        $this->objcon = new Consulta();
        $this->objcon->find_first($idconsulta);
        
        $this->idhistoria = $this->objcon->historia_id;
        
        $this->obj = new Historia();
        $this->obj->find_first($this->objcon->historia_id);
        
        if(Input::hasPost("idconsulta")){
             $obj = new Consulta();
             $obj->find_first(Input::post("idconsulta"));
             
             $idconsulta=Input::post("idconsulta");
             $idhistoria=Input::post("idhistoria");
             
             if($obj->delete()){
                 Flash::success("Se eliminó la consulta correctamente");
                 Router::redirect("consulta/index/$idhistoria");
             }
             else{
                 Flash::error("No se pudo eliminar.");  
             }
         }
    }

}

?>
