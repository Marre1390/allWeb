<?php

define('HOST', 'localhost');
define('USER', 'root');
define('PASS', 'database');
define('DB', 'RESTAURANTE');

$con = mysqli_connect(HOST, USER, PASS, DB ) or die ('No se pudo conectar');


?>