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
	if(isset($_GET["tel"]) && isset($_GET["suscursal"])){
		
		$tel=$_GET['tel'];		
		$sucursal=$_GET['sucursal'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$insert = "INSERT INTO telefonosucursal (Numero, idSucursal) VALUES('{$tel}', '{$sucursal}')";

		$resultado_insert=mysqli_query($conexion,$insert);

		if($resultado_insert){
		
			if($reg=mysqli_fetch_array($resultado_insert)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["tel"]='No Registra';
			$results["sucursal"]=0;
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
			$results["tel"]='No Registra';
			$results["sucursal"]=0;
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>