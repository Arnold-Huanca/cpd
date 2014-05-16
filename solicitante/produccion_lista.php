<?php 

 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  
  $funcionario_id= $_GET['funcionario_id'];

$listado=  mysql_query("select * from produccion  where funcionario_id=$funcionario_id");
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
				data: "produccion_id="+id,
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
                          <th>V.B.</th>
                        <th>Tipo de Producci&oacute;n</th>
                        <th>Titutlo de Tema</th>
                        <th>Titulo de Circulacion</th><!--Estado-->
                         <th>Medio Difusion</th>
                        <th>Institucion de Entrega</th>
                        <th>Fecha de Conclucion</th>
                        <th>Subarea</th>
                        <th>Ambito</th>
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
                               echo '<td >'.mb_convert_encoding($reg['vb'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['titulo_tema'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['tipo_circulacion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['institucion_entrega'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_conclucion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['vb'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['subarea_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['funcionario_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['ambito_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['medio_difunsion_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['tipo_produccion_id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&municipio_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?municipio_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
