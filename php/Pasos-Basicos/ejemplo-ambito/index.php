<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ambito variables</title>
</head>
<body>
	<?php

		//Varible con ambito global
		$nombre="Marvin";
		
		// llamada de la funcion.
		function DarNombre(){
			// Variable con ambito global. Debe estar dentro siempre de una funcion.
			global $nombre;

			//Variable con ambito local.
			$apellido = 'Ramirez';

			$nombre = "El nombre es: ".$nombre;		
		}
		echo '<br>';	
		DarNombre();
		// salida: Marvin, porque no accede a la funcion.
		echo $nombre."<br>";

		
	?>
</body>
</html>