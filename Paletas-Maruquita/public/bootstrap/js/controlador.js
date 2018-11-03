$("#btn-login").click(function(){
    $.ajax({
        url:"/login",
        data:"user="+$("#usuario").val()+"&contrasenia="+$("#contrasena").val(),
        method:"POST",
        dataType:"json",
        success:function(respuesta){
            if (respuesta.estatus ==0 ){
                window.location.href ="home.html";
            }
            else
                alert("Credenciales incorrectas");
        }
    });
});