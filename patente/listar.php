
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
				data: "patente_id="+id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+id).remove();
				}
			});
			//  window.location = "index.php"; 
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
                        <th>Numero de Patente</th>
                         <th>Pais</th>
                        <th>Titulo de Descripcion</th><!--Estado-->
                        <th>Fecha</th>
                        <th>&Aacute;rea</th>
                        <th>Sub&aacute;rea</th>
                         <th>Estado</th>
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
                       <th></th>
                        <th></th>
                     
                    </tr>
                </tfoot>
                  <tbody>
               <?php
                  require  '../_start.php';
                  define ("MODULO", "Patente");
                  if(!isUserSession())
                  header("Location: index.php"); 
                 $idfuncionario=  getSessionUser()->getFuncionario()->id;
                   $listado=  mysql_query("select f.* from  patente f where f.funcionario_id= $idfuncionario");

                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Pais");
                
                    while( $resultado = mysql_fetch_array($listado)){
                        
                       
                        $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($resultado['area_id']);
                        $pasis = new Pais($resultado['pais_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                           <td><?php   echo $resultado['id']; ?></td>
                           <td><?php   echo $resultado['numero_patente']; ?></td>
                           <td><?php   echo $pasis->nombre_pais; ?></td>
                           <td><?php   echo $resultado['titulo_descripcion']; ?></td>
                            <td><?php  echo $resultado['fechas'] ?></td>
                           <td><?php   echo $area->nombre; ?></td>
                           <td><?php   echo $subarea->nombre_subarea; ?></td>
		         <td><?php echo $resultado['estado'] ?></td>
                          <td><span class="modi"><a href="registro.php?patente_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
       </div>