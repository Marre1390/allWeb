<?php
	// Funcion que imprime un mensaje
	function mensaje(){
		echo "Esta es la funcion suma que esta aislada...!!!<br>";
	}

	function suma($x,$y){
		echo "La suma de ".$x." y ".$y." es: ".($x+$y) . "<br>";
	}

	// funcion que retorna, al otro lado debe ir echo.
	function resta($x,$y){
		return $x-$y;
	}
?>