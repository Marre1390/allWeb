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
	if(isset($_GET["user"]) && isset($_GET["pwd"])){
		
		$user=$_GET['user'];
		$pwd=$_GET['pwd'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$consulta = "SELECT p.Email, e.CONTRASENIA, e.idTipoEmpleado_fk FROM empleado e INNER JOIN persona p ON e.idPersona_fk = p.idPersona
		WHERE p.Email = '{$user}' and e.CONTRASENIA = '{$pwd}'";

		$resultado=mysqli_query($conexion,$consulta);

		if($consulta){
		
			if($reg=mysqli_fetch_array($resultado)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["user"]='';
			$results["pwd"]='';
			$results["code"]='';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
		   	$results["user"]='';
			$results["pwd"]='';
			$results["code"]='';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>