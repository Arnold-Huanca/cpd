<?php 
define ("MODULO", "Tipo Participación");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 
$listado=  mysql_query("select * from tipo_participacion");
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
				data: "tipo_participacion_id="+id,
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
                        <th>Descripcion</th>
                        <th>Sigla</th><!--Estado-->
                        <th>Dominio de Participacion</th>
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
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['sigla'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['dominio_participacion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&tipo_participacion_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?tipo_participacion_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
