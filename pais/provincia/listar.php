<?php 

   define ("MODULO", "Pais");
  require('../../_start.php');
  if(!isUserSession())
    header("Location: index.php");  
$listado=  mysql_query("select * from provincia");

$iddepartamento=$_GET['departamento_id'];
//$idpais= $_GET['pais_id'];
leerClase("Departamento");
leerClase("Pais");

$departamento= new Departamento($iddepartamento);
$pais= new Pais($departamento->pais_id);

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
				data: "provincia_id="+id,
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
         <h1> Pais : <?php echo $pais->nombre_pais ;?>  Departamento : <?php echo $departamento->nombre_depto?></h1>
         <span class="modi"><a href="registro.php?departamento_id=<?php echo $iddepartamento;?>"><img src="../../images/add.png" title="Nuevo" alt="Nuevo" /></a></span>
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="tabla_lista_paises">
                <thead>
                    <tr>
                        <th>id</th><!--Estado-->
                        <th>Nombre de Provincia</th>
                        <th>Sigla de Provincia</th><!--Estado-->
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                         <th>Agregar Municipio</th>
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
                      
                     
                    </tr>
                </tfoot>
                  <tbody>
                    <?php

     
                   while($reg=  mysql_fetch_array($listado))
                     {
                               echo '<tr id="fila-'.mb_convert_encoding($reg['id'], "UTF-8").'">';
                               echo '<td >'.mb_convert_encoding($reg['id'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['nombre_provincia'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['sigla_provincia'], "UTF-8").'</td>';
                               echo '<td >'.mb_convert_encoding($reg['estado'], "UTF-8").'</td>';
                               echo '<td  ><a href=registro.php?editar=editando&provincia_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Editar</a><img src="../../images/edit.png" title="Editar" alt="Editar" /></td>';
                               echo '<td><span class="dele"><a onClick="EliminarDato('.$reg['id'].'); return false" href="eliminar.php?provincia_id='.$reg['id'].'"><center><img src="../../images/delete.png" title="Eliminar" alt="Eliminar" /></center></a></span></td>';
				  echo '<td  ><a href=../municipio.php?provincia_id='.mb_convert_encoding($reg['id'], "UTF-8").'>Agregar Municipio</a><img src="../../images/edit.png" title="Agregar Municipio" alt="Editar" /></td>';
                            		                  
                               echo '</tr>';
                              
                     }
                    ?>
                <tbody>
            </table>
