var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var mysql = require("mysql");
var fs = require("fs");

app.use(express.static("public"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : true}));

var credenciales = {
    user:'root',
    password:'database',
    port:'3306',
    host:'localhost',
    database:'db_dropbox'
}

app.post("/inicio", function(peticion, respuesta){
    var conexion = mysql.createConnection(credenciales);
    conexion.query("select codigo_carpeta, nombre_carpeta "+
                    "from Carpetas",
    function(error, info, campos){
        respuesta.send(info);
    });
});

app.post("/obtener-carpetas",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.query("select codigo_carpeta, nombre_carpeta,fecha_modificacion, usuario, tamanio, codigo_carpeta_top "+
                       "from Carpetas where codigo_carpeta_top = ?", peticion.body.codigo,
            function(error, info, campos){
                respuesta.send(info);
            }
        );
    }
);

app.post("/obtener-archivos",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.query("select * "+
                       "from Archivos where codigo_carpeta = ?", peticion.body.codigo, 
            function(error, info, campos){
                respuesta.send(info);
            }
        );
    }
);

app.post("/detalle-archivo",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.query("select * "+
                       "from Archivos where codigo_archivo = ?", peticion.body.codigo, 
            function(error, info, campos){
                respuesta.send(info);
            }
        );
    }
);

app.post("/crear-carpeta",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.query("INSERT INTO Carpetas(nombre_carpeta, fecha_creacion, fecha_modificacion, usuario, tamanio, "+
                        "codigo_tp_carpeta, codigo_carpeta_top) VALUES(?,sysdate(),sysdate(),?,?,2,?);",
                        [
                            peticion.body.nombreCarpeta,
                            peticion.body.usuario,
                            peticion.body.tamanio,
                            peticion.body.codigoCarpetaTop
                        ],
            function(error, resultado){
                if(resultado.affectedRows == 1){
                    conexion.query('select nombre_carpeta, fecha_creacion, fecha_modificacion, '+
                                    'tamanio, usuario FROM Carpetas where codigo_carpeta = ?', resultado.insertId,
                        function(err, info, campos){
                            if(err) throw err;
                            conexion.end();
                            respuesta.send(info);
                        }
                    );
                }
            }
        );
        //Creacion de la carpeta en el directorio
        /*fs.mkdir('/public/data/'+peticion.body.carpetaActual+'/'+peticion.body.nombreCarpeta, function(err){
            if(err){
                return console.error(err);
            }
            alert("La carpeta se ha creado satisfactoriamente");
        });*/
    }
);


app.post("/crear-archivo",
    function(peticion, respuesta){
        var conexion = mysql.createConnection(credenciales);
        conexion.query("INSERT INTO Archivos(nombre_archivo, fecha_creacion, fecha_modificacion, usuario, tamanio, "+
                        "codigo_carpeta) VALUES(?,sysdate(),sysdate(),?,?,?);",
                        [
                            peticion.body.nombreArchivo,
                            peticion.body.usuarioArchivo,
                            peticion.body.tamanioArchivo,
                            peticion.body.codigoCarpeta
                        ],
            function(error, resultado){
                if(resultado.affectedRows == 1){
                    conexion.query('select codigo_archivo, nombre_archivo, fecha_creacion, fecha_modificacion, '+
                                    'tamanio, usuario FROM Archivos where codigo_carpeta = ?', resultado.insertId,
                        function(err, info, campos){
                            if(err) throw err;
                            conexion.end();
                            respuesta.send(info);
                        }
                    );
                }
            }
        );
        //Creacion de la carpeta en el directorio
        /*fs.mkdir('/public/data/'+peticion.body.carpetaActual+'/'+peticion.body.nombreCarpeta, function(err){
            if(err){
                return console.error(err);
            }
            alert("La carpeta se ha creado satisfactoriamente");
        });*/
    }
);


app.listen(3000);