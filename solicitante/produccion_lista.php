<?php 

 define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php");  
  $funcionario_id= $_GET['funcionario_id'];

$listado=  mysql_query("select * from produccion  where funcionario_id=$funcionario_id");
?>
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
				url: 'produccion_eliminar.php',
				type: "GET",
				data: "produccion_id="+id,
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
           <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>
     
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                          <th>V.B.</th>
                           <th>Nro.</th>
                        <th>Tipo de Producci&oacute;n</th>
                        <th>Titutlo de Tema</th>
                        <th>Titulo de Circulacion</th><!--Estado-->
                         <th>Medio Difusion</th>
                        <th>Institucion de Entrega</th>
                        <th>Fecha de Conclucion</th>
                        <th>&Aacute;rea</th>
                        <th>Subarea</th>
                        <th>&Aacute;mbito</th>
                        <th>Certificado</th>
                        <th>Observacci&oacute;n</th>
                        <th>Validar</th>
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
                      leerClase('Ambito');
                      leerClase('Subarea');
                      leerClase('Area');
                      leerClase('Tipo_produccion');
                      leerClase('Medio_difusion');
                      
                      
                      $contador=1;
                    while( $resultado = mysql_fetch_array($listado) )
                      {
                             $tipo= new Tipo_produccion($resultado['tipo_produccion_id'] );
                              $medio= new Medio_difusion($resultado['medio_difunsion_id']);
                             $area= new Area($resultado['area_id']);
                             $subarea= new Subarea($resultado['subarea_id']);
                             $ambito= new Ambito($resultado['ambito_id']);
                   
                              ?>
	
		  <tr id="fila-<?php echo $resultado['id'] ?>">
                      
                    <td><?php echo $resultado['estado'] ?></td>
                  <td><?php echo $contador ?></td>
                  <td><?php echo $tipo->descripcion; ?></td>
                  <td><?php echo $resultado['titulo_tema'] ?></td>
		  <td><?php echo $resultado['tipo_circulacion'] ?></td>
		  <td><?php echo $medio->sigla; ?></td>
                  <td><?php echo $resultado['institucion_entrega'] ?></td>
                   <td><?php echo $resultado['fecha_conclucion'] ?></td>
                   <td><?php echo $area->nombre ?></td>
                   <td><?php echo  $subarea->nombre_subarea ?></td>
                  <td><?php echo $ambito->nombre_ambito ?></td>
                   <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
                    <td><?php echo $resultado['observacion']; ?></td>
			  
                  <td><span class="modi"><a href="produccion_detalle.php?menus=mostrar&producion_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
		     <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="produccion_eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
		
                  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
        </div>