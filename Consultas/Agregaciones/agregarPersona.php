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
	if(isset($_GET["nombres"]) && isset($_GET["apellidos"]) && isset($_GET["id"])&& isset($_GET["email"])
	&& isset($_GET["colonia"]) && isset($_GET["calle"]) && isset($_GET["numcasa"]) && isset($_GET["departamento"])){
		
		$nombres=$_GET['nombres'];		
		$apellidos=$_GET['apellidos'];
		$id=$_GET['id'];		
		$email=$_GET['email'];
		$colonia=$_GET['colonia'];		
		$calle=$_GET['calle'];
		$numcasa=$_GET['numcasa'];
		$departamento=$_GET['departamento'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$insert = "INSERT INTO persona (PrimerNombre, PrimerApellido, Identidad, Email, Colonia, Calle, NumeroCasa, Departamento)
					VALUES('{$nombres}', '{$apellidos}','{$id}', '{$email}','{$colonia}', '{$calle}','{$numcasa}', '{$departamento}')";

		$resultado_insert=mysqli_query($conexion,$insert);

		if($resultado_insert){
		
			if($reg=mysqli_fetch_array($resultado_insert)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["nombres"]='No registra';
			$results["apellidos"]='No registra';
			$results["id"]='No registra';
			$results["email"]='No registra';
			$results["colonia"]='No registra';
			$results["calle"]='No registra';
			$results["numcasa"]='No registra';
			$results["departamento"]='No registra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
		$results["nombres"]='No registra';
		$results["apellidos"]='No registra';
		$results["id"]='No registra';
		$results["email"]='No registra';
		$results["colonia"]='No registra';
		$results["calle"]='No registra';
		$results["numcasa"]='No registra';
		$results["departamento"]='No registra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>