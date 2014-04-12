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
				data: "vivienda_id="+id,
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
                        <th>Tipo Vivienda</th>
                        <th>Zona</th>
                        <th>Urbanizaci&oacute;n</th><!--Estado-->
                        <th>Ubicaci&oacute;n</th><!--Estado-->
                        <th>Estado</th><!--Estado-->
                         <th>Detalle</th>
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
                        
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
               define ("MODULO", "Vivienda");
                require('../_start.php');
                if(!isUserSession())
                header("Location: index.php"); 

                  leerClase("Usuario");
                  $idfuncionario=  getSessionUser()->getFuncionario()->id;
                  $listado=  mysql_query("select * from vivienda where funcionario_id='$idfuncionario'");
                    while( $resultado = mysql_fetch_array($listado) ){
                      	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['tipo_vivienda'] ?></td>
			  <td><?php echo $resultado['zona'] ?></td>
                            <td><?php echo $resultado['nombre_hurbanizacion'] ?></td>
                             <td><?php echo $resultado['ubicacion_vivienda'] ?></td>
                          
                            <td><?php echo $resultado['estado'] ?></td>
                            <td><span class="modi"><a href="detalle.php?ver=ver&vivienda_id=<?php echo $resultado['id'] ?>"><img width="20" height="20" src="../images/view.png" title="Ver" alt="Ver" /></a></span></td>
			   <td><span class="modi"><a href="registro.php?vivienda_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
