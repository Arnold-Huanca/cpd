<?php
   define ("MODULO", "Pais");
  require('../../_start.php');
  if(!isUserSession())
  header("Location: index.php"); 
  
  $id_pais= $_GET['pais_id'];
  
$listado=  mysql_query("select * from departamento where pais_id=$id_pais");
leerClase("Pais");
$pais = new Pais($id_pais);
?>
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
				data: "departamento_id="+id,
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
         <h1>  Pais : <?php echo $pais->nombre_pais;?></h1>
         <span class="modi"><a href="registro.php?pais_id=<?php echo $id_pais?>"><img src="../../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Nombre Departamento</th>
                        <th>Sigla Departamento</th><!--Estado-->
                        <th>Editar</th>
                        <th>Eliminar</th>
                        <th>Agregar Povincia</th>
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

     
                   while($reg=  mysql_fetch_array($listado))
                     {
                               echo '<tr id="fila-'.mb_convert_encoding($reg['id'], "UTF-8").'">';
                               echo '<td >'.mb_convert_encoding($reg['id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['nombre_depto'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['sigla_depto'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&area_colegio_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?area_colegio_id='.$reg['id'].'"><center><img src="../../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
			       echo '<td  ><a href=../provincia/index.php?departamento_id='.mb_convert_encoding($reg['id'], "UTF-8").'&pais_id='.mb_convert_encoding($reg['pais_id'], "UTF-8").'>Agregar Provincia</a><img   width="25" height="25" src="../../images/add_icon.png" title="Agregar Provincia" alt="Editar" /></td>';
                           
                               echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
