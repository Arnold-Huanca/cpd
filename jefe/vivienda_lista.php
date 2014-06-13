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
          <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display">
                <thead>
                    <tr>
                       
                        <th>Tipo Vivienda</th>
                        <th>Zona</th>
                        <th>Urbanizaci&oacute;n</th><!--Estado-->
                        <th>Ubicaci&oacute;n</th><!--Estado-->
                     
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
                         define ("MODULO", "Jefe");
                require('../_start.php');
                if(!isUserSession())
                header("Location: index.php"); 

                  leerClase("Usuario");
                  $idfuncionario=  $_GET['funcionario_id'];
                  $listado=  mysql_query("select * from vivienda where funcionario_id='$idfuncionario'");
                    while( $resultado = mysql_fetch_array($listado) ){
                      	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                      
			<td><?php echo $resultado['tipo_vivienda'] ?></td>
			<td><?php echo $resultado['zona'] ?></td>
                        <td><?php echo $resultado['nombre_hurbanizacion'] ?></td>
                        <td><?php echo $resultado['ubicacion_vivienda'] ?></td>
            	  </tr>
	<?php
	}
  ?>   
                </tbody>
            </table>
   </div>