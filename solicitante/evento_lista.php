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
     
             <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>Tipo Evento</th>
                        <th>Nombre Evento</th>
                        <th>Tema</th>
                        <th>Fecha Inicio</th> 
                        <th>Duraci&oacute;n</th> 
                        <th>&Aacute;rea</th> 
                        <th>Sub &Aacute;rea</th> 
                        <th>Ambito</th> 
                        <th>Tipo Participaci&oacute;n</th>
                        <th>Instituci&oacute;n Organizadora</th>
                        <th>Organizado Por Instancia U.</th>
                        <th>Pa&iacute;s</th> 
                        <th>Estado</th> 
                        <th>Ver Datos </th>
                       
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
                   define ("MODULO", "Solicitante");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                  $funcionario_id= $_GET['funcionario_id'];
                  leerClase("Tipo_evento");
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Ambito");
                  leerClase("Tipo_participacion");
                  leerClase("Pais");
                  $listado=  mysql_query("select f.* from  evento f where f.funcionario_id=$funcionario_id");

                    while( $resultado = mysql_fetch_array($listado)){
                        
                        $tipoevento= new Tipo_evento($resultado['tipo_evento_id']);
                        $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area( $subarea->area_id);
                        $ambito= new Ambito($resultado['ambito_id']);
                        $tipoparticipacion= new Tipo_participacion($resultado['tipo_participacion_id']);
                        $pasis = new Pais($resultado['pais_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                             
                             <td><?php echo $tipoevento->descripcion; ?></td>
                                <td><?php echo $resultado['nombre_evento']; ?></td>
                         
                           <td><?php echo $resultado['tema_expocicion']; ?></td>
                           <td><?php echo $resultado['fecha_inicio']; ?></td>
                           <td><?php echo $resultado['duracion']; ?></td>
                           <td><?php echo $area->nombre; ?></td>
                           <td><?php echo $subarea->nombre_subarea; ?></td>
                           <td><?php echo $ambito->nombre_ambito; ?></td>
                           <td><?php echo $tipoparticipacion->descripcion; ?></td>
                            <td><?php echo $resultado['entidad_organizadora'] ?></td>
			  <td><?php echo $resultado['organizado_por_instacia_univ'] ?></td>
			  <td><?php echo $pasis-> nombre_pais?></td>
		         <td><?php echo $resultado['estado'] ?></td>
                          <td><span class="modi"><a href="evento_detalle.php?menus=mostrar&evento_id=<?php echo $resultado['id'] ?>" ><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
         </div>
