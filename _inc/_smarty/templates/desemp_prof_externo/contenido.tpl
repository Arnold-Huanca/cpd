     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
             <p>
              <input type="text" name="institucion" id="institucion" value="{$desemp_prof_externo->institucion}" placeholder="Institucion" size="200">
              <label for="apellido_p"><small>Institucion</small></label>
            </p>
            <p>
              <input type="text" name="cargo" id="cargo" value="{$desemp_prof_externo->cargo}" placeholder="Cargo" size="200">
              <label for="apellido_p"><small>Cargo</small></label>
            </p>
            <p>
             <select  class="select-style gender" name="nivel_cargo" id="nivel_cargo" >
              {html_options values=$nivel_values selected=$desemp_prof_externo->nivel_cargo output=$nivel_output}
              </select>
              <label for="apellido_p"><small>Nivel Cargo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$desemp_prof_externo->fecha_inicio}" placeholder="Fecha de Inicio" size="200">
              <label for="apellido_p"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="fecha_conclusion" id="fecha_conclusion" value="{$desemp_prof_externo->fecha_conclusion}" placeholder="Fecha de Conclusion" size="200">
              <label for="apellido_p"><small>Fecha de Conclusi&oacute;n</small></label>
            </p>
              <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$desemp_prof_externo->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$desemp_prof_externo->pais_id output=$paises_output}
              </select>
            </p>
            
               
           <p>
              <input type="hidden" name="id"    value="{$desemp_prof_externo->id}">
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
            $('#fecha_inicio').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
             });
      
</script>


<script>
            $('#fecha_conclusion').datepicker({
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
   
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>


</div>
     