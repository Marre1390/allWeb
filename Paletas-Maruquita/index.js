var express = require("express");
var session = require("express-session");
var bodyParser = require("body-parser");
var mysql = require("mysql");
var app = express();

var credenciales ={
  user:"root",
  password:"database",
  database:"paletas_maruquita",
  host:"localhost",
  port:"3306"  
};

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

app.use(express.static("public"));
app.use(session({secret:"ASDFE$%#%",resave:true, saveUninitialized:true}));

//Verificar si existe una variable de sesion para poner publica la carpeta public admin
var publicAdmin = express.static("public-admin");

app.use(
    function(peticion,respuesta,next){
        if (peticion.session.user){
            if (peticion.session.idTipo_Usuario == 1)
                publicAdmin(peticion,respuesta,next);
        }
        else
            return next();
    }
);

///Para agregar seguridad a una ruta especifica:
function verificarAutenticacion(peticion, respuesta, next){
	if(peticion.session.correo)
		return next();
	else
		respuesta.send("ERROR, ACCESO NO AUTORIZADO");
}

app.post("/login", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT idTipo_Usuario, clave, contrasenia FROM Administradores WHERE clave=? and contrasenia=sha1(?)",
        [peticion.body.user, peticion.body.contrasenia],
        function(err, data, fields){
                if (data.length>0){
                    peticion.session.user = data[0].clave;
                    peticion.session.idTipo_Usuario = data[0].idTipo_Usuario;
                    data[0].estatus = 0;
                    respuesta.send(data[0]); 
                }else{
                    respuesta.send({estatus:1, mensaje: "Login fallido"}); 
                }
            	
         }
    ); 
});

app.get("/logout",function(peticion, respuesta){
	peticion.session.destroy();
	respuesta.send("Sesion eliminada");
});

app.get("/ruta-restringida",verificarAutenticacion,  function(peticion, respuesta){
    respuesta.send("Bienvenido a la ruta restringida");
});

app.listen(3000);