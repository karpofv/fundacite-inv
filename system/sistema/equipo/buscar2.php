<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<?php
    $codigo = $_POST[codigo];
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
                            <h4 class="m-b-30 m-t-0">Buscar equipos</h4>
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
                                            <td class="text-center"><strong>Sol. Reparación</strong></td>
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
                                                            ver 	: 2,
                                                            act     : 2
                                                            },
                                                            success : function (html) {
                                                            $('#ventanaVer').html(html);
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
    </div>
</div>
<script>
    $('#usuarios').DataTable({
        "language": {
            "url": "<?php echo $ruta_base;?>assets/js/Spanish.json"
        }
    });
</script>