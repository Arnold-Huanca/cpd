<?php 

define ("MODULO", "Plan Proyecto Programa");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  
$listado=  mysql_query("select * from plan_proyecto_programa");
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
				data: "plan_proyecto_programa_id="+id,
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
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Tipo</th>
                        <th>Titulo</th><!--Estado-->
                        <th>Fecha Inicio</th>
                        <th>Beneficiario</th>
                        <th>Duracion</th>
                        <th>Unidad Ejecutora</th>
                        <th>Otra Universidad</th>
                        <th>VB</th>
                        <th>ID Tipo de Participacion</th>
                        <th>ID Funcionario</th>
                        <th>ID Unidad de Tiempo</th>
                        <th>ID Universidad</th>
                        <th>ID Ambito</th>
                        <th>ID Subarea</th>
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
                               echo '<tr id="fila-'.mb_convert_encoding($reg['id'], "UTF-8").'">';
                               echo '<td >'.mb_convert_encoding($reg['id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['tipo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['titulo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_inicio'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['beneficiario'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['duracion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['unidad_ejecutora'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['otra_universidad'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['vb'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['tipo_participacion_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['funcionario_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['unidad_tiempo_id_unidad_tiempo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['universidad_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['ambito_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['subarea_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&plan_proyecto_programa_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?plan_proyecto_programa_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
