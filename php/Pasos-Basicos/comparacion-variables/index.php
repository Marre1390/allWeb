<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Comparacion entre variables</title>
</head>
<body>
	
	<?php
		$var1 = 1;
		$var2 = 1;
		$var3 = "1";

		if ($var1 === $var3) {
			echo 'Si son iguales';
		}
		else{
			echo 'No son iguales';
		}
	?>

</body>
</html>