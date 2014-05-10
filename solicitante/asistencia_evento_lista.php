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
                        <th>Tipo de Evento</th>
                        <th>Nombre Evento</th>
                        <th>Fecha</th>
                        <th>Duraci&oacute;n</th> 
                         <th>Tipo de  Certificado</th> 
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
                   define ("MODULO", "Solicitante");
                  if(!isUserSession())
                  header("Location: index.php"); 
              leerClase("Tipo_evento");
              leerClase("Ambito");
                  
                  $funcionario_id= $_GET['funcionario_id'];
                  
                  $listado=  mysql_query("select f.* from  asistencia_evento f where f.funcionario_id=$funcionario_id");

                    while( $resultado = mysql_fetch_array($listado) ){
                        $tipoevento= new Tipo_evento($resultado['tipo_evento_id']);
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
                             <td><?php echo $tipoevento->descripcion; ?></td>
    
                             <td><?php echo $resultado['nombre_evento'] ?></td>
                         
			    <td><?php echo $resultado['fecha_inicio'] ?></td>
                             <td><?php echo $resultado['duracion'] ?></td>
                         
                            <td><?php echo $resultado['entidad_organizadora'] ?></td>
                           
			 
			   <td><?php echo $resultado['duracion'] ?></td>
                           <td><?php echo $resultado['estado'] ?></td>
                          <td><span class="modi"><a href="evento_detalle.php?menus=mostrar&evento_id=<?php echo $resultado['id'] ?>" ><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
