<?php 
  define ("MODULO", "Funcionario");
  require('../_start.php');
  if(!isUserSession())
      
  header("Location: index.php"); 
  
    $idfuncionario=  getSessionUser()->getFuncionario()->id;
                
             
     
$listado=  mysql_query("select * from funcionario  where id = $idfuncionario");
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
				data: "funcionario_id="+id,
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
           <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>CI Funcionario</th>
                        <th>Apellido Paterno</th><!--Estado-->
                        <th>Apellido Materno</th>
                        <th>Nombre</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Sexo</th>
                        <th>Estado Civil</th>
                        <th>Email</th>
                        <th>Numero de Hijos</th>
                        <th>ID Dependencia Colegio</th>
                        <th>ID Pais</th>
                        <th>ID Usuario</th>
                        <th>Descripcion</th>
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
                               echo '<td >'.mb_convert_encoding($reg['ci'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['apellido_p'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['apellido_m'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['nombre'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['fecha_nac'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['sexo'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['descripcion'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               
                               echo '<td  ><a href=registro.php?editar=editando&funcionario_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?municipio_id='.$reg['id'].'"><center><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
						                   echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
