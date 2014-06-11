     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
       <li><a href=""><i class="iconfa-home"></i> Docencia Auxiliatura Externa</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="materia" id="materiao" value="{$docencia_axuliar_externa->materia}"  placeholder="Materia" size="100"  >
              <label for="nombre"><small>Materia</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$docencia_axuliar_externa->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion" id="duracion" >
              {html_options values=$duracion_values selected=$docencia_axuliar_externa->duracion output=$duracion_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$docencia_axuliar_externa->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
               <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$docencia_axuliar_externa->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
            <p>  
                <label for="rol"><small>Nivel Formaci&oacute;n</small></label>
              <select  class="select-style gender" name="nivel_formacion_id" id="nivel_formacion_id" >
              {html_options values=$nivel_formaciones_values selected=$docencia_axuliar_externa->nivel_formacion_id output=$nivel_formaciones_output}
              </select>
            </p>
            <p>
              <input type="text" name="carrera" id="carrera" value="{$docencia_axuliar_externa->carrera}"  placeholder="Carrera" size="100"  >
              <label for="nombre"><small>Carrera</small></label>
            </p>
            <p>
              <input type="text" name="departamento" id="departamento" value="{$docencia_axuliar_externa->departamento}"  placeholder="Departamento" size="100"  >
              <label for="nombre"><small>Departamento</small></label>
            </p>
            <p>
              <input type="text" name="facultad" id="facultad" value="{$docencia_axuliar_externa->facultad}"  placeholder="Facultad" size="100"  >
              <label for="nombre"><small>Nombre Departamento</small></label>
            </p>
            <p>
              <input type="text" name="otra_universidad" id="otra_universidad" value="{$docencia_axuliar_externa->otra_universidad}"  placeholder="Otra Universidad" size="100"  >
              <label for="nombre"><small>Otra Universidad</small></label>
            </p>
           <p>
                    <label for="nombre"><small>Condici&oacute;n</small></label>
             <select  class="select-style gender" name="condicion" id="condicion" >
              {html_options values=$condicion_values selected=$docencia_axuliar_externa->condicion output=$condicion_output}
              </select>
            </p>
            
                 
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$docencia_axuliar_externa->universidad_id output=$universidades_output}
              </select>
            </p>
            
            <p>
                <label for="rol"><small>Pa&iacute;s</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$docencia_axuliar_externa->pais_id output=$paises_output}
              </select>
            </p>
            
                     
            <p>
                    
           
                
           <p>
              <input type="hidden" name="docencia_axuliar_externa"    value="{$docencia_axuliar_externa->id}">
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
            $('#fecha_inicio').datepicker({
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
     