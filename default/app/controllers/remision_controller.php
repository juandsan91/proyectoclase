<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of remision_controller
 *
 * @author equipo1
 */

Load::models("remision","consulta","historia");
class RemisionController extends AppController {
    //put your code here
    function index($idconsulta){
        
        $this->idconsulta = $idconsulta;
        
        $this->consulta = new Consulta();
        $this->consulta->find_first($idconsulta);
        $this->historia = new Historia();
        $this->historia->find_first($this->consulta->historia_id);
        
        
        $remision = new Remision();
        $this->array = array();
        $this->array = $remision->find("consulta_id=$idconsulta order by creado_at");
    }
    
    function nuevo($idconsulta){
        
        $this->idconsulta = $idconsulta;
        
         $this->consulta = new Consulta();
        $this->consulta->find_first($idconsulta);
        $this->historia = new Historia();
        $this->historia->find_first($this->consulta->historia_id);
        
        if(Input::hasPost("idconsulta")){
            $te = Input::post("tipoeps");
            
            $obj = new Remision(Input::post('remision'));
            $obj->consulta_id = $idconsulta;
            $obj->tipoeps_id = $te["tipoeps_id"];
            
            if($obj->save()){
                Flash::success("Se grabó la remisión correctamente...");
                Router::redirect("remision/index/$idconsulta");
            }
            else{
                 Flash::error("No se pudo grabar...");
            }
            
        }
    }
    
    function modificar($idremision){
       
        $this->obj = new Remision();
        $this->obj->find_first($idremision);
        $this->idconsulta = $this->obj->consulta_id;
        
         $this->consulta = new Consulta();
        $this->consulta->find_first($this->idconsulta);
        $this->historia = new Historia();
        $this->historia->find_first($this->consulta->historia_id);
        
        if(Input::hasPost("idconsulta")){
            
            $idconsulta = Input::post("idconsulta");
            $te = Input::post("tipoeps");   
            
            $obj = new Remision(Input::post('remision'));
            $obj->id = Input::post("idremision");
            $obj->consulta_id = $idconsulta;
            $obj->tipoeps_id = $te["tipoeps_id"];
            
            if($obj->update()){
                Flash::success("Se grabó la remisión correctamente...");
                Router::redirect("remision/index/$idconsulta");
            }
            else{
                 Flash::error("No se pudo grabar...");
            }
            
        }
    }
    
    function eliminar($idremision,$idconsulta){
         
         $obj = new Remision();
         $obj->find_first($idremision);
         if($obj->delete()){
             Flash::success("Eliminado correctamente");
             Router::redirect("remision/index/$idconsulta");
         }
         else{
             Flash::success("No fue eliminado correctamente");
         }
    }
}

?>
