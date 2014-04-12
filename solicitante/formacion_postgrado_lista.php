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
                        <th>Ciudad</th>
                        <th>Pais</th>
                        <th>Universidad</th>
                        <th>Estado</th>
                         
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
                         <th></th>
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                   define ("MODULO", "Solicitante");
                   
                  if(!isUserSession())
                  header("Location: index.php"); 
                  $id_funcionario='';
                   if ( isset($_GET['funcionario_id']) && is_numeric($_GET['funcionario_id']) )
                   {
                        $id_funcionario=$_GET['funcionario_id'];
                   }
                   leerClase("Pais");
                   leerClase("Universidad");

                  
                  $listado=  mysql_query("select p.* from  formacion_postgrado p where p.funcionario_id=$id_funcionario");

                    while( $resultado = mysql_fetch_array($listado) ){
                    $universidad=   new Universidad($resultado['universidad_id']); 
                    $pais= new Pais($resultado['pais_id']);
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['titulo_post'] ?></td>
                            <td><?php echo $resultado['ciudad_post'] ?></td>
                            <td><?php echo  $universidad->nombre_uni; ?></td>
			  <td><?php echo $pais->nombre_pais; ?></td>
                          <td><?php echo $resultado['estado'] ?></td>
			   <td><span class="modi"><a href="formacion_postgrado_detalle.php?menus=mostrar&formacion_postgrado_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
