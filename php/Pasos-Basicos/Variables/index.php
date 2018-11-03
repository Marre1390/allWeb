<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<?php
		// Declarar y asignar valor a las variables
		$var = "Marvin";
		$edad = 28;
		$dec = 0.5;

		// Imprimir las varibles.
		/*
		* print no admite impresion de diferentes varibles de distintos tipos,
		* mientras que echo SI.
		*/
		echo("Hola mi nombre es: $var<br>");
		echo "Esta es la edad: $edad<br>";
		echo "<b>Este es el numero decimal: " . $dec . "</b>";
	?>	
</body>
</html>