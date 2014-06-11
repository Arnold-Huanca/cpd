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
				url: 'distincion_detalle.php',
				type: "GET",
				data: "distincion_id="+id,
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
                          <th>V.B.:</th>
                        <th>Nro.</th><!--Estado-->
                        <th>Tipo</th>
                        <th>Nombre Distic&oacute;n</th>
                        <th>Instituci&oacute;n que lo Distingue</th>
                        <th>Fecha</th><!--Estado-->
                         <th>Universitaria Si/No</th><!--Estado-->
                         <th>&Aacute;mbito</th>
                         <th>Pa&iacute;s</th>
                        <th>Certificado</th>
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
                  require  '../_start.php';
                   define ("MODULO", "Solicitante");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                  $funcionario_id= $_GET['funcionario_id'];
                     $listado=  mysql_query("select d.* from distincion d where d.funcionario_id=$funcionario_id");
                      leerClase('Pais');
                     leerClase("Tipo_distincion");
                     $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                  	  $pais= new Pais($resultado['pais_id'] );
                        $tipodistincion= new Tipo_distincion($resultado['tipo_distincion_id'] );

              
                        ?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                                <td><?php echo $resultado['estado'] ?></td>
                           <td><?php echo  $contador ?></td>
                           <td><?php echo $tipodistincion->sigla ?></td>
			   <td><?php echo $resultado['nombre_distincion'] ?></td>
			   <td><?php echo $resultado['institucion'] ?></td>
                             <td><?php echo $resultado['fecha'] ?></td>
                             <td><?php echo $resultado['universitaria'] ?></td>
                            <td><?php echo $resultado['ambitodistincion'] ?></td>
                             <td><?php echo $pais->nombre_pais;?></td>
                                 <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
		
                               <td><?php echo $resultado['observacion']; ?></td>
                              <td><span class="modi"><a href="distincion_detalle.php?distincion_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
	  </tr>
	<?php
         $contador++;
	}
  ?>   
                <tbody>
            </table>
                 </div>