{include file="header.tpl"}
{include file="menu.tpl"}

 <script type="text/javascript">
         
$(document).ready(function(){
    verlistado()
    //CARGAMOS EL ARCHIVO QUE NOS LISTA LOS REGISTROS, CUANDO EL DOCUMENTO ESTA LISTO


})
function verlistado(){ //FUNCION PARA MOSTRAR EL LISTADO EN EL INDEX POR JQUERY
              var randomnumber=Math.random()*11;
            $.post("listar.php", {
                randomnumber:randomnumber
            }, function(data){
              $("#contenido").html(data);
            });


}
</script>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      {include file="menuizquierdo.tpl"}
      <div class="art-layout-cell art-content clearfix">
  
         <article id="contenido">
        </article>
          
          <div style='height:auto; width: 100%; font-size: 16px; overflow: auto;'>
              <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           <table >
               
                  <tbody>
                  <tr >
                          <td>Tipo Evento</td>
                         <td>Nombre Evento</td>
                          <td>Tema</td>
                           <td>Fecha Inicio</td>
                           <td>Duraci&oacute;n</td>
                           <td>&Aacute;rea</td>
                           <td>Sub &Aacute;rea</td>
                           <td>Ambito</td>
                           <td>Tipo Participaci&oacute;n</td>
                            <td>Instituci&oacute;n Organizadora</td>
			    <td>Organizado Por Instancia U.</td>
			    <td>Pa&iacute;s</td>
		            <td><?php echo $resultado['estado'] ?></td>
                </tr>
                
                <tr >
                    <td>
                 <select  class="select-style gender" name="tipo_evento_id" id="tipo_evento_id" >
                {html_options values=$tipo_eventos_values selected=$evento->tipo_evento_id output=$tipo_eventos_output}
                </select>
                    </td>
                    <td>
                         <input type="text" name="nombre_evento" id="nombre_evento" value="{$evento->nombre_evento}"  placeholder="Nombre del Evento" size="100">
            
                    </td>
                          <td>
                           <input type="text" name="tema_expocicion" id="tema_expocicion" value="{$evento->tema_expocicion}"  placeholder="Tema de Expocicion" size="100"  >
           
                          </td>
                          <td>
                               <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$evento->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
           
                          </td>
                           <td> 
                               <input type="text" name="duracion" id="duracion" value="{$evento->duracion}"  placeholder="Duracion" size="100"  >
                           </td>
                         
                             <td>
                           <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
                          {html_options values=$area_values selected=$evento->area_id output=$area_output}
                          </select>&nbsp;<span id='Buscando'></span>
                             </td>
                             <td>
                             <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                             </select>
                             </td>
                             
                             <td>
                             <select  class="select-style gender" name="ambito_id" id="ambito_id" >
                                 {html_options values=$ambitos_values selected=$evento->ambito_id output=$ambitos_output}
                               </select>
                             </td>
                               <td> 
                               <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
                                {html_options values=$tipo_participaciones_values selected=$evento->tipo_participacion_id output=$tipo_participaciones_output}
                                </select>
                          </td>
                         
                                  <td>
                                         <input type="text" name="entidad_organizadora" id="entidad_organizadora" value="{$evento->entidad_organizadora}"  placeholder="Entidad Organizadora" size="100"  >
       
                                  </td>
                                  <td>
                                        <input type="text" name="organizado_por_instacia_univ" id="organizado_por_instacia_univ" value="{$evento->organizado_por_instacia_univ}"  placeholder="Organizado por Instancia Universitaria" size="100"  >
          
                                  </td>
                                <td>
                                    <select  class="select-style gender" name="pais_id" id="pais_id" >
                                   {html_options values=$paises_values selected=$evento->pais_id output=$paises_output}
                                      </select>
                               </td>
                            
			  
                            <td>

                            </td>
                </tr>
	
                <tbody>
            </table>
                
                                         
             
              <input type="hidden" name="evento"    value="{$evento->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
             
          </form>
               </div>
               
               
<script>
            $('#fecha_inicio').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
             });
      
</script>

<script>
jQuery('#area_id').change(function () {
var numero =document.getElementById("area_id").value;
var poblacio = jQuery(this).attr("poblacioattri");
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";
jQuery.ajax({
type: "POST", 
url: "buscar.php",
data: 'idnumero='+numero,
success: function(a) {
jQuery('#subarea_id').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script> 
  
      </div>


</div>
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}    