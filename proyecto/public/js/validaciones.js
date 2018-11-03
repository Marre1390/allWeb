$(document).ready(function(){
	cargarTitulos();
	cargarCampus();
	cargarTipoClases();	
	cargarEdificios();
	cargarFacultades();
	cargarCarreras();

	cargarGradosSelect();
	cargarFacultadesSelect();
	cargarCampusSelect();
});

function cerrarSesion(){
	$.ajax({
		url:"/logout",
		success:function(respuesta){
			if(respuesta.status == 1)
				window.location.href = "index.html";
		}
	});
}

/*---------- Begin Validaciones--------*/
function validar(){
	validarIdentidad($("#txt_identidad"));
	validarRadioBoton($("input:radio[name=rbt_genero]:checked").val(), $("#rbt_obligatorio_genero"));
	validarRadioBoton($("input:radio[name=rbt_ocupacion]:checked").val(), $("#rbt_obligatorio_ocupacion"));
	validarRadioBoton($("input:radio[name=rbt_estado_civil]:checked").val(), $("#rbt_obligatorio_estado"));
	validarRadioBoton($("input:radio[name=rbt_nacionalidad]:checked").val(), $("#rbt_obligatorio_nacionalidad"));
	validarNombreApellido($("#txt_nombre"));
	validarNombreApellido($("#txt_apellido"));
	validarTelefono($("#txt_tel_casa"));
	validarTelefono($("#txt_tel_celular"));
	validarFecha($("#fecha_nacimiento"));
}

var validarIdentidad = function(id){
	
	var exp_identidad = /^(\d{4}-\d{4}-\d{5}$)/;

	if(!(id.val() == "") & exp_identidad.test(String(id.val()))){
		id.removeClass('is-invalid');
		id.addClass('is-valid');
	}
	else{
		id.removeClass('is-valid');
		id.addClass('is-invalid');
	}
	
}

var validarNumeros = function(id){
	var exp_identidad = /^([0-9])*$/;

	if(!(id.val() == "") & exp_identidad.test(String(id.val()))){
		id.removeClass('is-invalid');
		id.addClass('is-valid');
		return true;
	}
	else{
		id.removeClass('is-valid');
		id.addClass('is-invalid');
		return false;
	}
}

function validarNombreApellido(id){
	var exp_nombre_apellido = /^[A-Za-z+][\s[A-Za-z]+]*$/;

	if(!(id.val() == "") && exp_nombre_apellido.test(String(id.val()))){
		id.removeClass('is-invalid');
		id.addClass('is-valid');
		return true;
	}
	else{
		id.removeClass('is-valid');
		id.addClass('is-invalid');
		return false;
	}
}

function validarRadioBoton(name, id){
	if(name == null){
		id.html('<div style="color: red;">*</div');
	}
	else{
		id.html('');
	}
}

function validarTelefono(id){
	var exp_telefonos = /^(\d{4}-\d{4}$)/;

	if(!(id.val() == "") & exp_telefonos.test(String(id.val()))){
		id.removeClass('is-invalid');
		id.addClass('is-valid');
	}
	else{
		id.removeClass('is-valid');
		id.addClass('is-invalid');
	}
}

function validarFecha(id){
	var exp_fecha = /(\d{4})(\-)(0[1-9]|1[012])(\-)(\d{2})$/;

	if(!(id.val() == "") & exp_fecha.test(String(id.val()))){
		id.removeClass('is-invalid');
		id.addClass('is-valid');
		var edad = calcularEdad(id.val());
		$("#txt_edad").val(edad);
	}
	else{
		id.removeClass('is-valid');
		id.addClass('is-invalid');
	}
}

function calcularEdad(fecha) {
    var hoy = new Date();
    var cumpleanos = new Date(fecha);
    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    var m = hoy.getMonth() - cumpleanos.getMonth();

    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }

    return edad;
}