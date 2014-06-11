<script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paisespos').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
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
             <table cellpadding="0" cellspacing="0" border="0" class="display" >
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Titulo</th>
                        <th>Tesis</th>
                        <th>Ciudad</th>
                        <th>Fecha</th> 
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
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
             define ("MODULO", "Jefe");
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
					  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
