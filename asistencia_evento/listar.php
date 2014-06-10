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
                         <th>Tipo de Evento</th>
                         <th>Nombre de Evento</th>
                         <th>Fecha Inicio</th>
                         <th>Duraci&oacute;n</th>
                         <th>Tipo Certificado</th>
                         <th>&Aacute;rea</th>
                         <th>Sub&aacute;rea</th>
                         <th>&Aacute;mbito</th>
                         <th>Organizador del Evento</th>
                         <th>Programa de Formaci&oacute;n</th>
                         <th> Pa&iacute;s</th><!--Estado-->
                        
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
                             
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  define ("MODULO", "Asistencia Evento");
                    require('../_start.php');
                    if(!isUserSession())
                    header("Location: index.php"); 

                  leerClase("Usuario");
                  $idfuncionario=  getSessionUser()->getFuncionario()->id;
                   $listado=  mysql_query("select * from asistencia_evento where funcionario_id=$idfuncionario");
                   leerClase("Tipo_evento");
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Ambito");
                  leerClase("Tipo_participacion");
                  leerClase("Pais");
                  leerClase("Unidad_tiempo");
                    while( $resultado = mysql_fetch_array($listado) ){
                        
                        $tipo_evento= new Tipo_evento($resultado['tipo_evento_id']);
                        $area= new Area($resultado['area_id']);
                         $subarea= new Subarea($resultado['subarea_id']);
                         $ambito= new Ambito($resultado['ambito_id']);
                         $pais= new Pais($resultado['pais_id']);
                        $unidad_tiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                    
                                
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                         <td><?php echo $resultado['id'] ?></td>
                          <td><?php echo  $tipo_evento->descripcion ?></td>
			  <td><?php echo $resultado['nombre_evento'] ?></td>
                          <td><?php echo $resultado['fecha_inicio'] ?></td>
                          <td><?php echo $resultado['duracion'] .' '.    $unidad_tiempo->nombre_unidad_tiempo?></td>
                          <td><?php echo $resultado['tipo_certificado_id'] ?></td>
                           <td><?php echo $area->nombre ?></td>
                           <td><?php echo $subarea->nombre_subarea ?></td>
                           <td><?php echo $ambito->nombre_ambito?></td>
                            <td><?php echo $resultado['entidad_organizadora'] ?></td>
                         <td><?php echo $resultado['del_programa_formacion_doc'] ?></td>
                         <td><?php echo  $pais->nombre_pais ?></td>
                           <td><span class="modi"><a href="registro.php?asistencia_evento_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		  </tr>
	<?php
	}
  ?>   
                </tbody>
            </table>
  </div>