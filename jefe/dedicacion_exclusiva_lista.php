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
				url: 'dedicacion_exclusiva_eliminar.php',
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
                       <th>V.B.</th>
                       <th>Nro.</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Concluci&oacute;n</th><!--Estado-->
                        <th>Tipo Gesti&oacute;n</th>
                        <th>Nro. Gestiones</th>
                        <th>Unidad Academica</th>
                        <th>Ambito</th>
                        <th>Observaci&oacute;n</th>
                        <th>Certificado</th>
                      
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
                     $listado=  mysql_query("select d.* from dedicacion_exclusiva d where d.funcionario_id=$funcionario_id");
           
                     leerClase('Ambito');
                     leerClase('Tipo_gestion');
                     $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                  	   $tipogestion= new Tipo_gestion($resultado['tipo_gestion_id']);
                         $ambito = new Ambito($resultado['ambito_id']);
                        
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                        <td><?php echo $resultado['estado'] ?></td>
                         <td><?php echo $contador ?></td>
                 	  <td><?php echo $resultado['fecha_inicio'] ?></td>
			  <td><?php echo $resultado['fecha_fin'] ?></td>
                           <td><?php echo $tipogestion->descripcion; ?></td>
                             <td><?php echo $resultado['numero_gestiones'] ?></td>
                              <td><?php echo $resultado['unidad_academica'] ?></td>
                              <td><?php echo $ambito->nombre_ambito; ?></td>
			    <td><?php echo $resultado['observacion'] ?></td>
                              <td><span class="modi"><a  href="<?php echo '../'.$resultado['archivo'] ?>  " target="_blank" ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			    	  
                   </tr>
	<?php
        $contador++;
	}
  ?>   
                <tbody>
            </table>
            </div>