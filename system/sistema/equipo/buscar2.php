<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<?php
$codigo = $_POST[codigo];
$motivo = $_POST[motivo];
$codigorep = $_POST[codigorep];
$respuesta = $_POST[respuesta];
$estado = $_POST[estado];
$editar = $_POST[editar];
$eliminar = $_POST[eliminar];
if($editar==1 and $motivo!="" and $codigorep==""){
    $insertar = paraTodos::arrayInserte("rep_equipo, rep_motivo,rep_status", "reparacion", "$codigo, '$motivo',3");
    if($insertar){
        $update = paraTodos::arrayUpdate("comp_estado=3", "componente", "comp_codigo=$codigo");
    }
}
if($editar==1 and $respuesta!=""){ 
    $update = paraTodos::arrayUpdate("rep_respuesta='$respuesta', rep_fecresp=current_date, rep_status='$estado'", "reparacion", "rep_codigo=$codigorep");
    $codigorep="";
}
if($eliminar==1){
    $delete = paraTodos::arrayDelete("rep_codigo=$codigorep", "reparacion");
    $codigorep="";
}
$consulsol = paraTodos::arrayConsulta("*", "componente", "comp_codigo=$codigo");
foreach($consulsol as $row){
    $numero = $row[comp_biennac];
    $serial = $row[comp_serial];
    $nombre = $row[comp_nombre];
    $desdripcion = $row[comp_descripcion];
    $marca = $row[comp_marca];
    $modelo = $row[comp_modelo];
}
?>
<div class="content">
    <div>
        <div class="page-header-title">
            <h4 class="page-title">Equipos a reparar</h4>
        </div>
    </div>
    <div class="page-content-wrapper ">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <h4 class="m-b-30 m-t-0">Registro de equipos</h4>
                            <div class="row">
                    <div class="row">                       
                        <div class="col-xs-6">
                            <label><strong>Nº de Inventario:</strong></label>
                            <p>
                                <?php echo $numero;?>
                            </p>
                            <label><strong>Serial:</strong></label>
                            <p>
                                <?php echo $serial;?>
                            </p>
                            <label><strong>Nombre:</strong></label>
                            <p>
                                <?php echo $nombre;?>
                            </p>
                        </div>
                        <div class="col-xs-6">
                            <label><strong>Descripción:</strong></label>
                            <p>
                                <?php echo $descripcion;?>
                            </p>
                            <label><strong>Marca:</strong></label>
                            <p>
                                <?php echo $marca;?>
                            </p>
                            <label><strong>Modelo:</strong></label>
                            <p>
                                <?php echo $modelo;?>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <label class="control-label">Respuesta</label>
                            <input class="form-control" id="respuesta">
                        </div>
                        <div class="col-sm-4">
                            <label class="control-label" for="estado">Estatus</label>
                            <select id="estado" class="form-control">
                                <?php
                        combos::CombosSelect("1", "$estado", "*", "tools_estatus", "est_codigo", "est_descripcion", "1=1");
                                ?>
                            </select>
                        </div>                
                        <div class="col-sm-2">
                            <br>
                            <button class="btn btn-success" type="button" 
                                    onclick="$.ajax({
                                             url:'accion.php',
                                             type:'POST',
                                             data:{
                                             dmn 	: <?php echo $idMenut;?>,
                                             codigo 	: <?php echo $codigo;?>,
                                             respuesta 	: $('#respuesta').val(),
                                             codigorep 	: <?php echo $codigorep;?>,
                                             estado 	: $('#estado').val(),
                                             editar 	: 1,
                                             ver 	: 2
                                             },
                                             success : function (html) {
                                             $('#page-content').html(html);
                                             },
                                             });">Responder</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="modal-header">
                            <h4 class="modal-title" id="custom-width-modalLabel">Reparaciones realizadas</h4>
                        </div>
                        <div class="divider">
                            <table class="table table-hover" id="usuarios">
                                <thead>
                                    <tr>
                                        <td class="text-center"><strong>Fecha de Solicitud</strong></td>
                                        <td class="text-center"><strong>Motivo</strong></td>
                                        <td class="text-center"><strong>Fecha de respuesta</strong></td>
                                        <td class="text-center"><strong>Respuesta</strong></td>
                                        <td class="text-center"><strong>Estado</strong></td>
                                        <td class="text-center"><strong>Responder</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $consulsol = paraTodos::arrayConsulta("*", "reparacion r, tools_estatus t", "r.rep_status=t.est_codigo");
                                        foreach($consulsol as $row){
                                        ?>
                                        <tr>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[rep_fecha]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[rep_motivo]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[rep_fecresp]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[rep_respuesta]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[est_descripcion]);?>
                                            </td>
                                            <td class="text-center">                       
                                                <a href="javascript:void(0);" onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[rep_equipo];?>,
                                                            codigorep 	: <?php echo $row[rep_codigo];?>,
                                                            ver 	: 2
                                                            },
                                                            success : function (html) {
                                                            $('#page-content').html(html);
                                                            },
                                                            }); return false;" style="color:green;"><i class="fa fa-share" aria-hidden="true"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php
                                        }
                                        ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    $('#usuarios').DataTable({
        "language": {
            "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
        }
    });
</script>