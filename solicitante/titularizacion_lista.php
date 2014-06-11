
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
				url: 'titularizacion_eliminar.php',
				type: "GET",
				data: "titularizacion_id="+id,
				success: function(datos){
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
                        <th>V.B.</th><!--Estado-->
                        <th>Nro.</th><!--Estado-->
                        <th>Fecha de Resolucion</th>
                        <th>Materia</th><!--Estado-->
                        <th>Carrera</th>
                        <th>Departamento</th>
                        <th>Facultad</th>
                        <th>Certificado</th>
                        <th>Observaci&oacute;n</th><!--Estado-->
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
                define ("MODULO", "Solicitante");
                  require('../_start.php');
                  if(!isUserSession())
                    header("Location: index.php"); 
                 $funcionario_id= $_GET['funcionario_id'];

                $listado=  mysql_query("select * from titularizacion where funcionario_id=$funcionario_id");
                $contador=1;   
                leerClase('Documento_titularidad');
                while( $resultado = mysql_fetch_array($listado) ){
                    $documentotitu= new Documento_titularidad($resultado['documento_titularidad_id']);
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id'] ?>">
                           <td><?php echo $resultado['estado'] ?></td>
                           <td><?php echo $contador ?></td>
			   <td><?php echo $resultado['fecha_resolucion'] ?></td>
                           <td><?php echo $resultado['materia_doc'] ?></td>
                           <td><?php echo $resultado['carrera_doc'] ?></td>
                           <td><?php echo $resultado['departamento_doc'] ?></td>
                           <td><?php echo $resultado['facultad_doc'] ?></td>
                           <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
		           <td><?php echo $resultado['observacion'] ?></td>
			   <td><span class="modi"><a href="titularizacion_detalle.php?menus=mostrar&titularizacion_id=<?php echo $resultado['id'] ?>" ><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="titularizacion_eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
	
                           </tr>
	<?php
        $contador++;
	}
  ?>   
                <tbody>
            </table>
          </div>