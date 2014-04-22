<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cita_controller
 *
 * @author equipo1
 */


Load::models("cita","historia");
class CitaController extends AppController {
    //put your code here
    function index($idhistoria,$pagina=1){
        try {
            $cita = new Cita();
            $this->citas = $cita->paginar($pagina,$idhistoria);
            $this->idhistoria= $idhistoria;
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
    
    function nuevo($idhistoria){
        $this->idhistoria= $idhistoria;
        if(Input::hasPost("cita")){
            $cita = new Cita(Input::post("cita"));
            if($cita->save()){
                Flash::success("Grabado correctamente");
                Router::redirect("cita/index/$idhistoria");
            }
            else{
                Flash::success("No se pudo grabar");
            }
        }
    }
    
    function modificar($idcita){
               
        $this->objcon = new Cita();
        $this->objcon->find_first($idcita);
        
        $this->idhistoria = $this->objcon->historia_id;        
        
        if(Input::hasPost("cita")){
            $cita = new Cita(Input::post("cita"));
            if($cita->update()){
                Flash::success("Grabado correctamente");
                $idhistoria = $cita->historia_id;
                Router::redirect("cita/index/$idhistoria");
            }
            else{
                Flash::success("No se pudo grabar");
            }
        }
    }
    
    function eliminar($idhistoria,$idcita){
        $cita = new Cita();
       
        if($cita->delete($idcita)){
            Flash::success("Cita eliminada correctamente");
            Router::redirect("cita/index/$idhistoria");
        }
        else{
            Flash::success("No se pudo eliminar la cita");
            Router::redirect("cita/index/$idhistoria");
        }
    }
}

?>
