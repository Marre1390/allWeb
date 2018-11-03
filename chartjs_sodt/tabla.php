<?php
	require_once "clases/conexion.php";
	/*$obj = new conexion();
	$conexion = $obj->conectar();

	$sql = 'SELECT cod_servicio_pk, txt_servicio, num_duración, cod_tipo_servicio_fk  FROM tbl_servicio';

	$result = mysqli_query($conexion, $sql);*/
?>

<div>
	<table class="table table-hover table-condensed" id="iddatatable">
		<thead style="background-color: black; color: white; font-weight: bold;">
			<tr>
				<td>Servicio</td>
				<td>Mes 1</td>
				<td>Mes 2</td>
			</tr>
		</thead>
		<tfoot style="background-color: #ccc; color: white; font-weight: bold;">
			<tr>
				<td>Servicio</td>
				<td>Mes 1</td>
				<td>Mes 2</td>
			</tr>
		</tfoot>
		<tbody>
			<?php while($mostrar = mysql_fetch_row($result)) { ?>
			<tr>
				<td><?php echo $mostrar[1] ?></td>
				<td><?php echo $mostrar[2] ?></td>
				<td><?php echo $mostrar[3] ?></td>			
			</tr>
			<?php } ?>
		</tbody>
		
	</table>
</div>