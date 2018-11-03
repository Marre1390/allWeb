<?php

		if (isset($_POST["button-enviar"])) {
			
			$numero1 = $_POST["numero1"];
			$numero2 = $_POST["numero2"];
			$select = $_POST["slc-operacion"];
			$txt = "El resulatdo es: ";

			calcular($select);
		}

		function calcular($operador){

			global $numero1, $numero2, $txt;

			switch ($operador) {
				case 1:
					echo $txt . ($numero1 + $numero2);
					break;
				case 2:
					echo $txt .($numero1 - $numero2);
					break;
				case 3:
					echo $txt . ($numero1 * $numero2);
					break;
				case 4:
					echo $txt. ($numero1 / $numero2);
					break;
				case 5:
					echo $txt . ($numero1 % $numero2);
					break;
				default:
					# code...
					break;
			}
			
		}
	?>