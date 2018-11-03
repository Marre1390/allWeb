<?PHP

/*$hostname="www.db4free.net";
$database="restaurante0700";
$username="industria0700";
$password="industria0700";*/
$hostname="localhost";
$database="RESTAURANTE";
$username="root";
$password="database";

$json=array();
		
$conexion=mysqli_connect($hostname,$username,$password,$database);

$consulta = "SELECT NombreTipoEmpleado FROM tipoempleado";

$resultado=mysqli_query($conexion,$consulta);

if($consulta){
	while($reg=mysqli_fetch_array($resultado)){
		$json['datos'][]=$reg;
	}
	mysqli_close($conexion);
	echo json_encode($json);

}
else{
	$results["id"]='';
	$json['datos'][]=$results;
	echo json_encode($json);
}
?>