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
				data: "ambito_id="+id,
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
         <center>Formacion Academica Profecional </p></center><p>
          <span class="modi"><a href="registro.php"><img src="../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
		 <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                         <th>Grado</th><!--Estado-->
                        <th>Fecha titulo</th>
                        <th>Tesis (si/no)</th><!--Estado-->
                        <th>Ttulo tesis proyecto o trabajo final</th><!--Estado-->
                        <th>Duraci&oacute;n curso</th><!--Estado-->
                         <th>Horas Presenciales</th><!--Estado-->
                         <th>Horas no Presenciales</th><!--Estado-->
                         <th>Cr&eacute;ditos</th><!--Estado-->
                         <th>&Aacute;rea</th><!--Estado-->
                         <th>sub&aacute;rea</th><!--Estado-->
                         <th>Instituci&oacute;n donde Obtuvo el Grado</th><!--Estado-->
                         <th>Pa&iacute;s donde Obtuvo el Grado</th><!--Estado-->
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
                         <th></th>
                          <th></th>
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                 define ("MODULO", "Formación Postgrado");
                  if(!isUserSession())
                  header("Location: index.php"); 
		  $idfuncionario=  getSessionUser()->getFuncionario()->id;
                 leerClase('Grado_academico');
                  leerClase('Unidad_tiempo');
                  leerClase('Area');
                  leerClase('Subarea');
                  leerClase('Pais');
                  $listado=  mysql_query("select * from  formacion_postgrado where  funcionario_id=$idfuncionario");
                     while( $resultado = mysql_fetch_array($listado) ){
                         
                           $grado= new Grado_academico($resultado['grado_academico_id']);
                        $area= new Area($resultado['area_id']);
                         $subarea= new Subarea($resultado['subarea_id']);
                        
                         $pais= new Pais($resultado['pais_id']);
                        $unidad_tiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                         <td><?php echo $resultado['id'] ?></td>
                         <td><?php echo $grado->descripcion ?></td>
                          <td><?php echo $resultado['fecha_titulo_post'] ?></td>
                          <td><?php echo $resultado['tesis_post'] ?></td>
                          <td><?php echo $resultado['titulo_post'] ?></td>
			  <td><?php echo $resultado['duracion_curso_post'] .' '.$unidad_tiempo->nombre_unidad_tiempo?></td>
			  <td><?php echo $resultado['hrs_presenciales_post'] ?></td>
                          <td><?php echo $resultado['hrs_no_presenciales_post'] ?></td>
                           <td><?php echo $resultado['creditos_post'] ?></td>
                          <td><?php echo $area->nombre ?></td>
			  <td><?php echo $subarea->nombre_subarea ?></td>
                           <td><?php echo $resultado['institucion_post'] ?></td>
                            <td><?php echo $pais->nombre_pais ?></td>
                             <td><?php echo $resultado['estado'] ?></td>
			  <td><span class="modi"><a href="registro.php?formacion_postgrado_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?ambito_id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
                 </div>
