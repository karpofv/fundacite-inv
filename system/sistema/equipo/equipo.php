<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
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
                            <h4 class="m-b-30 m-t-0">Registro de equipos</h4>
                            <div class="row">
                                <form class="form-horizontal" action="javascript:void(0)" method="post"
                                      onsubmit="
                                                $.ajax({
                                                url:'accion.php',
                                                type:'POST',
                                                data:{
                                                dmn         : <?php echo $idMenut;?>,
                                                codigo 	    : $('#codigo').val(),
                                                numinv  	: $('#numinv').val(),
                                                selstatus 	: $('#selstatus').val(),
                                                nombre 	    : $('#nombre').val(),
                                                descrip	    : $('#descrip').val(),
                                                marca       : $('#marca').val(),
                                                modelo 	    : $('#modelo').val(),
                                                serial 	    : $('#serial').val(),
                                                editar      : 1,
                                                ver         : 2
                                                },
                                                success : function (html) {
                                                $('#page-content').html(html);
                                                $('#codigo').val('');
                                                $('#numinv').val('');
                                                $('#selstatus').val('');
                                                $('#nombre').val('');
                                                $('#descrip').val('');
                                                $('#marca').val('');
                                                $('#modelo').val('');
                                                $('#serial').val('');
                                                },
                                                }); return false;">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label class="control-label" for="numinv">Nº de Inventario</label>                                            
                                            <input class="form-control" id="numinv" type="text" value="<?php echo $numinv; ?>">
                                            <input class="form-control" id="codigo" type="hidden" value="<?php echo $codigo; ?>">
                                        </div>
                                        <div class="col-sm-2">
                                            <label class="control-label" for="selstatus">Estatus</label>
                                            <select id="selstatus" class="form-control">
                                                <?php
                                                combos::CombosSelect("1", "$status", "*", "tools_estatus", "est_codigo", "est_descripcion", "1=1");
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <label class="control-label">Nombre del equipo</label>
                                            <input class="form-control" id="nombre" type="text" value="<?php echo $nombre; ?>">                                            
                                        </div>
                                        <div class="col-sm-8">
                                            <label class="control-label">Descripción del equipo</label>
                                            <input class="form-control" id="descrip" type="text" value="<?php echo $descrip; ?>">                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <label class="control-label">Marca</label>
                                            <input class="form-control" id="marca" type="text" value="<?php echo $marca; ?>">                                            
                                        </div>
                                        <div class="col-sm-4">
                                            <label class="control-label">Modelo</label>
                                            <input class="form-control" id="modelo" type="text" value="<?php echo $modelo; ?>">                                            
                                        </div>
                                        <div class="col-sm-4">
                                            <label class="control-label">Serial</label>
                                            <input class="form-control" id="serial" type="text" value="<?php echo $serial; ?>">                                            
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <input id="enviar" type="submit" value="Guardar" class="btn btn-primary col-md-offset-5">
                                    </div>
                                </form>
                            </div>
                            <div class="row">
                                <table class="table table-hover" id="usuarios">
                                    <thead>
                                        <tr>
                                            <td class="text-center"><strong>Nº de Inv.</strong></td>
                                            <td class="text-center"><strong>Serial</strong></td>
                                            <td class="text-center"><strong>Nombre</strong></td>
                                            <td class="text-center"><strong>Descripción</strong></td>
                                            <td class="text-center"><strong>Marca</strong></td>
                                            <td class="text-center"><strong>Modelo</strong></td>
                                            <td class="text-center"><strong>Editar</strong></td>
                                            <td class="text-center"><strong>Eliminar</strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $consulsol = paraTodos::arrayConsulta("*", "componente", "1=1");
                                        foreach($consulsol as $row){
                                        ?>
                                        <tr>
                                            <td class="text-center">
                                                <?php echo $row[comp_biennac];?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[comp_serial]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[comp_nombre]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[comp_descripcion]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[comp_marca]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[comp_modelo]);?>
                                            </td>
                                            <td class="text-center">
                                                <a href="javascript:void(0);"
                                                   onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[comp_codigo];?>,
                                                            editar 	: 1,
                                                            ver 	: 2
                                                            },
                                                            success : function (html) {
                                                            $('#page-content').html(html);
                                                            },
                                                            }); return false;"><i class="fa fa-edit"></i>
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <a href="javascript:void(0);"
                                                   onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $row[comp_codigo];?>,
                                                            eliminar : 1,
                                                            ver 	: 2
                                                            },
                                                            success : function (html) {
                                                            $('#page-content').html(html);
                                                            },
                                                            }); return false;"><i class="fa fa-eraser"></i>
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
    </div>
</div>
<script>
    $('#usuarios').DataTable({
        "language": {
            "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
        }
    });
</script>