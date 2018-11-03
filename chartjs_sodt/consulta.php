<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	
	<?php

	// Conectando, seleccionando la base de datos

	$link = new PDO('localhost', 'root', 'database')

	    or die('No se pudo conectar: ' . mysql_error());


	mysql_select_db('sodt') or die('No se pudo seleccionar la base de datos');



	// Realizar una consulta MySQL
	$query = 'SELECT * FROM tbl_servicio';

	$result = mysql_query($query) or die('Consulta fallida: ' . mysql_error());

	?>

	<table class="table table-striped">
	  	
			<thead>
			<tr>
				<th>ID</th>
				<th>NOMBRE</th>
				<th>APELLIDO</th>
			</tr>
			</thead>
	<?php while ($row = mysql_fetch_array($result)){ ?>
	<tr>
		<td><?php $row['txt_servicio'] ?></td>
	    <td><?php $row['num_duración'] ?></td>
	    <td><?php $row['cod_tipo_servicio_fk'] ?></td>
	</tr>	
	<?php} ?>
	</table>

</body>
</html>
