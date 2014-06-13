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
         	 <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
     
             <table cellpadding="0" cellspacing="0" border="0" class="display" >
                <thead>
                    <tr>
                             <th>V.B.</th><!--Estado-->
                           <th>Nro.</th><!--Estado-->
                           <th>Grado</th>
                           <th>Fecha Titulo</th>
                           <th>com Tesis</th>
                            <th>Titulo Tesis, Trabajo final</th>
                            <th>Duraci&oacute;n</th>
                            <th>&Aacute;rea</th>
                            <th>Sub&aacute;rea</th>
                             <th>Institucion donde Obtuvo el Grado</th>
                             <th>Pa&iacute;s</th><!--Estado-->
                             <th>Archivo</th><!--Estado-->
                             <th>Observacion</th><!--Estado-->
                        
                       
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
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                   define ("MODULO", "Jefe");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                  $funcionario_id= $_GET['funcionario_id'];
                  
                  $listado=  mysql_query("select f.* from  formacion_pregrado f where f.funcionario_id=$funcionario_id");
 leerClase('Grado_academico');
                  leerClase('Unidad_tiempo');
                  leerClase('Area');
                  leerClase('Subarea');
                  leerClase('Pais');
                  $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                          $grado= new Grado_academico($resultado['grado_academico_id']);
                        $area= new Area($resultado['area_id']);
                         $subarea= new Subarea($resultado['subarea_id']);
                        
                         $pais= new Pais($resultado['pais_id']);
                        $unidad_tiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                  
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                          <td><?php echo $resultado['estado'] ?></td>
                            <td><?php echo  $contador ?></td>
                         <td><?php echo $grado->descripcion ?></td>
                          <td><?php echo $resultado['fecha_titulo'] ?></td>
                          <td><?php echo $resultado['tesis_pregrado'] ?></td>
                          <td><?php echo $resultado['titulo_tesis_pregrado'] ?></td>
			  <td><?php echo $resultado['duracion_curso_pregrado'] .' '.$unidad_tiempo->nombre_unidad_tiempo?></td>
			  <td><?php echo $area->nombre ?></td>
			  <td><?php echo $subarea->nombre_subarea ?></td>
                           <td><?php echo $resultado['otra_institucion'] ?></td>
                            <td><?php echo $pais->nombre_pais ?></td>
                              <td><span class="modi"><a href="<?php echo '../'.$resultado['archivo'] ?>  " target="_blank"   ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			   <td><?php echo  $resultado['observacion'] ?></td>
                        
                     
                           
						  </tr>
	<?php
         $contador++;
	}
  ?>   
                <tbody>
            </table>
                 </div>