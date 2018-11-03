$(document).ready(function(){
	cargarPerfil();
});

function cargarPerfil(){
    $.ajax({
        url:'/cargar_perfil',
        method:"POST",
        success:function(respuesta){
            console.log(respuesta);
        }
    });
}

$("#btn-login-estudiante").click(function(){

	if($("#cuenta").val() == "" && $("#contrasenia-estudiante").val()==""){
		$("#cuenta").addClass("is-invalid");
		$("#contrasenia-estudiante").addClass("is-invalid");
	}
	else if($("#contrasenia-estudiante").val()== ""){
		$("#cuenta").removeClass("is-invalid");
		$("#contrasenia-estudiante").addClass("is-invalid");
	}
	else if($("#cuenta").val()== ""){
		$("#contrasenia-estudiante").removeClass("is-invalid");
		$("#cuenta").addClass("is-invalid");
	}
	else{
		$("#contrasenia-estudiante").removeClass("is-invalid");
		$("#cuenta").removeClass("is-invalid");
		$("#contrasenia-estudiante").addClass("is-valid");
        $("#cuenta").addClass("is-valid");
        
        var parametros = "clave="+$("#cuenta").val() + "&pass="+$("#contrasenia-estudiante").val();
        console.log(parametros);
		$.ajax({
            url:'/estudiante/login',
			data:parametros,
			method:'POST',
			dataType:'json',
			success:function(respuesta){
                alert(respuesta);
			}
		});
	}
});