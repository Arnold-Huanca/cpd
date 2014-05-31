<?php 

define ("MODULO", "Perfeccionamiento Profesional");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 
$listado=  mysql_query("select * from perfeccionamiento_profecional");
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
				data: "perfeccionamiento_profecional_id="+id,
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
                        <th>Tipo de Perfeccionamiento</th>
                        <th>Funcionario</th><!--Estado-->
                        <th>Unidad de Tiempo</th>
                        <th>Pais</th>
                        <th>Universidad</th>
                        <th>Subarea</th>
                        <th>Fecha Certificado</th>
                        <th>Certificado</th>
                        <th>Titulo</th>
                        <th>Diploma</th>
                        <th>Titulo Trabajo Final</th>
                        <th>Mencion</th>
                        <th>Duracion del Curso</th>
                        <th>Hrs. Presenciales</th>
                        <th>Hrs. No Presenciales</th>
                        <th>Creditos</th>
                        <th>Otra Institucion</th>
                        <th>VB</th>
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
                               echo '<td >'.mb_convert_encoding($reg['tipo_perfeccionamiento_id'], "UTF-8").'</td>';
                                echo '<td >'.mb_convert_encoding($reg['unidad_tiempo_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['pais_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['universidad_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['subarea_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_certificado'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['certificado'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['titulo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['diplona'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['titulo_trabajo_final'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['mencion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['duracion_curso'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['hrs_presenciales'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['hrs_no_presenciales'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['creditos'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['otra_institucion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['vb'], "UTF-8").'</td>';
                                echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&perfeccionamiento_profecional_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?perfeccionamiento_profecional_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
        </div>