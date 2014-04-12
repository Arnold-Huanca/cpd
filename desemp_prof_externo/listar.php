<?php require  '../_start.php';
$listado=  mysql_query("select * from desemp_prof_externo");
?>
  <script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paises').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
        "sPaginationType": "full_numbers" //DAMOS FORMATO A LA PAGINACION(NUMEROS)
    } );
})

         </script>               <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>ID de Funcionario </th>
                        <th>ID de Subarea</th><!--Estado-->
                        <th>ID de Pais</th>
                        <th>Institucion</th>
                        <th>Cargo</th>
                        <th>Nivel del Cargo</th>
                        <th>Fecha de Inicio</th>
                        <th>Fecha de Conclusion</th>
                        <th>VB</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                    <?php

     
                   while($reg=  mysql_fetch_array($listado))
                     {
                               echo '<tr>';
                               echo '<td >'.mb_convert_encoding($reg['id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['funcionario_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['subarea_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['pais_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['institucion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['cargo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['nivel_cargo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_inicio'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_conclusion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['vb'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&area_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a>'.'</td>';
                               echo '<td><a onclick="return confirm(\'Esta seguro de eliminar los datos?\');" href="eliminar.php?eliminar&area_id='.$reg['id'].'"><center><img src="images/delete.gif" /></center></a></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
