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
				data: "ambito_id="+id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+id).remove();
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
                         <th>Apellido Paterno</th>
                          <th>Apellido Materno</th>
                          <th>Email</th>
                         
                           <th>Ver Datos </th>
                       
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                   define ("MODULO", "Solicitante");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  $listado=  mysql_query("select f.* from  funcionario f, usuario u where f.usuario_id=u.id");

                    while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['nombre'] ?></td>
                            <td><?php echo $resultado['apellido_p'] ?></td>
                              <td><?php echo $resultado['apellido_m'] ?></td>
			  <td><?php echo $resultado['email'] ?></td>
			   <td><span class="modi"><a href="lista.php?menus=mostrar&funcionario_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
