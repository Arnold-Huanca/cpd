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
				url: 'eliminar.php',
				type: "GET",
				data: "dominio_idioma_id="+id,
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
             <h1> Idioma</h1>
         <table cellpadding="0" cellspacing="0" border="0" class="display" >
                <thead>
                    <tr>
                        <th>Idioma</th><!--Estado-->
                        <th>Habla</th>
                        <th>Lee</th><!--Estado-->
                        <th>Escribe</th><!--Estado-->
                    </tr>
                </thead>
                <tfoot>
                    <tr>
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
                     $idfuncionario=  $_GET['funcionario_id'];
                     // $listado=  mysql_query("select * from dominio_idioma where funcionario_id=$idfuncionario");

                  $listado=  mysql_query("select * from idioma");

                    while( $resultado = mysql_fetch_array($listado) ){
                         $ididioma= $resultado['id'];
                            $dominio=  mysql_query("select D.* from dominio_idioma  d WHERE d.funcionario_id=$idfuncionario and d.id_idioma=$ididioma");
                      ?>
                       <tr id="fila-<?php echo $resultado['id'] ?>">
                       <td><?php echo $resultado['nombre_idioma'];?></td>
                      <?php
                        if(mysql_num_rows( $dominio) > 0)
                        {
                          $resuldomi = mysql_fetch_array( $dominio);
                        ?>
                      
                                <td>
                                    <?php 
                                     if($resuldomi['habla']=="bien")
                                     {
                                    ?>
                                    <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/addd.png" title="Seleccione"/></a> Bien</span><br>
                                
                                    <?php 
                                     }else{?>
                                    
                                      <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione"/></a> Bien</span><br>
                                
                                    <?php 
                                     }?>
                                      
                                      
                                       <?php 
                                     if($resuldomi['habla']=="regular")
                                     {
                                    ?>
                                      <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/addd.png" title="Seleccione" /></a> Regular</span><br>
                                
                                    <?php 
                                     }else{?>
                                    
                                       <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/delete.png" title="Seleccione" /></a> Regular</span><br>
                                
                                    <?php 
                                     }?>
                                       
                                        <?php 
                                     if($resuldomi['habla']=="no")
                                     {
                                    ?>
                                       <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/addd.png" title="Seleccione" /></a>No</span>
                           
                                    <?php 
                                     }else{?>
                                         <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&habla=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione" /></a>No</span>
                           
                                    <?php 
                                     }?>
                                      
                                      
                                      
                                      
                                      
                                       
                                 </td>
                                 
                                  <td>
                                    <?php 
                                     if($resuldomi['lee']=="bien")
                                     {
                                    ?>
                                      <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/addd.png" title="Seleccione" /></a> Bien</span><br>
                                
                                    <?php 
                                     }else{?>
                                    
                                    <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione" /></a> Bien</span><br>
                                
                                    <?php 
                                     }?>
                                      
                                      
                                       <?php 
                                     if($resuldomi['lee']=="regular")
                                     {
                                    ?>
                                    <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/addd.png" title="Seleccione" /></a> Regular</span><br>
                            
                                    <?php 
                                     }else{?>
                                    
                                        <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/delete.png" title="Seleccione" /></a> Regular</span><br>
                            
                                    <?php 
                                     }?>
                                       
                                        <?php 
                                     if($resuldomi['lee']=="no")
                                     {
                                    ?>
                                        <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/addd.png" title="Seleccione" /></a>No</span>
                           
                                    <?php 
                                     }else{?>
                                             <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&lee=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione" /></a>No</span>
                           
                                    <?php 
                                     }?>
                                      
                                      
                                      
                                      
                                      
                                       
                                 </td>
                                       <td>
                                    <?php 
                                     if($resuldomi['escribe']=="bien")
                                     {
                                    ?>
                                           <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/addd.png" title="Seleccione"  /></a> Bien</span><br>
                               
                                    <?php 
                                     }else{?>
                                    
                                     <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione"  /></a> Bien</span><br>
                               
                                    <?php 
                                     }?>
                                      
                                      
                                       <?php 
                                     if($resuldomi['escribe']=="regular")
                                     {
                                    ?>
                                     <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=regular&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/addd.png" title="Seleccione"  /></a> Regular</span><br>
                             
                                    <?php 
                                     }else{?>
                                       <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=regular&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione"  /></a>  Regular</span><br>
                             
                                    <?php 
                                     }?>
                                       
                                        <?php 
                                     if($resuldomi['escribe']=="no")
                                     {
                                    ?>
                                       <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/addd.png" title="Seleccione"  /></a>No</span>
                       
                                    <?php 
                                     }else{?>
                                              <span class="modi"><a href="?dominio=<?php echo $resuldomi['id']; ?>&escribe=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione"  /></a>No</span>
                       
                                    <?php 
                                     }?>
                                                        
                                 </td>
                               
                      <?php 
                            
                        }  else {
                            
                            ?>
                             
                                
			
                                 <td>
                                    <span class="modi"><a href="?dominio=0&habla=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione"/></a> Bien</span><br>
                                    <span class="modi"><a href="?dominio=0&habla=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/delete.png" title="Seleccione" /></a> Regular</span><br>
                                    <span class="modi"><a href="?dominio=0&habla=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione" /></a>No</span>
                                 
                                 </td>
			        <td>
                                       <span class="modi"><a href="?dominio=0&lee=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione" /></a> Bien</span><br>
                                    <span class="modi"><a href="?dominio=0&lee=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/delete.png" title="Seleccione" /></a> Regular</span><br>
                                    <span class="modi"><a href="?dominio=0&lee=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione" /></a>No</span>
                           
                                </td>
                                 <td>
                                    <span class="modi"><a href="?dominio=0&escribe=bien&idioma_id=<?php echo  $resultado['id']; ?>"><img src="../images/delete.png" title="Seleccione"  /></a> Bien</span><br>
                                    <span class="modi"><a href="?dominio=0&escribe=regular&idioma_id=<?php echo  $resultado['id']; ?> "><img src="../images/delete.png" title="Seleccione"  /></a> Regular</span><br>
                                    <span class="modi"><a href="?dominio=0&escribe=no&idioma_id=<?php echo  $resultado['id']; ?>  "><img src="../images/delete.png" title="Seleccione"  /></a>No</span>
                           
                                </td>
                                
			          </tr>
                    		 
	<?php
          }
	}
  ?>   
                <tbody>
            </table>
                 </div>
