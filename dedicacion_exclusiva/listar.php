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
                        <th>Fecha Inicio</th>
                        <th>Fecha Concluci&oacute;n</th><!--Estado-->
                        <th>Tipo Gesti&oacute;n</th>
                        <th>Nro. Gestiones</th>
                        <th>Unidad Academica</th>
                        <th>Ambito</th>
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
                        <th></th>
                         <th></th>
                        
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
              define ("MODULO", "Dedicación Exclusiva");
                    require('../_start.php');
                    if(!isUserSession())
                    header("Location: index.php"); 
                    leerClase("Usuario");
                    leerClase("Ambito");
                    leerClase("Tipo_gestion");
                  $idfuncionario=  getSessionUser()->getFuncionario()->id;
              
               
            $listado=  mysql_query("select d.*  from dedicacion_exclusiva d WHERE d.funcionario_id=$idfuncionario");

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
                              <td><?php echo $ambito->nombre_ambito; ?></td>
                          
                              <td><span class="modi"><a href="registro.php?area_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
         </div>