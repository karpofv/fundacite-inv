<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/jszip.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.print.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.html5.min.js"></script>
<script type="text/javascript" src="<?php echo $ruta_base; ?>assets/plugins/datatables/buttons.colVis.min.js"></script>
    <div class="content">
        <div>
            <div class="page-header-title">
                <h4 class="page-title">Movimientos</h4> </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="custom-width-modalLabel">Movimientos realizados</h4> </div>
                                    <div class="divider">
                                        <table class="display" cellspacing="0" width="100%" id="usuarios">
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
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                        $consulsol = paraTodos::arrayConsulta("*", "movimientos ", "1=1");
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
                        $(win.document.body).css('font-size', '8pt').prepend('<div><h4 style="text-align:center">Desbloqueos registrados por plantel</h4></div>');
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