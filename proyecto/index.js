var express = require("express");
var app = express();
var estudiante = require("./estudiante");
var session = require('express-session');
var mysql = require("mysql");
var bodyParser = require("body-parser");

app.use("/estudiante", estudiante);
app.use(express.static("public"));
app.use(session({secret:"ASDFE$%#%",resave:true, saveUninitialized:true}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var publicAdmin = express.static("public-admin");
var publicEstudiante = express.static("public-estudiante");

app.use(
    function(peticion,respuesta,next){
        if (peticion.session.clave){
            if(peticion.session.codigo_tipo_empleado == 1)
                publicAdmin(peticion,respuesta,next);
            else if(peticion.session.codigo_tipo_empleado == 6)
                publicEstudiante(peticion, respuesta, next);
        }
        else
            return next();
    }
);

var credenciales = {
    user:"root",
    host:"localhost",
    password:"database",
    port:"3306",
    database:"BD_UNAH"
};

// Peticiones del modulo del administrador 
app.post("/accesar_empleado", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.connect();
    conexion.query("SELECT codigo_empleado, clave_empleado, codigo_tipo_empleado ,contrasenia FROM Empleados WHERE clave_empleado=? and contrasenia=sha1(?)",
        [peticion.body.clave, peticion.body.pass],
        function(err, data, fields){
                if(err) throw err;
                if (data.length>0){
                    peticion.session.clave = data[0].clave_empleado;
                    peticion.session.codigo_tipo_empleado = data[0].codigo_tipo_empleado;
                    data[0].status = 0;
                    respuesta.send(data[0]); 
                }
                else{
                    respuesta.send({status:1, mensaje:'Login fallido'});
                }
            conexion.end();
         }
    ); 
});

app.post("/agrega-carrera",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("INSERT INTO Carreras(nombre_carrera, cantidad_asignaturas, codigo_grado, codigo_facultad) "+
                        "VALUES(?,?,?,?)",
                        [
                            peticion.body.carrera,
                            peticion.body.cantidad,
                            peticion.body.codigoGrado,
                            peticion.body.codigoFacultad
                        ],
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);

app.post("/agrega-titulo",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("INSERT INTO Titulos(nombre_titulo) VALUES(?)", peticion.body.titulo,
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);

app.post("/agrega-campus",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("INSERT INTO Campus(nombre_campus) VALUES(?)", peticion.body.campus,
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);

app.post("/agrega-tipo-asignatura",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("INSERT INTO Tipo_Asignaturas(tipo_asignatura) VALUES(?)", peticion.body.tipo_asignatura,
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);

app.post("/agrega-edificio",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("insert into Edificios(nombre_edificio, alias, codigo_campus) values(?,?,?);", [peticion.body.edificio, peticion.body.alias, peticion.body.codigo_campus],
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);

app.post("/agrega-facultad",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.connect();
        conexion.query("insert into Facultades(nombre_facultad, descripcion) values(?,?);", [peticion.body.facultad, peticion.body.descripcion],
        function(error, info, campos){
            respuesta.send(info);
        });
        conexion.end();
    }
);


app.get("/listar-titulos", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT nombre_titulo FROM Titulos;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-tipos-clases", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT tipo_asignatura FROM Tipo_Asignaturas;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-facultades", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT nombre_facultad FROM Facultades;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-campus", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT nombre_campus FROM Campus;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-grados", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT nombre_grado FROM Grados;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-edificios", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT nombre_edificio FROM Edificios;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

app.post("/listar-carreras", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "SELECT A.nombre_carrera, A.cantidad_asignaturas, F.nombre_facultad, A.nombre_grado "+
        "FROM "+
        "Facultades F INNER JOIN "+
        "(SELECT C.nombre_carrera, C.cantidad_asignaturas, G.nombre_grado, C.codigo_facultad "+
        "FROM Carreras C inner join Grados G "+
        "ON C.codigo_grado = G.codigo_grado) A "+
        "ON F.codigo_facultad = A.codigo_facultad;",
        function(error, info, campos){
            respuesta.send(info);
        }
    );
});

 app.get("/logout",function(peticion, respuesta){
    peticion.session.destroy();
	respuesta.send({status:1});
});

app.listen(3000);