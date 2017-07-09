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
    <div class="modal-backdrop fade in"></div>
    <div id="custom-width-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: block; padding-right: 16px;">
        <div class="modal-dialog" style="width:90%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cerrarmodal();">×</button>
                    <h4 class="modal-title" id="custom-width-modalLabel">Solicitar Reparación o mantenimiento</h4> 
                </div>
                <div class="modal-body">
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
                    <?php
                    if($codigorep==""){
                    ?>
                    <div class="row">
                        <div class="col-xs-10">
                            <label class="control-label">Motivo</label>
                            <input class="form-control" id="motivo" type="text"> 
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
                                            motivo 	: $('#motivo').val(),
                                            editar 	: 1,
                                            ver 	: 2,
                                            act     : 2
                                            },
                                            success : function (html) {
                                            $('#ventanaVer').html(html);
                                            },
                                            });">Enviar</button>
                        </div>
                    </div>
                    <?php
                    } else {
                    ?>
                    <div class="row">
                        <div class="col-xs-12">
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
                                             ver 	: 2,
                                             act     : 2
                                             },
                                             success : function (html) {
                                             $('#ventanaVer').html(html);
                                             },
                                             });">Responder</button>
                        </div>
                    </div>
                    <?php
                    }
                    ?>
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
                                        <td class="text-center"><strong>Eliminar</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $consulsol = paraTodos::arrayConsulta("*", "reparacion r, tools_estatus t", "r.rep_status=t.est_codigo and rep_equipo=$codigo");
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
                                                <?php
                                                if($row[rep_respuesta]==""){
                                                ?>                                                
                                                <a href="javascript:void(0);" onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $codigo;?>,
                                                            codigorep 	: <?php echo $row[rep_codigo];?>,
                                                            ver 	: 2,
                                                            act     : 2
                                                            },
                                                            success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                            },
                                                            }); return false;" style="color:green;"><i class="fa fa-share" aria-hidden="true"></i>
                                                </a>
                                                <?php
                                                }
                                                ?>
                                            </td>
                                            <?php
                                            ?>
                                            <td class="text-center">
                                                <?php
                                                if($row[rep_respuesta]==""){
                                                ?>
                                                <a href="javascript:void(0);" onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $codigo;?>,
                                                            codigorep 	: <?php echo $row[rep_codigo];?>,
                                                            eliminar 	: 1,
                                                            ver 	: 2,
                                                            act     : 2
                                                            },
                                                            success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                            },
                                                            }); return false;" style="color:green;"><i class="fa fa-eraser" aria-hidden="true"></i>
                                                </a>
                                                <?php
                                                }
                                                ?>
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