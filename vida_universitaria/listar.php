<?php 

define ("MODULO", "Vida Universitaria");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 
   $idfuncionario=  getSessionUser()->getFuncionario()->id;

$listado=  mysql_query("select * from vida_universitaria  where funcionario_id=$idfuncionario");
?>
  <script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paises').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
        "sPaginationType": "full_numbers" //DAMOS FORMATO A LA PAGINACION(NUMEROS)
    } );
})
	function EliminarDato(id)
  {
		var msg = confirm("Desea eliminar este dato?")
		if ( msg )
    {
			$.ajax({
				url: 'eliminar.php',
				type: "GET",
				data: "vida_universitaria_id="+id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+id).remove();
				}
			});
			//  window.location = "index.php"; 
		}
		return false;
	}
         </script>   
         <span class="modi"><a href="registro.php"><img src="../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
         <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Otro Tip de Participacion</th>
                        <th>Otra Instancia Universitaria</th><!--Estado-->
                        <th>Fecha de Inicio</th>
                        <th>Duracion</th>
                        <th>Condicion</th>
                        <th>ID Funcionario</th>
                        <th>ID Instancia Universitaria</th>
                        <th>ID Universidad</th>
                        <th>ID Unidad Tiempo</th>
                        <th>ID Tipo de Participacion</th>
                                 <th>Estado</th>
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
                               echo '<tr id="fila-'.mb_convert_encoding($reg['id'], "UTF-8").'">';
                               echo '<td >'.mb_convert_encoding($reg['id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['otro_tip_participacion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['otra_instancia_univ'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_inicio'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['duracion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['condicion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['funcionario_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['instancia_universitaria_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['universidad_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['unidad_tiempo_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['tipo_participacion_id'], "UTF-8").'</td>';
                                 echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&vida_universitaria_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?vida_universitaria_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
         </div>