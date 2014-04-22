<?php
View::template("sesiontmp");
load::model("usuario");
class SesionController extends AppController
{
	function index()
	{
		if(input::hasPost("nick"))
		{
			$nick = Input::post("nick");
			$pass = Input::post("pass");
			//esta clase ayuda a autenticar una clase y abrir una sesion
			$auth = new Auth("model","class: usuario","nick: $nick","pass: $pass");

			if($auth->authenticate())
			{
				Router::redirect("index/index");
			}
			else
			{
				Flash::error("usuario incorrectos");
			}
		}
	}
	function cerrar()
	{
		auth::destroy_identity();
		router::redirect("sesion/index"); 
	}

}
?>