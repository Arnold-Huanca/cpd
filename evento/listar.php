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
				data: "id="+id,
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
                        <th>Nombre</th>
                         <th>Tema</th>
                         <th>Fecha Inicio</th>
                         <th>Duraci&oacute;n</th>
                         <th>Entidad Organizadora</th>
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
                       
                       
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
              define ("MODULO", "Evento");
                require('../_start.php');
                if(!isUserSession())
                header("Location: index.php"); 
                
                $idfuncionario=  getSessionUser()->getFuncionario()->id;
     $listado=  mysql_query("select e.* from evento e where e.funcionario_id=$idfuncionario");

                    while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
        <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['nombre_evento'] ?></td>
			  <td><?php echo $resultado['tema_expocicion'] ?></td>
                            <td><?php echo $resultado['fecha_inicio'] ?></td>
                              <td><?php echo $resultado['duracion'] ?></td>
                                <td><?php echo $resultado['entidad_organizadora'] ?></td>
                           <td><span class="modi"><a href="registro.php?evento_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
