     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
             <li><a href=""><i class="iconfa-home"></i> Ejercicio Liberal de la Profesi&oacute;n (Free Lance)</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
                <input type="text" name="institucion_actividad" id="institucion_actividad" value="{$ejercicio_liberal_prof->institucion_actividad}"  placeholder="Instituci&oacute;n o Empresa" size="100"  >
              <label for="nombre"><small>Instituci&oacute;n o Empresa o Nombre de la Actividad Privada</small></label>
            </p><br>
            <p>
              <input type="text" name="cargo_actividad" id="cargo_actividad" value="{$ejercicio_liberal_prof->cargo_actividad}"  placeholder="Nombre del Cargo o Actividad" size="100"  >
              <label for="nombre"><small>Nombre del Cargo Actividad o Actividad </small></label>
            </p><br>
              <p>
              <label for="rol"><small>Tipo</small></label>
              <select  class="select-style gender" name="tipo" id="tipo">
              {html_options values=$tipo_values selected=$ejercicio_liberal_prof->tipo output=$tipo_output}
              </select>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$ejercicio_liberal_prof->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion_curso" id="duracion_curso" >
              {html_options values=$duracion_values selected=$perfeccionamiento_profecional->duracion_curso output=$duracion_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$perfeccionamiento_profecional->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
           
              <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$ejercicio_liberal_prof->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                   {html_options values=$subarea_values selected=$ejercicio_liberal_prof->subarea_id output=$subarea_output}
             </select>
            </p>
           
            
            <p>
                <label for="rol"><small>Pa&iacute;s</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$ejercicio_liberal_prof->pais_id output=$paises_output}
              </select>
            </p>
           
         
           <p>
              <input type="hidden" name="id"    value="{$ejercicio_liberal_prof->id}">
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
     