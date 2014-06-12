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
              
                    <tr>
                        <th>id</th><!--Estado-->
                    <tr/>
                    <tr>
                        <th>Titulo</th>
                        </tr>
                        <th>Tesis</th>
                        <th>Ciudad</th>
                        <th>Fecha</th> 
                         <th>Estado</th> 
                        <th>Ver Datos </th>
                       
                    </tr>
                
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
                  
                  $funcionario_id= $_GET['funcionario_id'];
                  
                  $listado=  mysql_query("select f.* from  formacion_pregrado f where f.funcionario_id=$funcionario_id");

                    while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
			   <td><?php echo $resultado['nombre_titulo'] ?></td>
                           <td><?php echo $resultado['tesis_pregrado'] ?></td>
                           <td><?php echo $resultado['ciudad_pregrado'] ?></td>
			   <td><?php echo $resultado['fecha_diploma'] ?></td>
                           <td><?php echo $resultado['estado'] ?></td>
			   <td><span class="modi"><a href="formacion_pregrado_detalle.php?menus=mostrar&formacion_pregrado_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
