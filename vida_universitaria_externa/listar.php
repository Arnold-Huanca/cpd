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
          <span class="modi"><a href="registro.php"><img src="../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
		
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                           <th>Pais</th>
                        
                           <th>Universidad</th>
                          <th>Fecha</th><!--Estado-->
                         <th>Estado</th><!--Estado-->
                         <th>Detalle</th><!--Estado-->
                         <th>Editar</th>
                        <th>Eliminar</th>
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
                        <th></th>
                        <th></th>
                        
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                  define ("MODULO", "Vida Universitaria Externa");
                if(!isUserSession())
                  header("Location: index.php"); 
              $idfuncionario=  getSessionUser()->getFuncionario()->id;
              $listado=  mysql_query("select * from vida_universitaria_externa where funcionario_id=$idfuncionario");
              while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                          <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['universidad_id'] ?></td>
			  <td><?php echo $resultado['unidad_tiempo_id'] ?></td>
			  <td><?php echo $resultado['pais_id'] ?></td>
                           <td><?php echo $resultado['fecha_inicio'] ?></td>
			  <td><?php echo $resultado['estado'] ?></td>
			   <td><span class="modi"><a href="registro.php?ambito_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?ambito_id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
