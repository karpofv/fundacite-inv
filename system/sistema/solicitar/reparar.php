<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jszip.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.print.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.html5.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.colVis.min.js"></script>
<?php
$codigo = $_POST[codigo];
$numinv = $_POST[numinv];
$selstatus = $_POST[selstatus];
$nombre = $_POST[nombre];
$descrip = $_POST[descrip];
$marca = $_POST[marca];
$modelo = $_POST[modelo];
$serial = $_POST[serial];
$eliminar = $_POST[eliminar];
$editar = $_POST[editar];
/*GUARDAR*/
if ($editar=='1' and $codigo==""){
    $consulnum = paraTodos::arrayConsultanum("*", "componente", "comp_biennac='$numinv'");
    if ($consulnum>0){
        paraTodos::showMsg("Ya existe un equipo registrado bajo este número de bien", "alert-danger");
    } else{
        paraTodos::arrayInserte("comp_nombre, comp_descripcion, comp_marca, comp_modelo, comp_serial, comp_biennac, comp_estado", "componente", "'$nombre', '$descrip', '$marca', '$modelo', '$serial', '$numinv', '$selstatus'");
        $numinv = "";
        $selstatus = "";
        $nombre = "";
        $descrip = "";
        $marca =  "";
        $modelo = "";
        $serial = "";
    }
}
/*UPDATE*/
if($editar == 1 and $nombre !="" and $codigo!=""){
        paraTodos::arrayUpdate("comp_nombre='$nombre', comp_descripcion='$descrip', comp_marca='$marca', comp_modelo='$modelo', comp_serial='$serial', comp_biennac='$numinv', comp_estado='$selstatus'", "componente", "comp_codigo=$codigo");
        $numinv = "";
        $selstatus = "";
        $nombre = "";
        $descrip = "";
        $marca =  "";
        $modelo = "";
        $serial = "";
}
/*ELIMINAR*/
if ($eliminar !=''){
    paraTodos::arrayDelete("comp_codigo=$codigo", "componente");
    $codigo = "";
}
/*MOSTRAR*/
if($editar == 1 and $codigo !="" and $nombre==""){    
    $consulsol = paraTodos::arrayConsulta("*", "componente", "comp_codigo=$codigo");
    foreach($consulsol as $row){
        $numinv = $row[comp_biennac];
        $selstatus = $row[comp_estado];
        $nombre = $row[comp_nombre];
        $descrip = $row[comp_descripcion];
        $marca = $row[comp_marca];
        $modelo = $row[comp_modelo];
        $serial = $row[comp_serial];
    }
}
?>
<div class="content">
    <div>
        <div class="page-header-title">
            <h4 class="page-title">Equipos</h4>
        </div>
    </div>
    <div class="page-content-wrapper ">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <h4 class="m-b-30 m-t-0">Reparaciones realizadas</h4>
                    <div class="row">
                        <div class="divider">
                            <table class="display font12" cellspacing="0" width="100%" id="usuarios">
                                <thead>
                                    <tr>
                                        <td class="text-center"><strong>Fecha de Solicitud</strong></td>
                                        <td class="text-center"><strong>Motivo</strong></td>
                                        <td class="text-center"><strong>Fecha de respuesta</strong></td>
                                        <td class="text-center"><strong>Respuesta</strong></td>
                                        <td class="text-center"><strong>Estado</strong></td>
                                        <!--<td class="text-center"><strong>Responder</strong></td>
                                        <td class="text-center"><strong>Eliminar</strong></td>-->
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
        </div>
    </div>
</div>
    <script>        
        $('#usuarios').DataTable({
            language: {
                "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'print',
                    text: 'Imprimir',
                    title: '',
                    exportOptions: {
                        columns: ':visible'
                    },
                    customize: function (win) {
                        $(win.document.body).css('font-size', '8pt').prepend('<div><h4 style="text-align:center">Solicitudes registradas</h4></div>');
                        $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
                    }
                },
                {
                    extend: 'colvis',
                    text: 'Columnas visibles'
                }
            ],
            scrollX: "true",
            scrollY: "200px",
            "scrollCollapse": true
        });
    </script>