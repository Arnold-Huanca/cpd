     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
             <li><a href=""><i class="iconfa-home"></i> Investigaci&oacute;n y Producci&oacute;n</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
           <p>
              <label for="rol"><small>Tipo de Produccion</small></label>
              <select  class="select-style gender" name="tipo_produccion_id" id="tipo_produccion_id" >
              {html_options values=$tipo_producciones_values selected=$produccion->tipo_produccion_id output=$tipo_producciones_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="titulo_tema" id="titulo_tema" value="{$produccion->titulo_tema}"  placeholder="Titulo de Tema" size="100"  >
              <label for="nombre"><small>Titulo de Tema</small></label>
            </p>
            <p>
                <label for="nombre"><small>Tipo de Circulaci&oacute;n</small></label>
                <select  class="select-style gender" name="tipo_circulacion" id="tipo_circulacion" >
              {html_options values=$circulacion_values selected=$produccion->medio_difunsion_id output=$circulacion_output}
              </select>
            </p>
            
             <p>
              <label for="rol"><small>Medio Difunsion</small></label>
              <select  class="select-style gender" name="medio_difunsion_id" id="medio_difunsion_id" >
              {html_options values=$medio_difunsiones_values selected=$produccion->medio_difunsion_id output=$medio_difunsiones_output}
              </select>
            </p>
            <p>
              <input type="text" name="institucion_entrega" id="institucion_entrega" value="{$produccion->institucion_entrega}"  placeholder="Institucion de Entrega" size="100"  >
              <label for="nombre"><small>Institucion de Entrega</small></label>
            </p>
            <p>
              <input type="text" name="fecha_conclucion" id="fecha_conclucion" value="{$produccion->fecha_conclucion}"  placeholder="Fecha de Conclusion" size="100"  >
              <label for="nombre"><small>Fecha de Conclusion</small></label>
            </p>
      <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$produccion->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
          
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$produccion->ambito_id output=$ambitos_output}
              </select>
            </p>
                
           <p>
              <input type="hidden" name="produccion_id"    value="{$produccion->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                 <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
           </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>


<script type="text/javascript">
           $(function(){
            $('#fecha_conclucion').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>

<<script>
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
   
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
     