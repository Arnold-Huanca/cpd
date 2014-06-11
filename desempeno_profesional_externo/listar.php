
  <script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paises').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
        "sPaginationType": "full_numbers" //DAMOS FORMATO A LA PAGINACION(NUMEROS)
    } );
})

         </script>  
           <span class="modi"><a href="registro.php"><img src="../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
	 <div style='height:auto; width: 100%; font-size: 12px; overflow: auto;'>	
   
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Instituci&oacute;n</th>
                      
                        <th>Cargo</th>
                        <th>Nivel del Cargo</th>
                        <th>Fecha de Inicio</th>
                        <th>Fecha de Conclusi&oacute;n</th>
                        <th>&Aacute;rea</th><!--Estado-->
                        <th>Sub&aacute;rea</th>
                        <th>Pa&iacute;s</th>
                        <th>Estado</th>
                        <th>Editar</th>
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
                   define ("MODULO", "Desempeño Profesional Externo");
                  if(!isUserSession())
                  header("Location: index.php"); 
                  
                      
                $idfuncionario=  getSessionUser()->getFuncionario()->id;
   
                  
                  leerClase("Area");
                  leerClase("Subarea");
                  leerClase("Pais");
                   $listado=  mysql_query("select d.* from  desemp_prof_externo d where d.funcionario_id=$idfuncionario");
              
     
                   while($resultado=  mysql_fetch_array($listado))
                     {
                     $area= new Area($resultado['area_id']);
                      $subarea= new Subarea($resultado['subarea_id']);
                     $pasis = new Pais($resultado['pais_id']);
                        
                  	?>
	
		           <tr id="fila-<?php echo $resultado['id']; ?>">
                             <td><?php echo $resultado['id']; ?></td>
                           <td><?php echo $resultado['institucion']; ?></td>
                           <td><?php echo $resultado['cargo']; ?></td>
                           <td><?php echo $resultado['nivel_cargo']; ?></td>
                           <td><?php echo $resultado['fecha_inicio']; ?></td>
                           <td><?php echo $resultado['fecha_conclusion']; ?></td>
                           <td><?php echo $area->nombre; ?></td>
                           <td><?php echo $subarea->nombre_subarea; ?></td>
                                   <td><?php echo $pasis-> nombre_pais?></td>
		         <td><?php echo $resultado['estado'] ?></td>
                          <td><span class="modi"><a href="registro.php?desemp_prof_externo_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
			  <td><span class="dele"><a onClick="EliminarDato(<?php echo $resultado['id'] ?>); return false" href="eliminar.php?id=<?php echo $resultado['id'] ?>"><img src="../images/delete.png" title="Eliminar" alt="Eliminar" /></a></span></td>
		  </tr>
	<?php
	}
  ?>   
                </tbody>
            </table>
         </div>
