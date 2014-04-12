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
                        <th>Nombre de Pais</th>
                        <th>Sigla de Pais</th><!--Estado-->
                        <th>Pais gentilicio</th>
                         <th>Editar</th>
                        <th>Eliminar</th>
                         <th>Agregar Departamento</th>
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
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
               define ("MODULO", "Pais");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 
          $listado=  mysql_query("select p.id,p.nombre_pais,p.sigla_pais,p.gentilicio_pais from pais p");

                    while( $resultado = mysql_fetch_array($listado) ){
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                          <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['nombre_pais'] ?></td>
                          <td><?php echo $resultado['sigla_pais'] ?></td>
			  <td><?php echo $resultado['gentilicio_pais'] ?></td>
			  <td><span class="modi"><a href="registro.php?pais_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
                          <td><span class="modi"><a href="departamento/index.php?pais_id=<?php echo $resultado['id'] ?>"><img  width="25" height="25" src="../images/add_icon.png" title="Agregar Departamento" alt="Editar" /></a></span></td>
			
                   </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>

  
 