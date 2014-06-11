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
                         <th>Mater&iacute;n</th>
                         <th>Fecha Inicio</th><!--Estado-->
                         <th>Duraci&oacute;n</th>
                         <th>&Aacute;rea</th>
                         <th>Sub&aacute;rea</th><!--Estado-->
                         <th>Nivel</th>
                         <th>Carrera</th><!--Estado-->
                         <th>Departamento</th><!--Estado-->
                         <th>Facultad</th><!--Estado-->
                         <th>Universidad</th><!--Estado-->
                         <th>Condici&oacute;n</th><!--Estado-->
                         <th>Estado</th><!--Estado-->
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
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
              define ("MODULO", "Docencia Auxiliar Externa");
                    require('../_start.php');
                    if(!isUserSession())
                    header("Location: index.php"); 
                    
                  leerClase("Usuario");
                  $idfuncionario=  getSessionUser()->getFuncionario()->id;
                  $listado=  mysql_query("select d.* from  docencia_axuliar_externa d where d.funcionario_id=$idfuncionario");
                  leerClase('Nivel_formacion');
                  leerClase('Unidad_tiempo');
                  leerClase('Area');
                  leerClase('Subarea');
                  leerClase('Universidad');
                    while( $resultado = mysql_fetch_array($listado) ){
                    $area= new Area($resultado['area_id']);
                    $subarea= new Subarea($resultado['subarea_id']);
                    $unidadtiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                    $nivel_gestion= new Nivel_formacion($resultado['nivel_formacion_id']);
                    $universidad= new Universidad($resultado['universidad_id']);
                        
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['id'] ?></td>
                           <td><?php echo $resultado['materia'] ?></td>
                           <td><?php echo $resultado['fecha_inicio'] ?></td>
                           <td><?php echo $resultado['duracion'] .' '. $unidadtiempo->nombre_unidad_tiempo?></td>
                           <td><?php echo  $area->nombre ?></td>
                           <td><?php echo $subarea->nombre_subarea ?></td>
                           <td><?php echo  $nivel_gestion->nombre_nivel_formacion ?></td>
                         
			  <td><?php echo $resultado['carrera'] ?></td>
			  <td><?php echo $resultado['departamento'] ?></td>
                          <td><?php echo $resultado['facultad'] ?></td>
                          <td><?php echo   $universidad->nombre_uni; ?></td>
                          <td><?php echo $resultado['condicion'] ?></td>
                          <td><?php echo $resultado['estado'] ?></td>
			  <td><span class="modi"><a href="registro.php?docencia_axuliar_externa_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
                 </div>