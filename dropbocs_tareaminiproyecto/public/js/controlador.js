$(document).ready(function(){
	console.log("El DOM ha sido cargado");
	directorio($("#hidden-code-carpeta").val());
	
});


function detalleRegistro(id){

	$("#modal-detalle").modal("show");
	$.ajax({
		url:"/detalle-archivo",
		dataType:"json",
		data: "codigo="+id,
		method:'POST',
		success:function(respuesta){
			$("#modal-detalles-archivo").html(
				'<table style="width: 100%;" class="table table-striped table-hover text-left">'+
					'<tr>'+
						'<td>Nombre de archivo:</td>'+
						'<td>'+respuesta[0].nombre_archivo+'</td'+
					'</tr>'+
					'<tr>'+
						'<td>Creacion:</td>'+
						'<td>'+respuesta[0].fecha_creacion+'</td'+
					'<t/r>'+
					'<tr>'+
						'<td>Modificacion:</td>'+
						'<td>'+respuesta[0].fecha_modificacion+'</td'+
					'</tr>'+
					'<tr>'+
						'<td>Usuario:</td>'+
						'<td>'+respuesta[0].usuario+'</td'+
					'</tr>'+
					'<tr>'+
						'<td>Tamaño:</td>'+
						'<td>'+respuesta[0].tamanio+'</td'+
					'</tr>'+
				'</table>'
			);
		}
	});
}



function directorio(id){

	cargarCarpetas(id);
	cargarArchivos(id);

	$.ajax({
		url:"/inicio",
		dataType:'json',
		method:"POST",
		success:function(respuesta){
			$("#carpeta_actual").html(respuesta[0].nombre_carpeta);
			$("#txt-carpeta-actual").val(respuesta[0].nombre_carpeta);
			$("#hidden-code-carpeta").val(id);
		}
	});

}

function directorioNoHome(id){
	$("#hidden-code-carpeta").val(id);
	
	$("#tr-carpetas").html(
	"<tr>"+
	"<th>Archivo</th>"+
	"<th>Ultima modificación</th>"+
	"<th>Usuario</th>"+
	"<th>Tamaño</th>"+
  	"</tr>"
	);

	$("#tr-archivos").html("");

	$.ajax({
		url:"/inicio",
		dataType:'json',
		method:"POST",
		success:function(respuesta){
			$("#carpeta_actual").append("/"+respuesta[id-1].nombre_carpeta);
			$("#txt-carpeta-actual").val(respuesta[id-1].nombre_carpeta);
			$("#hidden-code-carpeta").val(id);
		}
	});

	cargarCarpetas(id);
	cargarArchivos(id);
}

var cargarCarpetas = function(id){
	$.ajax({
		url:"/obtener-carpetas",
		dataType:"json",
		method:'POST',
		data:"codigo="+id,
		success:function(respuesta){
			for(var i=0; i< respuesta.length; i++){
				$("#tr-carpetas").append(
					'<tr>'+
					'<td><button onclick="directorioNoHome('+respuesta[i].codigo_carpeta+');" style="border:0; background: none; color: blue; padding: 0;">'+
					'<i class="fas fa-folder-open"></i>'+respuesta[i].nombre_carpeta+'</button></td>'+
					'<td>'+respuesta[i].fecha_modificacion+'</td>'+
					'<td>'+respuesta[i].usuario+'</td>'+
					'<td>'+respuesta[i].tamanio+'MB</td>'+
				  '</tr>'
				);
			}
		}
	});
}

function cargarArchivos(id){
	$.ajax({
		url:"/obtener-archivos",
		dataType:"json",
		method:'POST',
		data:"codigo="+id,
		success:function(respuesta){
			for(var i=0; i< respuesta.length; i++){
				$("#tr-archivos").append(
					'<tr>'+
					'<td><button class="btn btn-link" onclick="detalleRegistro('+respuesta[i].codigo_archivo+');"><i class="far fa-file"></i>'+respuesta[i].nombre_archivo+'</button></td>'+
					'<td>'+respuesta[i].fecha_modificacion+'</td>'+
					'<td>'+respuesta[i].usuario+'</td>'+
					'<td>'+respuesta[i].tamanio+'</td>'+
				  '</tr>'
				);
			}
		}
	});
}

var crearCarpeta = function(){
	var parametros = "nombreCarpeta="+$("#txt_nombre_carpeta").val()+"&usuario="+$("#txt_usuario").val()+"&tamanio="+$("#txt_tamanio").val()
					 +"&codigoCarpetaTop="+$("#hidden-code-carpeta").val();
	console.log(parametros);
	
	$.ajax({
		url:"/crear-carpeta",
		method:'POST',
		data:parametros,
		dataType:'json',
		success:function(respuesta){
			$("#tr-carpetas").append(
				'<tr>'+
				'<td><button onclick="directorioNoHome('+respuesta[0].codigo_carpeta+');" style="border:0; background: none; color: blue; padding: 0;">'+
				'<i class="fas fa-folder-open"></i>'+respuesta[0].nombre_carpeta+'</button></td>'+
				'<td>'+respuesta[0].fecha_modificacion+'</td>'+
				'<td>'+respuesta[0].usuario+'</td>'+
				'<td>'+respuesta[0].tamanio+'MB</td>'+
			  '</tr>'
			);
		}
	});
};


var crearArchivo = function(){
	var parametros = "nombreArchivo="+$("#txt_nombre_archivo").val()+"&usuarioArchivo="+$("#txt_usuario_archivo").val()+"&tamanioArchivo="+$("#txt_tamanio_archivo").val()
					 +"&codigoCarpeta="+$("#hidden-code-carpeta").val();
	console.log(parametros);
	
	$.ajax({
		url:"/crear-archivo",
		method:'POST',
		data:parametros,
		dataType:'json',
		success:function(respuesta){
			$("#tr-archivos").append(
				'<tr>'+
				'<td><button class="btn btn-link" onclick="detalleRegistro('+respuesta[0].codigo_archivo+');"><i class="far fa-file"></i>'+respuesta[0].nombre_archivo+'</button></td>'+
				'<td>'+respuesta[0].fecha_modificacion+'</td>'+
				'<td>'+respuesta[0].usuario+'</td>'+
				'<td>'+respuesta[0].tamanio+'</td>'+
			  '</tr>'
			);
		}
	});
};

