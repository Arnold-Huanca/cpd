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
				url: 'plan_proyecto_eliminar.php',
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
                          <th>Nro.</th>
                        <th>Tipo</th>
                        <th>Titulo</th><!--Estado-->
                        <th>Fecha Inicio</th>
                        <th>Beneficiario</th>
                        <th>Duraci&oacute;n</th>
                        <th>Unidad Ejecutora</th>
                        <th>Universidad</th>
                     
                        <th> &Aacute;rea</th>
                        <th>Sub&aacute;rea</th>
                         <th> &Aacute;mbito</th>
                        <th>Tipo de Participaci&oacute;n</th>
                        <th>Certificado</th>
                        <th>Observaci&oacute;n</th>
                        
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
                  
                
                  $listado=  mysql_query("select f.* from  plan_proyecto_programa f where f.funcionario_id= $funcionario_id");
                  leerClase("Tipo_evento");
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Ambito");
                  leerClase("Tipo_participacion");
                  leerClase("Unidad_tiempo");
                  $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                        
                         $subarea= new Subarea($resultado['subarea_id']);
                        $area= new Area($resultado['area_id']);
                        $ambito= new Ambito($resultado['ambito_id']);
                        $tipoparticipacion= new Tipo_participacion($resultado['tipo_participacion_id']);
                              $unidadtiempo= new Unidad_tiempo($resultado['unidad_tiempo_id']);
                 
                            	?>
	
		          <tr id="fila-<?php echo $resultado['id'] ?>">
                              <td><?php echo $resultado['estado']; ?></td>
                              <td><?php echo $contador; ?></td>
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
                               <td><span class="modi"><a  href="<?php echo '../'.$resultado['archivo'] ?>  " target="_blank" ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			
                           <td><?php echo $resultado['observacion'] ?></td>
                                      </tr>
	<?php
          $contador++;
	}
  ?>   
                </tbody>
            </table>
</div>