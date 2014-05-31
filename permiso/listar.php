<?php 
define ("MODULO", "Permiso");
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



	function EliminarDato(usuario_id)
  {
		var msg = confirm("Desea eliminar este dato?")
		if ( msg )
    {
			$.ajax({
				url: 'eliminar.php',
				type: "GET",
				data: "id="+usuario_id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+usuario_id).remove();
				}
			});
			 // window.location = "index.php"; 
		}
		return false;
	}

         </script> 
          <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Modulo</th>
                        <th>Descripci&oacute;n</th><!--Estado-->
                          <?php
                        $array= array();
                      $grupos=  mysql_query("select * from grupo  ORDER BY id ASC");
                    while( $grupo = mysql_fetch_array( $grupos) )
                       {
                         $array[]= $grupo['id'];
                       ?>
                      
                        <th><?php echo $grupo['codigo'] ?></th>
                    <?php }?>
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
                   
                    while( $modulos = mysql_fetch_array($listado) )
                      {
                  	?>
	
		       <tr id="fila-<?php echo $modulos['id'] ?>">
                          <td><?php echo $modulos['id'] ?></td>
			  <td><?php echo $modulos['codigo'] ?></td>
			  <td><?php echo $modulos['descripcion'] ?></td>
			     
                          <?php
                             // foreach ()
                      $grupos=  mysql_query("select * from grupo  ORDER BY id ASC");
                     $moduloid= $modulos['id'];
                    while( $grupo = mysql_fetch_array( $grupos) )
                       {
                        $gropoid=$grupo['id'];
                        $permiso=  mysql_query("select p.* from  permiso  p where p.grupo_id= $gropoid and p.modulo_id =$moduloid");
                        
                     
                        
                    if(mysql_num_rows($permiso) > 0)
                     {
                              $permisos=    mysql_fetch_array($permiso);
                              $permisoid=    $permisos['id'];
                      if( $permisos['ver']==1)
                      {
                           ?>
                             <td><span class="modi"><a href="?asignar_permiso=1&permisos_id=<?php echo  $permisoid; ?> &modulo_id=<?php echo $moduloid; ?> &grupo_id=<?php echo  $gropoid; ?>  "><img src="../images/addd.png" title="Quitar" alt="Quitar" /></a></span></td>
			
                          <?php
                      }  else {
                           ?>
                     
                             <td><span class="modi"><a href="?asignar_permiso=0&permisos_id=<?php echo  $permisoid; ?>&modulo_id=<?php echo $moduloid; ?> &grupo_id=<?php echo  $gropoid; ?>  "><img src="../images/delete.png" title="Agregar" alt="Agregar" /></a></span></td>
		
                          <?php
                       }
                          
                     }else {
                         ?>
                          <td><span class="modi"><a href="?asignar_permiso=0&permisos_id=0&modulo_id=<?php echo $moduloid; ?> &grupo_id=<?php echo  $gropoid; ?>  "><img src="../images/delete.png" title="Agregar" alt="Agregar" /></a></span></td>
			   <?php
                     }
                     ?>
                   <?php 
                       }?>
                   </tr>
	      <?php
	        }
               ?>   
                <tbody>
            </table>
          </div>