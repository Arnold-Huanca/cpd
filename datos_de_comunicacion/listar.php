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
		 <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>Num</th><!--Estado-->
                        <th>Tipo</th>
                        <th>Numero</th>
		       <th>Lugar</th>
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
                       
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                   require  '../_start.php';
                   define ("MODULO", "Datos de Comunicacion");
                   if(!isUserSession())
                   header("Location: index.php"); 
                     $idfuncionario=  getSessionUser()->getFuncionario()->id;
                     $num = 0;
                     $datos_comunicacion=  mysql_query("select distinct id tipo, numero, lugar from datos_comunicacion  d where d.funcionario_id = $idfuncionario ;");
					 while( $resultado = mysql_fetch_array($datos_comunicacion)){
						$num = $num + 1;
                  	?>
                  	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
				<td><?php echo $num ?></td>
				<td><?php echo $resultado['tipo'] ?></td>
				<td><?php echo $resultado['numero'] ?></td>
				<td><?php echo $resultado['lugar'] ?></td>
				
				<td><span class="modi"><a href="registro.php?datos_de_comunciacion=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
				<td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                </tbody>
            </table>
                 </div>
