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
	if(isset($_GET["latitud"]) && isset($_GET["longitud"]) && isset($_GET["colonia"]) && isset($_GET["calle"])){
		
		$latitud=$_GET['latitud'];		
		$longitud=$_GET['longitud'];
		$colonia=$_GET['colonia'];		
		$calle=$_GET['calle'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$insert = "INSERT INTO sucursal (Longitud, Latitud, Calle, Colonia) VALUES('{$longitud}', '{$latitud}', '{$calle}', '{$colonia}')";

		$resultado_insert=mysqli_query($conexion,$insert);

		if($resultado_insert){

			$consulta="SELECT * FROM suscursal WHERE Latitud = '{$latitud}'";
			$resultado=mysqli_query($conexion,$consulta);
		
			if($reg=mysqli_fetch_array($resultado)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["latitud"]=0.0;
			$results["longitud"]=0.0;
			$results["colonia"]='No resgistra';
			$results["calle"]='No resgistra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
			$results["latitud"]=0.0;
			$results["longitud"]=0.0;
			$results["colonia"]='No resgistra';
			$results["calle"]='No resgistra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>