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
                        <th>id</th><!--Estado-->
                        <th>Nombre </th>
                        <th>Apellidos </th>
                        <th>Fecha Nacimiento</th><!--Estado-->
                        
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
               define ("MODULO", "Solicitante");
                require('../_start.php');
                if(!isUserSession())
                header("Location: index.php"); 

                  leerClase("Usuario");
                  $idfuncionario=  $_GET['funcionario_id'];
                  $listado=  mysql_query("select * from datos_familiares where funcionario_id='$idfuncionario'");

                    while( $resultado = mysql_fetch_array($listado) ){
                        
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
			  <td><?php echo $resultado['nombre'] ?></td>
			  <td><?php echo $resultado['apellido_p'] . " ".$resultado['apellido_m'] ?></td>
                            <td><?php echo $resultado['fecha_nacimiento'] ?></td>
                       </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
         </div>