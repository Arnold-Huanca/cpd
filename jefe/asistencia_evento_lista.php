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
				url: 'asistencia_evento_eliminar.php',
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
         <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
    
             <table cellpadding="0" cellspacing="0" border="0" class="display" >
                <thead>
                    <tr>
                         <th>Estado</th><!--Estado-->
                         <th>Nro.</th><!--Estado-->
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
                         <th> Observaci&oacute;n </th><!--Estado-->
                          <th>Certificado</th><!--Estado-->
                         
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
                  require  '../_start.php';
                 define ("MODULO", "Jefe");
                  if(!isUserSession())
                  header("Location: index.php"); 
                    
                  $funcionario_id= $_GET['funcionario_id'];
                  
                    $listado=  mysql_query("select * from asistencia_evento where funcionario_id=$funcionario_id");
           
                  leerClase("Tipo_evento");
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Ambito");
                  leerClase("Tipo_participacion");
                  leerClase("Pais");
                  leerClase("Unidad_tiempo");
                  $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                        
                        $tipo_evento= new Tipo_evento($resultado['tipo_evento_id']);
                        $area= new Area($resultado['area_id']);
                         $subarea= new Subarea($resultado['subarea_id']);
                         $ambito= new Ambito($resultado['ambito_id']);
                         $pais= new Pais($resultado['pais_id']);
                        $unidad_tiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                    
                            	?>
	
		          <tr id="fila-<?php echo $resultado['id'] ?>">
                                <td><?php echo   $resultado['estado']?></td>
                          <td><?php echo   $contador?></td>
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
                            <td><?php echo  $resultado['observacion'] ?></td>
                              <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			
                        
                          </tr>
	<?php
          $contador++;
	}
  ?>   
                </tbody>
            </table>
</div>