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
         <center><h2>Formacion Academica Profecional </h2></center>
         <br>
         <h4>Grados optenidos dentro el sistema de universidades de Bolivia </h4>
          <span class="modi"><a href="registro.php"><img src="../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
		 <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Grado</th>
                          <th>Fecha Titulo</th>
                           <th>com Tesis</th>
                            <th>Titulo Tesis, Trabajo final</th>
                            <th>Duraci&oacute;n</th>
                            <th>&Aacute;rea</th>
                            <th>Sub&aacute;rea</th>
                             <th>Institucion donde Obtuvo el Grado</th>
                             <th>Pa&iacute;s</th><!--Estado-->
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
                        
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
                  define ("MODULO", "Formación Pregrado");
                  if(!isUserSession())
                  header("Location: index.php"); 
		 $idfuncionario=  getSessionUser()->getFuncionario()->id;
                  $listado=  mysql_query("select * from  formacion_pregrado where  funcionario_id=$idfuncionario");
                  leerClase('Grado_academico');
                  leerClase('Unidad_tiempo');
                  leerClase('Area');
                  leerClase('Subarea');
                  leerClase('Pais');
                  while( $resultado = mysql_fetch_array($listado) )
                  {
                      $grado= new Grado_academico($resultado['grado_academico_id']);
                      $area= new Area($resultado['area_id']);
                      $subarea= new Subarea($resultado['subarea_id']);
                        
                      $pais= new Pais($resultado['pais_id']);
                      $unidad_tiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                  
                  ?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                     <td><?php echo $resultado['id'] ?></td>
                         <td><?php echo $grado->descripcion ?></td>
                          <td><?php echo $resultado['fecha_titulo'] ?></td>
                          <td><?php echo $resultado['tesis_pregrado'] ?></td>
                          <td><?php echo $resultado['titulo_tesis_pregrado'] ?></td>
			  <td><?php echo $resultado['duracion_curso_pregrado'] .' '.$unidad_tiempo->nombre_unidad_tiempo?></td>
			  <td><?php echo $area->nombre ?></td>
			  <td><?php echo $subarea->nombre_subarea ?></td>
                           <td><?php echo $resultado['otra_institucion'] ?></td>
                            <td><?php echo $pais->nombre_pais ?></td>
			   <td><span class="modi"><a href="registro.php?formacion_pregrado_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?ambito_id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
                <?php
                }
          ?>   
                <tbody>
            </table>
                     
               
                 </div>
          <br>
               <h4>Titulos en provición nacional obetenidos dentro del sistema de universidades de Bolivia </h4>  
