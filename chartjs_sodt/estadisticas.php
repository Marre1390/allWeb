<?php
session_start();
if(!isset($_SESSION['codigo'])){
  session_destroy();
  header("Location: ../index.php");
}
if(isset($_SESSION['rol'])){
  if($_SESSION['rol'] != 'administrador' && $_SESSION['rol'] != 'técnico'){
    session_destroy();
    header("Location: ../index.php");
  }
}
?>

<!DOCTYPE html>
<html>

<head>  
  <title>SODT</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Hojas de estilo -->
  <!-- W3 CSS -->
  <link rel="stylesheet" href="css/w3css.css">
  <!-- Font awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Bootstrap 3-->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Plugin para la ayuda-->
  <link rel="stylesheet" href="../plugins/intro.js/introjs.css">
  <!-- Estilos magicsuggest plugin .css -->
  <link href="../plugins/magicsuggest/magicsuggest.css" rel="stylesheet">
  <!-- Datatables -->
  <link rel="stylesheet" type="text/css" href="../plugins/datatables/datatables.min.css">
  <!-- Animate.css -->
  <link rel="stylesheet" href="css/animate.css">
  <!-- Icomoon Icon Fonts-->
  <link rel="stylesheet" href="css/icomoon.css">
  <!-- Magnific Popup -->
  <link rel="stylesheet" href="css/magnific-popup.css">
  <!-- Owl Carousel -->
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <!-- Theme style  -->
  <link rel="stylesheet" href="css/style.css">
  <!-- Datetime picker -->
  <link rel="stylesheet" type="text/css" href="../plugins/datetimepicker/build/css/bootstrap-datetimepicker.min.css">
  <!-- Estilos generales -->
  <link rel="stylesheet" type="text/css" href="css/generales.css">

  <style>
        /*//////////////////////////////////////////////////////////////////////////////////////////////////*/
/*////////////////////////////////////////ESTILOS SIDEBAR///////////////////////////////////////////*/

  body {
      padding-top: 50px;
  }

  html,
  body {
      overflow-x: hidden; /* Prevent scroll on narrow devices */
      height: 100%;
  }
  body {
      padding-top: 70px;
  }
  footer {
      padding: 30px 0;
  }

  @media screen and (min-width: 992px) {
  /* @media screen and (min-width: 768px) { */
      #sidebar {
        display: block;
      }

      #btn-menu {
        display: none;
      }

      .row-offcanvas {
          position: relative;
          -webkit-transition: all .25s ease-out;
          -moz-transition: all .25s ease-out;
                  transition: all .25s ease-out;
      }

      .row-offcanvas-right {
          right: 25%;
      }

      .row-offcanvas-left {
          left: 25%;
      }

      .row-offcanvas-right .sidebar-offcanvas {
          right: -25%; /* 3 columns */
          /*background-color: rgb(255, 255, 255);*/
          background-color: transparent;
      }

      .row-offcanvas-left .sidebar-offcanvas {
          left: -25%; /* 3 columns */
          /*background-color: rgb(255, 255, 255);*/
          background-color: transparent;
      }

      .row-offcanvas-right.active {
          right: 0; /* 3 columns */
      }

      .row-offcanvas-left.active {
          left: 0; /* 3 columns */
      }

      .row-offcanvas-right.active .sidebar-offcanvas {
          /*background-color: rgb(254, 254, 254);*/
          background-color: transparent;
      }
      .row-offcanvas-left.active .sidebar-offcanvas {
          /*background-color: rgb(254, 254, 254);*/
          background-color: transparent;
      }

      .row-offcanvas .content {
          width: 75%; /* 9 columns */
          -webkit-transition: all .25s ease-out;
          -moz-transition: all .25s ease-out;
                  transition: all .25s ease-out;

      }

      .row-offcanvas.active .content {
          width: 100%; /* 12 columns */
      }
          
      .sidebar-offcanvas {
          position: absolute;
          top: 0;
          width: 25%; /* 3 columns */
      }
  }
  @media screen and (max-width: 991px) {
  /* @media screen and (max-width: 767px) { */
      #sidebar {
        display: none;
      }

      #btn-menu {
        display: block;
      }

      .row-offcanvas {
          position: relative;
          -webkit-transition: all .25s ease-out;
          -moz-transition: all .25s ease-out;
                  transition: all .25s ease-out;
      }

      .row-offcanvas-right {
          right: 0;
      }

      .row-offcanvas-left {
          left: 0;
      }

      .row-offcanvas-right
      .sidebar-offcanvas {
          right: -50%; /* 6 columns */
      }

      .row-offcanvas-left
      .sidebar-offcanvas {
          left: -50%; /* 6 columns */
      }

      .row-offcanvas-right.active {
          right: 50%; /* 6 columns */
      }

      .row-offcanvas-left.active {
          left: 50%; /* 6 columns */
      }

      .sidebar-offcanvas {
          position: absolute;
          top: 0;
          width: 50%; /* 6 columns */
      }
  }

/*//////////////////////////////////////////////////////////////////////////////////////////////////*/
/*//////////////////////////////////////////////////////////////////////////////////////////////////*/
  </style>
</head>


<body class="w3-light-gray">


  <nav class="navbar navbar-expand-lg navbar-light bg-light col-md-12" style="background-color: #343a40; position: fixed;
      top: 0;
      right: 0;
      left: 0;
      z-index: 1030;">
    <a class="navbar-brand" href=<?php
            if($_SESSION['rol'] == 'administrador'){
              echo '../index.php';
            }else{
              echo 'tecnico_principal.php';
            }
            ?>><span style="color: white">SODT</span></a>
    <button class="navbar-toggler btn-outline visible-xs-block hidden-sm hidden-md hidden-lg hidden-xl" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" 
      aria-expanded="false" aria-label="Toggle navigation" style="float: right; margin-top: 8px;">
      <i class="fa fa-bars" style="font-size:24px"></i>
      <!-- <span class="navbar-toggler-icon"></span> -->
    </button>
    <div class="collapse navbar-collapse" id="navbarNav" style="float: right; margin-top: 8px;">
      <ul class="navbar-nav">
        <li class="nav-item active" style="margin: 0px 15px; color: transparent;">
          <a class="nav-link" href=<?php
            if($_SESSION['rol'] == 'administrador'){
              echo '../index.php';
            }else{
              echo 'tecnico_principal.php';
            }
            ?>><span style="color: white">Solicitudes</span></a>
        </li>
        <li class="nav-item" style="margin: 0px 15px; color: transparent;">
          <a class="nav-link" href="#"><span style="color: white">Estadísticas</span></a>
        </li>
        <li class="nav-item" style="margin: 0px 15px; color: transparent;">
          <a class="nav-link" href="inventario.php"><span style="color: white">Inventario</span></a>
        </li>
        <li class="nav-item" style="margin: 0px 15px; color: transparent;">
          <a class="nav-link disabled" href="personal.php"><span style="color: white"><?php if($_SESSION['rol'] == 'administrador') echo 'Personal';?></span></a>
        </li>
        <li class="nav-item" style="margin: 0px 15px; color: transparent;">
          <a class="btn btn-outline btn-success nav-link" href="../php/logout.php" style="padding: 5px 15px 5px 15px; border: 2px solid dimgrey;"><span style="color: white">Salir</span></a>
        </li>
      </ul>
    </div>
  </nav>

<!-- New sidebar/menu-->
<div class="row row-offcanvas row-offcanvas-left">
    <div class="col-xs-12 col-sm-12 sidebar-offcanvas" id="sidebar" role="navigation" style="position: fixed; left: 0; top: 52px;
      overflow: auto; height: 100%; z-index: 1; background-color: #fff; padding-top: 30px;">
    <!-- <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation"> -->
    <div class="w3-container w3-row" style="padding: 0;">
    <div class="col-xl-4 col-lg-4 col-md-12 col-sm-4 col-xs-12 s4" style="padding: 0;">
      <img src="images/upn_perfil.png" class="w3-circle w3-margin-right" style="width:90px">
    </div>
    <div class="col-xl-8 col-lg-8 col-md-12 col-sm-8 col-xs-12 s8 w3-bar" style="padding: 0;">
      <span>Bienvenido(a), <strong><?php echo $_SESSION['nombre'] ?> </strong></span><br>
      <a data-step="1" data-intro="Al hacer click aqui, entrara a las opciones de edición de su perfil propio" title="Edita tu perfil" href="editar_perfil.php" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a data-step="2" data-intro="Visualizacion de registros de todas las actividades en general" href="#" title="Revisa los registros de actividad" class="w3-bar-item w3-button"><i class="fa fa-book"></i></a>
      <a title="Guia de ayuda" class="w3-bar-item w3-button" onclick=""><i class="fa fa-question-circle"></i></a>
      <!-- <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a> -->
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>ESTADÍSTICAS</h5>
  </div>
  <div class="w3-bar-block">
    <!-- <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a> -->
    <a href="#" class="w3-bar-item w3-button w3-padding" id="link-todos-invent"><img src="../html/iconos/checklist.png" class="w3-margin-right" style="width: 40px; margin-left: 0px;"> SOLICITUDES </a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><img src="../html/iconos/clock.png" class="w3-margin-right" style="width: 30px; margin-left: 5px; margin-right: 5px;">  RENDIMIENTO</a>
  </div>
    </div><!--/span-->
    <div class="col-xs-12 content" style="margin-left: 20px;">
    <!-- <div class="col-xs-12 col-sm-9 content"> -->
        <p class="pull-left">
            <!-- <button type="button" class="btn btn-secundary btn-outline btn-xs hidden-md visible-sm visible-xs" id="btn-menu" 
              data-toggle="offcanvas" style="border-radius: 3px; padding: 5px 10px;"> -->
            <button type="button" class="btn btn-secundary btn-outline btn-xs" id="btn-menu"
              data-toggle="offcanvas" style="border-radius: 3px; padding: 5px 10px; position: fixed; top: 70px; z-index: 2; 
              color: rgba(0, 0, 0, .25); border-color: rgba(0, 0, 0, .25)">
              <i class="fa fa-bars"></i> 
            </button>
        </p>

        <!-- Aqui va el contenido principal -->
        <!-- !PAGE CONTENT! -->
        <div style="margin-left:0px;  margin-right: 15px;"> 
          <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        
            <h2 class="w3-text-grey w3-padding-16 w3-container"><img src="../html/iconos/gráfico-combinado.png" class="w3-margin-right" >Estadísticas</h2>
            <hr class="w3-clear">
        
            <div class="col-sm-12">
              <h5>Contenido de las estadísticas, gráficos y demás.</h5>
            </div>
        
            <!-- Footer -->
            <footer class="w3-container w3-padding-16 w3-light-grey">
              <h4>FOOTER</h4>
              <p>Powered by <a href="" target="_blank">w3.css</a></p>
            </footer>
        
          <!-- End page content -->
          </div>
        </div>
    </div><!--/span-->
</div><!--/row-->


<script>
  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");

  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");

  // Toggle between showing and hiding the sidebar, and add overlay effect
  function w3_open() {
      if (mySidebar.style.display === 'block') {
          mySidebar.style.display = 'none';
          overlayBg.style.display = "none";
      } else {
          mySidebar.style.display = 'block';
          overlayBg.style.display = "block";
      }
  }

  // Close the sidebar with the close button
  function w3_close() {
      mySidebar.style.display = "none";
      overlayBg.style.display = "none";
  }
</script>

<script src="../html/js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="../plugins/moment/moment.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="../plugins/intro.js/intro.js"></script>
<script type="text/javascript" src="../plugins/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="../plugins/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="../plugins/datatables/datatables.min.js"></script>
<script src="../plugins/datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="../plugins/magicsuggest/magicsuggest.js"></script>

<!-- Script del sidebar -->
<script>
    var displayMenu = '';
    var displaySidebar = '';

    $(document).ready(function () {
      $('[data-toggle=offcanvas]').click(function () {
        ejecutarMenu();
      });
    });

    $(document).ready(function () {
      $('#btn-menu').click(function () {
        if(($('#sidebar').css('display') == 'none')&&($('#btn-menu').css('display') == 'block')){
          $('#sidebar').css('display','block');
          displaySidebar = $('#sidebar').css('display');
          displayMenu = $('#btn-menu').css('display');
        }else{
          $('#sidebar').css('display','');
          displaySidebar = $('#sidebar').css('display');
          displayMenu = $('#btn-menu').css('display');
        }
      });

      $(window).resize(function(){
        //aqui el codigo que se ejecutara cuando se redimencione la ventana
        var ventana_ancho = $(window).width();
        //console.log(ventana_ancho);
        if(ventana_ancho>=992){
          //console.log("Se ejecuto la primera funcion");
          $('#sidebar').css('display','');
          if((displaySidebar == 'block')&&(displayMenu == 'block')){
            //console.log("Se ejecuto la segunda funcion");
            ejecutarMenu();
            displaySidebar = '';
            displayMenu = '';
          }
        }
      });
    });
    
    function ejecutarMenu(){
      if ($('.sidebar-offcanvas').css('background-color') == 'rgb(255, 255, 255)') {
        $('.list-group-item').attr('tabindex', '-1');
      } else {
        $('.list-group-item').attr('tabindex', '');
      }
      $('.row-offcanvas').toggleClass('active');
    }
  </script>
  <!-- Fin script del sidebar -->

</body>
</html>
