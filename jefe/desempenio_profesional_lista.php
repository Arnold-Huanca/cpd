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
				url: 'desempenio_profesional_eliminar.php',
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
                       <th>V.B.</th><!--Estado-->
                        <th>Nro.</th><!--Estado-->
                        <th>Instituci&oacute;n</th>
                        <th>Cargo</th>
                        <th>Nivel del Cargo</th>
                        <th>Fecha de Inicio</th>
                        <th>Fecha de Conclusi&oacute;n</th>
                        <th>&Aacute;rea</th><!--Estado-->
                        <th>Sub&aacute;rea</th>
                        <th>Pa&iacute;s</th>
                        <th>Certificado</th>
                        <th>Observacion</th>
                       
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
                    define ("MODULO", "Jefe");
                    require('../_start.php');
                    if(!isUserSession())
                    header("Location: index.php"); 
                   leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Pais");
                     $funcionario_id= $_GET['funcionario_id'];
             $listado=  mysql_query("select d.* from  desemp_prof_externo d where d.funcionario_id=$funcionario_id");
              
     $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                       $area= new Area($resultado['area_id']);
                      $subarea= new Subarea($resultado['subarea_id']);
                     $pasis = new Pais($resultado['pais_id']);
                        
                        
                  	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                        <td><?php echo $resultado['estado'] ?></td>
                 	 <td><?php echo $contador; ?></td>
                           <td><?php echo $resultado['institucion']; ?></td>
                           <td><?php echo $resultado['cargo']; ?></td>
                           <td><?php echo $resultado['nivel_cargo']; ?></td>
                           <td><?php echo $resultado['fecha_inicio']; ?></td>
                           <td><?php echo $resultado['fecha_conclusion']; ?></td>
                           <td><?php echo $area->nombre; ?></td>
                           <td><?php echo $subarea->nombre_subarea; ?></td>
                             <td><?php echo $pasis-> nombre_pais?></td>
		          <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			<td><?php echo $resultado['observacion']; ?></td>
                        		  </tr>
	<?php
        $contador++;
	}
  ?>   
                <tbody>
            </table>
          </div>