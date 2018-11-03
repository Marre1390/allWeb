<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Funciones</title>
	<!-- require hace lo mismo que include, con la diferencia que
		 este no continuara el codigo porque se requiere el archivo php.
		 Caso contrario include continuara aunque no exista el archivo.

		 Importante:
	-->
	<?php include 'funciones.php'; ?>
</head>
<body>
	<?php
		
		function imprime(){
			$mensaje = 'Hola mundo desde PHP, estoy dentro de una funcion.<br>';
			return $mensaje;
		}
			
		echo imprime();
		mensaje();
		suma(5,2);
		echo "La diferencia es: " . resta(5,2);
	?>
</body>
</html>