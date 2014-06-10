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
				url: 'docencia_auxiliar_umss_eliminar.php',
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
  
             <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                          <th>V.B.</th><!--Estado-->
                          <th>Nro.</th>
                          <th>Materia</th>
                          <th>Fecha Inicio</th><!--Estado-->
                          <th>Tipo Gesti&oacute;n</th>
                          <th>Nro. de Gestiones</th>
                          <th>&Aacute;rea</th>
                          <th>Sub&aacute;rea</th>
                          <th>Carrera</th>
                          <th>Departamento</th><!--Estado-->
                          <th>Facultad</th>
                          <th>Docencia/Aux</th>
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
                     $listado=  mysql_query("select d.* from docencia_auxiliatura_umss d where d.funcionario_id=$funcionario_id");
                     leerClase('Tipo_gestion');
                        leerClase('Area');
                        leerClase('Subarea');
                        leerClase('Nivel_formacion');
                     $contador=1;
                    while( $resultado = mysql_fetch_array($listado) ){
                        $tiposgeston= new Tipo_gestion( $resultado['tipo_gestion_id']);
                    $area= new Area($resultado['area_id']);
                    $subarea= new Subarea($resultado['subarea_id']);
                   	?>
	
		   <tr id="fila-<?php echo $resultado['id'] ?>">
                       <td><?php echo $resultado['estado'] ?></td>
                       <td><?php echo $contador ?></td>
                 	  <td><?php echo $resultado['materia'] ?></td>
                           <td><?php echo $resultado['fecha_inicio'] ?></td>
                           <td><?php echo  $tiposgeston->descripcion ?></td>
                           <td><?php echo $resultado['numero_gestiones'] ?></td>
                            <td><?php echo  $area->nombre ?></td>
                           <td><?php echo $subarea->nombre_subarea ?></td>
			  <td><?php echo $resultado['carrera'] ?></td>
			  <td><?php echo $resultado['departamento'] ?></td>
                           <td><?php echo $resultado['facultad'] ?></td>
                            <td><?php echo $resultado['condicion'] ?></td>
                         <td><span class="modi"><a ><img  width="20" height="20" src="<?php echo '../'.$resultado['archivo'] ?>" /></a></span></td>
			
                      
                            <td><?php echo $resultado['observacion'] ?></td>
                           <td><span class="modi"><a href="docencia_auxiliar_umss_detalle.php?menus=mostrar&docencia_auxiliar_umss_id=<?php echo $resultado['id'] ?>" ><img src="../images/edit.png" title="Ver" alt="Editar" /></a></span></td>
			  <td><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="docencia_auxiliar_umss_eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></td>
	 
                   </tr>
	<?php
        $contador++;
	}
  ?>   
                <tbody>
            </table>
          </div>