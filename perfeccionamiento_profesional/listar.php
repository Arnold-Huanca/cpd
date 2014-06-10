
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
				data: "perfeccionamiento_profecional_id="+id,
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
                        <th>Tipo de Perfeccionamiento</th>
                        <th>Fecha Certificado</th>
                         <th>Certificado</th>
                          
                         <th>T&iacute;tulo</th>
                        <th>Diploma</th>
                        <th>T&iacute;tulo Trabajo Final</th>
                        <th>Menci&oacute;n</th>
                        <th>Duraci&oacute;n del Curso</th>
                        <th>Hrs. Presenciales</th>
                        <th>Hrs. No Presenciales</th>
                        <th>Cr&eacute;ditos</th>
                        
                        <th>&Aacute;</th>
                        <th>Sub&aacute;rea</th>
                        <th>Institucion donde obtuvo el grado</th>
                        <th>Pa&iacute;s</th>
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
                  define ("MODULO", "Perfeccionamiento Profesional");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  $idfuncionario=  getSessionUser()->getFuncionario()->id;
   
                 
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Tipo_perfeccionamiento");
                  leerClase("Pais");
                  $listado=  mysql_query("select f.* from perfeccionamiento_profecional f where f.funcionario_id= $idfuncionario");

                    while( $resultado = mysql_fetch_array($listado)){
                        
                        $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($subarea->area_id);
                         $tipoparticipacion= new Tipo_perfeccionamiento($resultado['tipo_perfeccionamiento_id']);
                        $pasis = new Pais($resultado['pais_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                           <td><?php echo  $resultado['id']; ?></td>
                           <td><?php echo  $tipoparticipacion->sigla; ?></td>
                           <td><?php echo $resultado['fecha_certificado']; ?></td>
                           <td><?php echo $resultado['certificado']; ?></td>
                           <td><?php echo $resultado['titulo']; ?></td>
                           <td><?php echo $resultado['diplona']; ?></td>
                           <td><?php echo $resultado['titulo_trabajo_final']; ?></td>
                           <td><?php echo $resultado['mencion']; ?></td>
                           <td><?php echo $resultado['duracion_curso'] ?></td>
                           <td><?php echo $resultado['hrs_presenciales'] ?></td>
                          <td><?php echo $resultado['hrs_no_presenciales'] ?></td>
                          <td><?php echo $resultado['creditos'] ?></td>
                          <td><?php echo $area->nombre; ?></td>
                          <td><?php echo $subarea->nombre_subarea; ?></td>
                          <td><?php echo $resultado['otra_institucion'] ?></td>
                          <td><?php echo $pasis-> nombre_pais?></td>
		          <td><?php echo $resultado['estado'] ?></td>
                          <td><span class="modi"><a href="registro.php?perfeccionamiento_profecional_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
        </div>