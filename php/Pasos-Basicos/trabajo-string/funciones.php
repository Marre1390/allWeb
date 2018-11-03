<?php
	/*
	
	La funcion strcmp devuelve true si no son iguales y false si son iguales, tomando en consideracion las mayusculas.

	La funcion strcasecmp hace lo mismo que strcmp, pero no toma en consideracion las mayusculas y minusculas.

	*/

	function compararSinMayus(){
		$str1 = 'Marvin';
		$str2 = 'marvin';

		// la funcion strcasecmp compara tomando en cuenta las mayusculas y minusculas.
		// Ignora las mayusculas y minusculas.
		if(strcasecmp($str1, $str2)){
			return "$str1 no es igual a $str2";
		}
		else{
			return "$str1 es igual a $str2";
		}
	}

	function compararConMayus(){
		$str1 = 'MaRViN';
		$str2 = 'marvin';
		
		if(strcmp($str1, $str2)){
			return "$str1 no es igual a $str2";
		}
		else{
			return "$str1 es igual a $str2";
		}
	}
?>