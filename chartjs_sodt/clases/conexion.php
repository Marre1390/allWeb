<?php
	require_once "parametros.php";
	$conexion = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);

	$consulta = '';

	if($conexion->connect_errno){
		echo 'Error en la conexion...';
		exit;
	}

	funcion Consulta(){
		global $conexion, $consulta;
		$sql = 'SELECT cod_servicio_pk, txt_servicio, num_duración, cod_tipo_servicio_fk  FROM tbl_servicio';
		return $conexion->query($sql);
	}
?>