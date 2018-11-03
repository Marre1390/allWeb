<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>String</title>
	<style>
		.resaltar{
			color: #F00;
			font-weight: bold;
		}

	</style>
</head>
<body>
	
	<?php
		// Cuidado con las comillas.
		echo "<p class='resaltar'>Esto es un ejemplo de frase.</p>";

		// Se puede usar la variable como un string, pero solo en comillas dobles.
		$nombre='Marvin';
		echo "El nombre es: $nombre. <br>";

		include 'funciones.php';

		echo compararConMayus();
		echo "<br>";
		echo compararSinMayus();
	?>

</body>
</html>