<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<?php
$codigo = $_POST[codigo];
$codigomov = $_POST[codigomov];
$depsol = $_POST[depsol];
$solresp = $_POST[solresp];
$motivo = $_POST[motivo];
$fecdev = $_POST[fecdev];
$depresp = $_POST[depresp];
$perresp = $_POST[perresp];
$entrada = $_POST[entrada];
$salida = $_POST[salida];
$editar = $_POST[editar];
$eliminar = $_POST[eliminar];
if($editar==1 and $motivo!="" and $codigomov==""){
    $insertar = paraTodos::arrayInserte("mov_compcodigo, mov_solicitante,mov_solresp, mov_motivo,mov_fechadev, mov_respdep, mov_perresp, mov_entrada, mov_salida", "movimientos", "$codigo, '$depsol','$solresp', '$motivo', '$fecdev', '$depresp', '$perresp', '$entrada', '$salida'");
}

if($editar==1 and $motivo!="" and $codigomov!=""){ 
    $update = paraTodos::arrayUpdate("mov_compcodigo='$codigo', mov_solicitante='$depsol',mov_solresp='$solresp', mov_motivo='$motivo',mov_fechadev='$fecdev', mov_respdep='$depresp', mov_perresp='$perresp', mov_entrada='$entrada', mov_salida='$salida'", "movimientos", "mov_codigo=$codigomov");
    $codigomov="";
}
if($eliminar==1){
    $delete = paraTodos::arrayDelete("mov_codigo=$codigomov", "movimientos");
    $codigomov="";
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
if($editar==1 and $motivo=="" and $codigomov!=""){
    $consulsol = paraTodos::arrayConsulta("*", "movimientos", "mov_codigo=$codigomov");
    foreach($consulsol as $row){
        $depsol = $row[mov_solicitante];
        $solresp = $row[mov_solresp];
        $motivo = $row[mov_motivo];
        $fecdev = $row[mov_fechadev];
        $depresp = $row[mov_respdep];
        $perresp = $row[mov_perresp];
        $entrada = $row[mov_entrada];
        $salida = $row[mov_salida];
    }
}

?>
    <div class="modal-backdrop fade in"></div>
    <div id="custom-width-modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: block; padding-right: 16px;">
        <div class="modal-dialog" style="width:90%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="cerrarmodal();">×</button>
                    <h4 class="modal-title" id="custom-width-modalLabel">Movimiento de equipos</h4> </div>
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
                    <div class="row">
                        <form action="javascript:void(0)" method="post" onsubmit="$.ajax({
                                        url:'accion.php',
                                             type:'POST',
                                            data:{
                                            dmn 	: <?php echo $idMenut;?>,
                                            codigo 	: '<?php echo $codigo;?>',
                                            codigomov 	: '<?php echo $codigomov;?>',
                                            depsol 	: $('#depsol').val(),
                                            solresp 	: $('#solresp').val(),
                                            motivo 	: $('#motivo').val(),
                                            fecdev 	: $('#fecdev').val(),
                                            depresp 	: $('#depresp').val(),
                                            perresp 	: $('#perresp').val(),
                                            entrada 	: $('#entrada').val(),
                                            salida 	: $('#salida').val(),
                                            editar 	: 1,
                                            ver 	: 2,
                                            act     : 3
                                            },
                                            success : function (html) {
                                            $('#ventanaVer').html(html);
                                            },
                                            }); return false;">
                            <div class="col-xs-7">
                                <label class="control-label">Departamento Solicitante</label>
                                <input class="form-control" id="depsol" type="text" value="<?php echo $depsol?>">
                            </div>
                            <div class="col-xs-5">
                                <label class="control-label">Funcionario autorizado para su uso</label>
                                <input class="form-control" id="solresp" type="text" value="<?php echo $solresp;?>"> </div>
                            <div class="col-xs-12">
                                <label class="control-label">Motivo</label>
                                <input class="form-control" id="motivo" type="text" value="<?php echo $motivo;?>"> </div>
                            <div class="col-xs-4">
                                <label class="control-label">Fecha de devolución</label>
                                <input class="form-control" id="fecdev" type="date" value="<?php echo $fecdev;?>"> </div>
                            <div class="col-xs-7">
                                <label class="control-label">Departamento Responsable</label>
                                <input class="form-control" id="depresp" type="text" value="<?php echo $depresp?>"> </div>
                            <div class="col-xs-5">
                                <label class="control-label">Funcionario responsable</label>
                                <input class="form-control" id="perresp" type="text" value="<?php echo $perresp;?>"> </div>
                            <div class="col-xs-3">
                                <label class="control-label">Fecha de entrada</label>
                                <input class="form-control" id="entrada" type="date" value="<?php echo $entrada;?>"> </div>
                            <div class="col-xs-3">
                                <label class="control-label">Fecha de salida</label>
                                <input class="form-control" id="salida" type="date" value="<?php echo $salida;?>"> </div>
                            <div class="col-sm-2">
                                <br>
                                <button class="btn btn-success" type="submit">Guardar</button>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="modal-header">
                            <h4 class="modal-title" id="custom-width-modalLabel">Movimientos realizados</h4> </div>
                        <div class="divider">
                            <table class="table table-hover" id="usuarios">
                                <thead>
                                    <tr>
                                        <td class="text-center"><strong>Fecha</strong></td>
                                        <td class="text-center"><strong>Dep. Solicitante</strong></td>
                                        <td class="text-center"><strong>Responsable</strong></td>
                                        <td class="text-center"><strong>Motivo</strong></td>
                                        <td class="text-center"><strong>Fecha de devolución</strong></td>
                                        <td class="text-center"><strong>Dep. Responsable</strong></td>
                                        <td class="text-center"><strong>Persona Responsable</strong></td>
                                        <td class="text-center"><strong>Fec. Entrada</strong></td>
                                        <td class="text-center"><strong>Fec. Salida</strong></td>
                                        <td class="text-center"><strong>Editar</strong></td>
                                        <td class="text-center"><strong>Eliminar</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $consulsol = paraTodos::arrayConsulta("*", "movimientos ", "mov_compcodigo=$codigo  ");
                                        foreach($consulsol as $row){
                                        ?>
                                        <tr>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[mov_fecha]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[mov_solicitante]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[mov_solresp]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[mov_motivo]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[mov_fechadev]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[mov_respdep]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo utf8_decode($row[mov_perresp]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[mov_salida]);?>
                                            </td>
                                            <td class="text-center">
                                                <?php echo paraTodos::convertDate($row[mov_entrada]);?>
                                            </td>
                                            <td class="text-center"> <a href="javascript:void(0);" onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: '<?php echo $codigo;?>',
                                                            codigomov 	: '<?php echo $row[mov_codigo];?>',
                                                            editar 	: 1,
                                                            ver 	: 2,
                                                            act     : 3
                                                            },
                                                            success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                            },
                                                            }); return false;" style="color:green;"><i class="fa fa-edit" aria-hidden="true"></i>
                                                </a> </td>
                                            <td class="text-center"> <a href="javascript:void(0);" onclick="$.ajax({
                                                            url:'accion.php',
                                                            type:'POST',
                                                            data:{
                                                            dmn 	: <?php echo $idMenut;?>,
                                                            codigo 	: <?php echo $codigo;?>,
                                                            codigomov 	: '<?php echo $row[mov_codigo];?>',
                                                            eliminar 	: 1,
                                                            ver 	: 2,
                                                            act     : 3
                                                            },
                                                            success : function (html) {
                                                            $('#ventanaVer').html(html);
                                                            },
                                                            }); return false;" style="color:green;"><i class="fa fa-eraser" aria-hidden="true"></i>
                                                </a> </td>
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