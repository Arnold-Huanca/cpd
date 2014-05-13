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
                        <th>Otra</th>
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
                   define ("MODULO", "Solicitante");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                  $funcionario_id= $_GET['funcionario_id'];
                     $listado=  mysql_query("select d.* from dedicacion_exclusiva d where d.funcionario_id=$funcionario_id");
                     leerClase('Universidad');
                     leerClase('Pais');
                     leerClase("Tipo_distincion");
                    while( $resultado = mysql_fetch_array($listado) ){
                  	   $tipogestion= new Tipo_gestion($resultado['tipo_gestion_id']);
                        $ambito = new Ambito($resultado['ambito_id']);
                        
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                 	  <td><?php echo $resultado['fecha_inicio'] ?></td>
			  <td><?php echo $resultado['fecha_fin'] ?></td>
                           <td><?php echo $tipogestion->descripcion; ?></td>
                             <td><?php echo $resultado['numero_gestiones'] ?></td>
                              <td><?php echo $resultado['unidad_academica'] ?></td>
			    <td><?php echo $ambito->nombre_ambito; ?></td
			   <td><?php echo $resultado['estado'] ?></td>
                           <td><span class="modi"><a href="dedicacion_exclusiva_detalle.php?menus=mostrar&distincion_id=<?php echo $resultado['id'] ?>" ><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
