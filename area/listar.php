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
                        <th>Area</th>
                        <th>Nombre</th>
                        <th>Sigla</th><!--Estado-->
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
                 define ("MODULO", "Area");
                require('../_start.php');
                if(!isUserSession())
              header("Location: index.php"); 
            $listado=  mysql_query("select a.id,a.area,a.nombre_area, a.sigla_area from area a");

                    while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
                          <td><?php echo $resultado['area'] ?></td>
			  <td><?php echo $resultado['nombre_area'] ?></td>
			  <td><?php echo $resultado['sigla_area'] ?></td>
			   <td><span class="modi"><a href="registro.php?area_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
