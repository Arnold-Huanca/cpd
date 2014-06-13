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
				url: 'ejercicio_liberal_eliminar.php',
				type: "GET",
				data: "id="+id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+id).remove();
				}});
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
                        <th>Instituci&oacute;n o Empresa</th>
                        <th>Nombre de Cargo o Actividad</th>
                        <th>Tipo</th>
                        <th>Fecha Inicio</th> 
                        <th>Duraci&oacute;n</th>
                        <th>&Aacute;rea</th> 
                        <th>Sub&aacute;rea</th>
                        <th>Pa&iacute;s</th>
                         <th>Certificado</th>
                         <th>Obsercaci&oacute;n</th>
                        <th>Validar</th>
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
                      
                     </tr>
                </tfoot>
                  <tbody>
                   
                    <?php
                  require  '../_start.php';
               define ("MODULO", "Jefe");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                  $funcionario_id= $_GET['funcionario_id'];
                     $listado=  mysql_query("select d.* from ejercicio_liberal_prof d where d.funcionario_id=$funcionario_id");
                        leerClase("Area");
                        leerClase("Subarea");
                        leerClase("Pais");
                        leerClase('Unidad_tiempo');
                        $contador=1;
                    while( $resultado = mysql_fetch_array($listado) )
                        {
                            
                       $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($subarea->area_id);
                       $pasis = new Pais($resultado['pais_id']);
                        $unidadtiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
          
                     	?>
	
		            <tr id="fila-<?php echo $resultado['id']; ?>"> 
                           
                           <td><?php echo $resultado['estado'] ?></td>
                           <td><?php echo $contador ?></td>
                           <td><?php echo $resultado['institucion_actividad']; ?></td>
                           <td><?php echo $resultado['cargo_actividad']; ?></td>
                            <td><?php echo $resultado['tipo']; ?></td>
                           <td><?php echo $resultado['fecha_inicio']; ?></td>
                           <td><?php echo $resultado['duracion']; ?></td>
                           <td><?php echo $area->nombre; ?></td>
                           <td><?php echo $subarea->nombre_subarea; ?></td>
                            <td><?php echo $pasis-> nombre_pais?></td>
		              <td><span class="modi"><a  href="<?php echo '../'.$resultado['archivo'] ?>  " target="_blank" ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
                               <td><?php echo $resultado['observacion']; ?></td>
			   	
			  </tr>
	<?php
        $contador++;
	}
  ?>   
                <tbody>
            </table>
         </div>
