     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
            <li><a href=""><i class="iconfa-home"></i> Patentes</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
                <input type="text" name="numero_patente" id="numero_patente" value="{$patente->numero_patente}"  placeholder="N&uacute;mero de Patente" size="100"  >
                <label for="nombre"><small>N&uacute;mero de Patente</small></label>
            </p>
            <p>
                <label for="rol"><small>Pa&iacute;s</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$patente->pais_id output=$paises_output}
              </select>
            </p>
             <p>
              <input type="text" name="titulo_descripcion" id="titulo_descripcion" value="{$patente->titulo_descripcion}"   size="100"  >
              <label for="nombre"><small>T&iacute;tulo o Descripci&oacute;n</small></label>
            </p>
           
              <p>
                <input type="text" name="fechas" id="fechas" value="{$patente->fechas}" >
              <label for="nombre"><small>Fecha</small></label>
            </p>
     
            <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$patente->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
                
           <p>
              <input type="hidden" name="patente_id"    value="{$patente->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

<script type="text/javascript">
           $(function(){
            $('#fechas').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
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
     