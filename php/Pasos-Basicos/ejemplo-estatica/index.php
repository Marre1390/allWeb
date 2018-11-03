<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Estatica</title>
</head>
<body>
	<?php
		function incrementaVariable(){
			/*
			Importante: Una variable estatica no puede ser global al mismo tiempo,
			para eso se crea otra variable (contadorfinal), para que sea asignado.
			*/
			global $contadorfinal;
			//Variable estatica
			static $contador = 0;

			$contador++;
			$contadorfinal = $contador;

			echo $contador.'<br>';	
		}

		incrementaVariable();
		incrementaVariable();
		incrementaVariable();
		incrementaVariable();
		incrementaVariable();
		echo "El valor final es: " . $contadorfinal;
	?>
</body>
</html>