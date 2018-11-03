var express = require("express");
var router = express.Router();


router.post("/estudiante/login", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT codigo_tipo_empleado, numero_cuenta, contrasenia FROM Alumnos WHERE numero_cuenta=? and contrasenia=sha1(?)",
        [peticion.body.clave, peticion.body.pass],
        function(err, data, fields){
                if(err) throw err;
                if (data.length>0){
                    peticion.session.clave = data[0].numero_cuenta;
                    peticion.session.codigo_tipo_empleado = data[0].codigo_tipo_empleado;
                    data[0].status = 0;
                    respuesta.send(data[0]); 
                }
                else{
                    respuesta.send({status:1, mensaje:'Login fallido'});
                }
         }    
    ); 
});

router.post("/cargar_perfil",
    function(peticion, respuesta){
        respuesta.send("Exitoso");
    }
);

module.exports = router;