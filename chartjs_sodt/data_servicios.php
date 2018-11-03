<?php
//setting header to json
header('Content-Type: application/json');

//database
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'sodt');

$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

if(!$mysqli){
	die("Connection failed: " . $mysqli->error);
}

$query = sprintf("  SELECT COUNT(*) servicio, tbl_servicio.txt_servicio
					FROM tbl_servicio_x_solicitud 
					INNER JOIN tbl_servicio 
					WHERE tbl_servicio_x_solicitud.cod_servicio = tbl_servicio.cod_servicio
					GROUP BY tbl_servicio_x_solicitud.cod_servicio");
$result = $mysqli->query($query);

//loop trough the returned data
$data = array();
if(is_array($result) || is_object($result))
{
	foreach ($result as $row) {
		$data[] = $row;
	}	
}
else
{	print json_encode('Query result is not an array nethier an object!');	}

//free memory associated with result
$result->close();
$mysqli->close();

//now print the data
print json_encode($data);
?>
