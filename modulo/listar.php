<?php 

define ("MODULO", "Modulo");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 
$listado=  mysql_query("select * from modulo");
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
                        <th>Codigo</th>
                        <th>Descripcion</th><!--Estado-->
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
                               echo '<td >'.mb_convert_encoding($reg['codigo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&area_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a>'.'</td>';
                               echo '<td><a onclick="return confirm(\'Esta seguro de eliminar los datos?\');" href="eliminar.php?eliminar&area_id='.$reg['id'].'"><center><img src="images/delete.gif" /></center></a></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
