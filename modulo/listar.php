<?php 

define ("MODULO", "Modulo");
  require('../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 
$listado=  mysql_query("select * from modulo");
?>
  <script type="text/javascript">
   $(document).ready(function(){
   $('#tabla_lista_paises').dataTable( { //CONVERTIMOS NUESTRO LISTADO DE LA FORMA DEL JQUERY.DATATABLES- PASAMOS EL ID DE LA TABLA
        "sPaginationType": "full_numbers" //DAMOS FORMATO A LA PAGINACION(NUMEROS)
    } );
})

         </script> 
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                       <th>Codigo</th>
                        <th>Nombre</th>
                         <th>Descripcion</th><!--Estado-->
                        <th>Estado</th>
                        <th>Editar</th>
                      
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

     
                   while($resultado=  mysql_fetch_array($listado))
                     {
                       
                     ?>
                          <tr id="fila-<?php echo $resultado['id'] ?>">
                          <td><?php echo $resultado['id'] ?></td>
                          <td><?php echo $resultado['codigo'] ?></td>
			  <td><?php echo $resultado['nombre'] ?></td>
                          
			  <td><?php echo $resultado['descripcion'] ?></td>
                           <td><?php echo $resultado['estado'] ?></td>
			   <td><span class="modi"><a href="registro.php?modulo_id=<?php echo $resultado['id'] ?>"><img src="../images/edit.png" title="Editar" alt="Editar" /></a></span></td>
                          </tr>
                               <?php
                     }
                    ?>
                <tbody>
            </table>
