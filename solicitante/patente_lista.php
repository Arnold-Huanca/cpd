
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
				url: 'patente_eliminar.php',
				type: "GET",
				data: "patente_id="+id,
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
                        <th>Estado</th><!--Estado-->
                        <th>Nro.</th><!--Estado-->
                           <th>N&uacute;mero de Patente</th>
                        <th>Pa&iacute;s</th>
                     
                        <th>Titulo o Descripci&oacute;n</th><!--Estado-->
                        <th>Fecha</th>
                        <th>&Aacute;rea</th>
                        <th>Sub&aacute;rea</th>
                         <th>Archivo</th>
                         <th>Observaci&oacute;n</th>
                         
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
                        <th></th>
                       
                     
                    </tr>
                </tfoot>
                  <tbody>
               <?php
define ("MODULO", "Solicitante");
  require('../_start.php');
  if(!isUserSession())
    header("Location: index.php"); 
  
  $funcionario_id= $_GET['funcionario_id'];             
$listado=  mysql_query("select * from patente where funcionario_id= $funcionario_id");
     
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Pais");
                
                    while( $resultado = mysql_fetch_array($listado)){
                        
                       
                        $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($resultado['area_id']);
                        $pasis = new Pais($resultado['pais_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                           <td></td>
                           <td><?php   echo $resultado['id']; ?></td>
                           <td><?php   echo $resultado['numero_patente']; ?></td>
                           <td><?php   echo $pasis->nombre_pais; ?></td>
                           <td><?php   echo $resultado['titulo_descripcion']; ?></td>
                            <td><?php  echo $resultado['fechas'] ?></td>
                           <td><?php   echo $area->nombre; ?></td>
                           <td><?php   echo $subarea->nombre_subarea; ?></td>
                             <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>"  /></a></span></td>
		
		           <td><?php echo $resultado['observacion'] ?></td>
                           <td><span class="modi"><a href="patente_detalle.php?patente_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			   <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                <tbody>
            </table>
          </div>