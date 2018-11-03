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
	if(isset($_GET["nombre"]) && isset($_GET["apellidos"]) && isset($_GET["tel"]) && isset($_GET["email"]) && isset($_GET["tel_emp"]) && isset($_GET["nombre_emp"])){
		
		$nombre=$_GET['nombre'];		
		$apellidos=$_GET['apellidos'];
		$tel=$_GET['tel'];		
		$email=$_GET['email'];
		$tel_emp=$_GET['tel_emp'];		
		$nombre_emp=$_GET['nombre_emp'];
		
		$conexion=mysqli_connect($hostname,$username,$password,$database);
		
		$insert = "INSERT INTO proveedor (Nombre, Apellido, Telefono, Email, NombreEmpresa, TelefonoEmpresa)
					VALUES('{$nombre}',
					'{$apellidos}', '{$tel}', '{$email}', '{$nombre_emp}', '{$tel_emp}')";

		$resultado=mysqli_query($conexion,$insert);

		if($resultado){
		
			if($reg=mysqli_fetch_array($resultado)){
				$json['datos'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}
		else{
			$results["nombre"]='No registra';
			$results["apellidos"]='No registra';
			$results["tel"]='No resgistra';
			$results["email"]='No resgistra';
			$results["tel_emp"]='No resgistra';
			$results["nombre_emp"]='No resgistra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
			$results["nombre"]='No registra';
			$results["apellidos"]='No registra';
			$results["tel"]='No resgistra';
			$results["email"]='No resgistra';
			$results["tel_emp"]='No resgistra';
			$results["nombre_emp"]='No resgistra';
			$json['datos'][]=$results;
			echo json_encode($json);
		}
?>