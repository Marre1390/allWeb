<!DOCTYPE html>
<html>
<head>
    <title>DataTable</title>
    <?php require_once "scripts.php"; ?>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card text-left">
                    <div class="card-header">
                        Tablas Dinamicas con datatble y php
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lista de solicitudes y servicios</h5>
                        <span class="btn btn-primary" class="btn btn-primary" data-toggle="modal" data-target="#agregarnuevo">
                        Agregar nuevo
                        </span>
                        <hr>
                        <div id="tableDataTable"></div>

                    </div>
                    <div class="card-footer text-muted">
                        Estadisticas
                    </div>
                </div>
            </div>
        </div>

<!-- Modal -->
<div class="modal fade" id="agregarnuevo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Agregar solicitudes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form-nuevo">
            <table class="table table-striped">

                <tr>
                    <td><label>Mes 1</label></td>
                    <td>
                        <select id="slc-mes1">
                            <option value="1" name"slc-mes1">Enero</option>
                            <option value="2" name"slc-mes1">Febrero</option>
                            <option value="3" name"slc-mes1">Marzo</option>
                            <option value="4" name"slc-mes1">Abril</option>
                            <option value="5" name"slc-mes1">Mayo</option>
                            <option value="6" name"slc-mes1">Junio</option>
                            <option value="7" name"slc-mes1">Julio</option>
                            <option value="8" name"slc-mes1">Agosto</option>
                            <option value="9" name"slc-mes1">Septiembre</option>
                            <option value="10" name"slc-mes1">Octubre</option>
                            <option value="11" name"slc-mes1">Noviembre</option>
                            <option value="12" name"slc-mes1">Diciembre</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Mes 2</label></td>
                    <td>
                    <select id="slc-mes2">
                            <option value="1" name"slc-mes2">Enero</option>
                            <option value="2" name"slc-mes2">Febrero</option>
                            <option value="3" name"slc-mes2">Marzo</option>
                            <option value="4" name"slc-mes2">Abril</option>
                            <option value="5" name"slc-mes2">Mayo</option>
                            <option value="6" name"slc-mes2">Junio</option>
                            <option value="7" name"slc-mes2">Julio</option>
                            <option value="8" name"slc-mes2">Agosto</option>
                            <option value="9" name"slc-mes2">Septiembre</option>
                            <option value="10" name"slc-mes2">Octubre</option>
                            <option value="11" name"slc-mes2">Noviembre</option>
                            <option value="12" name"slc-mes2">Diciembre</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Mes 3</label></td>
                    <td>
                    <select id="slc-mes3">
                            <option value="1" name"slc-mes3">Enero</option>
                            <option value="2" name"slc-mes3">Febrero</option>
                            <option value="3" name"slc-mes3">Marzo</option>
                            <option value="4" name"slc-mes3">Abril</option>
                            <option value="5" name"slc-mes3">Mayo</option>
                            <option value="6" name"slc-mes3">Junio</option>
                            <option value="7" name"slc-mes3">Julio</option>
                            <option value="8" name"slc-mes3">Agosto</option>
                            <option value="9" name"slc-mes3">Septiembre</option>
                            <option value="10" name"slc-mes3">Octubre</option>
                            <option value="11" name"slc-mes3">Noviembre</option>
                            <option value="12" name"slc-mes3">Diciembre</option>
                    </select>
                    </td>
                </tr>

            </table>
        </form>  


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>

<script>
    $(document).ready(function() {
        $("#tableDataTable").load('tabla.php');
    })
</script>