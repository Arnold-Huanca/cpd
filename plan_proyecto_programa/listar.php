
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
				data: "plan_proyecto_programa_id="+id,
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
                        <th>Tipo</th>
                        <th>Titulo</th><!--Estado-->
                        <th>Fecha Inicio</th>
                        <th>Beneficiario</th>
                        <th>Duracion</th>
                        <th>Unidad Ejecutora</th>
                        <th>Universidad</th>
                     
                        <th> &Aacute;rea</th>
                        <th>Sub&aacute;rea</th>
                         <th> &Aacute;mbito</th>
                        <th>Tipo de Participaci&oacute;n</th>
                       
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
                    <?php


            define ("MODULO", "Plan Proyecto Programa");
              require('../_start.php');
              if(!isUserSession())
                header("Location: index.php");  
             $idfuncionario=  getSessionUser()->getFuncionario()->id;
   
                   leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Ambito");
                  leerClase("Tipo_participacion");
                    leerClase('Unidad_tiempo');
                  //    $listado=  mysql_query("select * from plan_proyecto_programa");
    
                  $listado=  mysql_query("select f.* from  plan_proyecto_programa f where f.funcionario_id= $idfuncionario");

                    while( $resultado = mysql_fetch_array($listado)){
                      $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($resultado['area_id']);
                        $ambito= new Ambito($resultado['ambito_id']);
                        $tipoparticipacion= new Tipo_participacion($resultado['tipo_participacion_id']);
                              $unidadtiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                              <td><?php echo $resultado['id']; ?></td>
                             <td><?php echo $resultado['tipo']; ?></td>
                              <td><?php echo $resultado['titulo']; ?></td>
                           <td><?php echo $resultado['fecha_inicio']; ?></td>
                           <td><?php echo $resultado['beneficiario']; ?></td>
                           <td><?php echo $resultado['duracion'] . ' '. $unidadtiempo->nombre_unidad_tiempo ; ?></td>
                            <td><?php echo $resultado['unidad_ejecutora'] ?></td>
                           <td><?php echo $resultado['otra_universidad'] ?></td>
                          
                           <td><?php echo $area->nombre; ?></td>
                            <td><?php echo $subarea->nombre_subarea; ?></td>
                           <td><?php echo $ambito->nombre_ambito; ?></td>
                           <td><?php echo $tipoparticipacion->descripcion; ?></td>
                           <td><?php echo $resultado['estado'] ?></td>
                           <td><span class="modi"><a href="registro.php?plan_proyecto_programa_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
        </div>