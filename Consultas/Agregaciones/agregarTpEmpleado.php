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
	if(isset($_GET["tpempleado"]) && isset($_GET["salario"])){
		
		$tpempleado=$_GET['tpempleado'];		
		$salario=$_GET['salario'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$insert = "INSERT INTO tipoempleado (NombreTipoEmpleado, Salario)
					VALUES('{$tpempleado}', '{$salario}')";

		$resultado_insert=mysqli_query($conexion,$insert);

		if($resultado_insert){
		
			if($reg=mysqli_fetch_array($resultado_insert)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["tpempleado"]='No registra';
			$results["salario"]='No registra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
			$results["tpempleado"]='No registra';
			$results["salario"]='No registra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>