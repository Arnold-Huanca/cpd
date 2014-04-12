<?php 
define ("MODULO", "Pertenece");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  

$listado=  mysql_query("select * from usuario");
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
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Nombre</th>
                        <th>Apellido Paterno</th><!--Estado-->
                        <th>Apellido Materno</th>
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
                    /**
                     *  <div id="hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}" >
        {if ($pertenece)}
          <a href="?asignar_grupo=0&pertenece_id={$pertenece->id}&usuario_id={$objs[ic]['id']}&grupo_id={$grupos[iaz]->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').hide();$('#loading_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').show();" >
          {icono('basicset/Off.png','Sacar del grupo')}
          </a>
          {icono('basicset/login.png','Pertenece al grupo')}
        {else}
          <a href="?asignar_grupo=1&pertenece_id={$pertenece->id}&usuario_id={$objs[ic]['id']}&grupo_id={$grupos[iaz]->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').hide();$('#loading_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').show();" >
          {icono('basicset/On.png','Incorporar al grupo')}
          </a>
          {icono('basicset/user_48.png','No Pertenece al grupo')}
        {/if}
        </div>
                     */
                 //   include '../images/';
                    while( $usuario = mysql_fetch_array($listado) )
                      {
                  	?>
	
		   <tr id="fila-<?php echo $usuario['id'] ?>">
                          <td><?php echo $usuario['id'] ?></td>
			  <td><?php echo $usuario['nombre'] ?></td>
			  <td><?php echo $usuario['apellido_p'] ?></td>
			  <td><?php echo $usuario['apellido_m'] ?></td>
                          
                          <?php
                             // foreach ()
                      $grupos=  mysql_query("select * from grupo  ORDER BY id ASC");
                     $usuarioid= $usuario['id'];
                    while( $grupo = mysql_fetch_array( $grupos) )
                       {
                        $gropoid=$grupo['id'];
                        $pertenece=  mysql_query("select p.* from pertenece p  where p.grupo_id= $gropoid and p.usuario_id = $usuarioid");
                      
	             if(mysql_num_rows($pertenece) > 0)
                     {
                     $perteneces=    mysql_fetch_array( $pertenece);
                     $perteneceid=    $perteneces['id'];
                         ?>
                            <td><span class="modi"><a href="?asignar_grupo=0&pertenece_id=<?php echo $perteneceid; ?> &usuario_id=<?php echo $usuarioid; ?> &grupo_id=<?php echo  $gropoid; ?>  "><img src="../images/addd.png" title="Quitar" alt="Quitar" /></a></span></td>
			
                       
                         
                          <?php
                     }  else {
                         ?>
                          <td><span class="modi"><a href="?asignar_grupo=1&pertenece_id=0&usuario_id=<?php echo $usuarioid; ?> &grupo_id=<?php echo  $gropoid; ?>  "><img src="../images/delete.png" title="Agregar" alt="Agregar" /></a></span></td>
			   <?php
                     }
                     ?>
                   <?php }?>
                   </tr>
	      <?php
	        }
               ?>   
                <tbody>
            </table>
