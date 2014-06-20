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
                        <th>Idioma</th>
                        <th>Habla</th>
						<th>Escribe</th>
                        <th>Lee</th>
						<th>Entiende</th><!--Estado-->
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
                   define ("MODULO", "Dominio Idioma");
                  if(!isUserSession())
                  header("Location: index.php"); 
                     $idfuncionario=  getSessionUser()->getFuncionario()->id;
                     $num = 0;
                     $dominio=  mysql_query("select distinct nombre_idioma, habla, lee, escribe, dominio_idioma, d.id from dominio_idioma  d, idioma i where d.funcionario_id = $idfuncionario and d.id_idioma= i.id");
					 while( $resultado = mysql_fetch_array($dominio)){
						$num = $num + 1;
                  	?>
                  	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
				<td><?php echo $num ?></td>
				<td><?php echo $resultado['nombre_idioma'] ?></td>
				<td><?php echo $resultado['habla'] ?></td>
				<td><?php echo $resultado['lee'] ?></td>
				<td><?php echo $resultado['escribe'] ?></td>
				<td><?php echo $resultado['dominio_idioma'] ?></td>
				<td><span class="modi"><a href="registro.php?dominio_idioma_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
				<td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
                 </div>
