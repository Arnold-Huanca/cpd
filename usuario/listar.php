<?php 
 define ("MODULO", "Usuario");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 

$listado=  mysql_query("select * from usuario");
?>
 <script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paises').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
        "sPaginationType": "full_numbers" //DAMOS FORMATO A LA PAGINACION(NUMEROS)
    } );
})



	function EliminarDato(usuario_id)
  {
		var msg = confirm("Desea eliminar este dato?")
		if ( msg )
    {
			$.ajax({
				url: 'eliminar.php',
				type: "GET",
				data: "id="+usuario_id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+usuario_id).remove();
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
                        <th>id</th><!--Estado-->
                        <th>Nombre</th>
                        <th>Apellido Paterno</th><!--Estado-->
                        <th>Apellido Materno</th>
                        <th>Email</th><!--Estado-->
                         <th>Login</th><!--Estado-->
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                    
                    <?php
                 //   include '../images/';
                    while( $usuario = mysql_fetch_array($listado) ){
                  	?>
	
		   <tr id="fila-<?php echo $usuario['id'] ?>">
        <td><?php echo $usuario['id'] ?></td>
			  <td><?php echo $usuario['nombre'] ?></td>
			  <td><?php echo $usuario['apellido_p'] ?></td>
			  <td><?php echo $usuario['apellido_m'] ?></td>
			  <td><?php echo $usuario['email'] ?></td>
			  <td><?php echo $usuario['login'] ?></td>
			  <td><span class="modi"><a href="registro.php?usuario_id=<?php echo $usuario['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $usuario['id'] ?>); return false" href="eliminar.php?id=<?php echo $usuario['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
         </div>