function cargarTitulos(){
	$.ajax({
		url:"/listar-titulos",
		dataType:"json",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#listado-titulos").append(
					"<h4>"+(i+1)+". "+respuesta[i].nombre_titulo+"</h4>"
				);
			}
		}
	});
}

function cargarCarreras(){
	$.ajax({
		url:"/listar-carreras",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			$("#listado-carreras").html("<table class='table table-striped table-hover' border='2px'>" +
										"<thead id='tbl-carreras'><th>Nombre de Carrera</th><th>cantidad asignaturas</th><th>Nombre facultad</th><th>Nombre de grado</th></thead>"
									);
			for(var i=0; i<respuesta.length; i++){				
				$("#tbl-carreras").append(
					"<tr><td><h5>"+(i+1)+". "+respuesta[i].nombre_carrera+"</h5></td>"+
						"<td><h5>"+respuesta[i].cantidad_asignaturas+"</h5></td>"+
						"<td><h5>"+respuesta[i].nombre_facultad+"</h5></td>"+
						"<td><h5>"+respuesta[i].nombre_grado+"</h5></td>"+
					"</tr>"
				);
			}
			$("#listado-carreras").append("</table>");
		}
	});
}

function cargarCampus(){
	$.ajax({
		url:"/listar-campus",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#listado-campus").append(
					"<h4>"+(i+1)+". "+respuesta[i].nombre_campus+"</h4>"
				);
			}
		}
	});
}

function cargarTipoClases(){
	$.ajax({
		url:"/listar-tipos-clases",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#listado-tipo-clase").append(
					"<h4>"+(i+1)+". "+respuesta[i].tipo_asignatura+"</h4>"
				);
			}
		}
	});
}

function cargarEdificios(){
	$.ajax({
		url:"/listar-edificios",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#listado-edificios").append(
					"<h4>"+(i+1)+". "+respuesta[i].nombre_edificio+"</h4>"
				);
			}
		}
	});
}

function cargarFacultades(){
	$.ajax({
		url:"/listar-facultades",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#listado-facultades").append(
					"<h4>"+(i+1)+". "+respuesta[i].nombre_facultad+"</h4>"
				);
			}
		}
	});
}

function cargarCampusSelect(){
	$.ajax({
		url:"/listar-campus",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#opcionCampus").append(
					"<option value='"+(i+1)+"'>"+respuesta[i].nombre_campus+"</option>"
				);
			}
		}
	});
}

function cargarGradosSelect(){
	$.ajax({
		url:"/listar-grados",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#slc-grado").append(
					"<option value='"+(i+1)+"'>"+respuesta[i].nombre_grado+"</option>"
				);
			}
		}
	});
}

function cargarFacultadesSelect(){
	$.ajax({
		url:"/listar-facultades",
		dataType:"json",
		method:"POST",
		success:function(respuesta){
			for(var i=0; i<respuesta.length; i++){
				$("#slc-facultad").append(
					"<option value='"+(i+1)+"'>"+respuesta[i].nombre_facultad+"</option>"
				);
			}
		}
	});
}


$("#btn-login-empleado").click(function(){

	if($("#clave_empleado").val() == "" && $("#contrasena_empleado").val()==""){
		$("#clave_empleado").addClass("is-invalid");
		$("#contrasena_empleado").addClass("is-invalid");
	}
	else if($("#contrasena_empleado").val()== ""){
		$("#clave_empleado").removeClass("is-invalid");
		$("#contrasena_empleado").addClass("is-invalid");
	}
	else if($("#clave_empleado").val()== ""){
		$("#contrasena_empleado").removeClass("is-invalid");
		$("#clave_empleado").addClass("is-invalid");
	}
	else{
		$("#contrasena_empleado").removeClass("is-invalid");
		$("#clave_empleado").removeClass("is-invalid");
		$("#contrasena_empleado").addClass("is-valid");
		$("#clave_empleado").addClass("is-valid");
		var parametros = "clave="+$("#clave_empleado").val() + "&pass="+$("#contrasena_empleado").val();
		$.ajax({
			data:parametros,
			method:'POST',
			dataType:'json',
			url:'/accesar_empleado',
			success:function(respuesta){
				if (respuesta.status == 0 )
					window.location.href ="index-admin.html";
			}
		});
	}
});

$("#btn-crear-titulo").click(function(){
	var verificarCampoTitulo= validarNombreApellido($("#txt_titulo"));
		if(verificarCampoTitulo){

		$.ajax({
			url:"/agrega-titulo",
			data: "titulo="+$("#txt_titulo").val(),
			method:"POST",
			success:function(respuesta){
				$("#txt_titulo").val("");
				$("#listado-titulos").html("");
				cargarTitulos();
			}
		});
	}
});

$("#btn-crear-carrera").click(function(){
	var verificarCampoCarrera= validarNombreApellido($("#txt_carrera"));
	var verificarCampoCantidadClases = validarNumeros($("#txt_cantidad_asignatura"));

	if(verificarCampoCarrera && verificarCampoCantidadClases){
		var parametros = "codigoFacultad="+$("select[name=opcion_facultad]").val()+"&codigoGrado="+$("select[name=opcion_grado]").val()
							+"&carrera="+$("#txt_carrera").val()+"&cantidad="+$("#txt_cantidad_asignatura").val();

		$.ajax({
			url:"/agrega-carrera",
			data: parametros,
			method:"POST",
			success:function(respuesta){
				$("#txt_carrera").val("");
				$("#txt_cantidad_asignatura").val("");
				$("#listado-carreras").html("");
				cargarCarreras();
			}
		});
	}
});

$("#btn-crear-campus").click(function(){
	var verificarCampoCampus = validarNombreApellido($("#txt_campu"));

	if(verificarCampoCampus){

		$.ajax({
			url:"/agrega-campus",
			data: "campus="+$("#txt_campu").val(),
			method:"POST",
			success:function(respuesta){
				$("#txt_campu").val("");
				$("#listado-campus").html("");
				cargarCampus();
			}
		});
	}
});

$("#btn-crear-edificio").click(function(){
	var verificarCampoEdificio = validarNombreApellido($("#txt_nombre_edificio"));

	if(verificarCampoEdificio){
		var parametros = "codigo_campus="+$("select[name=slc-campus]").val()+"&edificio="+$("#txt_nombre_edificio").val()+"&alias="+$("#txt_alias").val();

		$.ajax({
			url:"/agrega-edificio",
			data: parametros,
			method:"POST",
			success:function(respuesta){
				$("#txt_nombre_edificio").val("");
				$("#txt_alias").val("");
				$("#listado-edificios").html("");
				cargarEdificios();
			}
		});
	}
});

$("#btn-crear-tipo-asignatura").click(function(){
	var verificarCampoTipoAsignatura = validarNombreApellido($("#txt_tipo_clase"));

	if(verificarCampoTipoAsignatura){
		var parametro= "tipo_asignatura="+$("#txt_tipo_clase").val();

		$.ajax({
			url:"/agrega-tipo-asignatura",
			data: parametro,
			method:"POST",
			success:function(respuesta){
				$("#txt_tipo_clase").val("");
				$("#listado-tipo-clase").html("");
				cargarTipoClases();
			}
		});
	}
});

$("#btn-crear-facultad").click(function(){
	var verificarCampoFacultad = validarNombreApellido($("#txt_nombre_facultad"));

	if(verificarCampoFacultad){
		var parametro= "facultad="+$("#txt_nombre_facultad").val()+"&descripcion="+$("#txt_descripcion_facultad").val();

		$.ajax({
			url:"/agrega-facultad",
			data: parametro,
			method:"POST",
			success:function(respuesta){
				$("#txt_nombre_facultad").val("");
				$("#txt_descripcion_facultad").val("");
				$("#listado-facultades").html("");
				cargarFacultades();
			}
		});
	}
});