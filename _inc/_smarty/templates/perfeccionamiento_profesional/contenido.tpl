     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
           
            <p>
              <label for="rol"><small>Tipo Perfeccionamiento</small></label>
              <select  class="select-style gender" name="tipo_perfeccionamiento_id" id="tipo_perfeccionamiento_id" >
              {html_options values=$tipo_perfeccionamientos_values selected=$perfeccionamiento_profecional->tipo_perfeccionamiento_id output=$tipo_perfeccionamientos_output}
              </select>
            </p>
             <p>
              <input type="text" name="fecha_certificado" id="fecha_certificado" value="{$perfeccionamiento_profecional->fecha_certificado}" placeholder="Fecha Certificado"  size="22" >
              <label for="email"><small> Fecha Certificado</small></label>
            </p>
             <p>
              <input type="text" name="certificado" id="certificado" value="{$perfeccionamiento_profecional->certificado}" placeholder="Certificado"  size="22" >
              <label for="email"><small> Certificado</small></label>
            </p>
            
           
            <p>
                <input type="text" name="titulo" id="titulo" value="{$perfeccionamiento_profecional->titulo}" placeholder="T&iacute;tulo"  size="22" >
              <label for="email"><small>T&iacute;tulo</small></label>
            </p>
            
            <p>
              <input type="text" name="diploma" id="diploma" value="{$perfeccionamiento_profecional->diplona}" placeholder="Diploma"  size="22" >
              <label for="email"><small>Diploma</small></label>
            </p>
               <p>
                   <input type="text" name="titulo_trabajo_final" id="titulo_trabajo_final" value="{$perfeccionamiento_profecional->titulo_trabajo_final}" placeholder="T&iacute;tulo Trabajo Final"  size="22" >
                   <label for="email"><small>T&iacute;tulo Trabajo Final</small></label>
            </p>
            
            
            <p>
                <input type="text" name="mencion" id="mencion" value="{$perfeccionamiento_profecional->mencion}" placeholder="Menci&iacute;n"  size="22" >
              <label for="email"><small>Menci&oacute;n</small></label>
            </p>
             <p>
                 <input type="text" name="duracion_curso" id="duracion_curso" value="{$perfeccionamiento_profecional->duracion_curso}" placeholder="Duraci&oacute;n del Curso"  size="22" >
              <label for="email"><small>Duraci&oacute;n del Curso</small></label>
            </p>
            
               <p>
              <input type="text" name="hrs_presenciales" id="hrs_presenciales" value="{$perfeccionamiento_profecional->hrs_presenciales}" placeholder="Hrs. Presenciales"  size="22" >
              <label for="email"><small>Hrs. Presenciales</small></label>
            </p>
            <p>
              <input type="text" name="hrs_no_presenciales" id="hrs_no_presenciales" value="{$perfeccionamiento_profecional->hrs_no_presenciales}" placeholder="Hrs. No Presenciales"  size="22" >
              <label for="email"><small> Hrs. No Presenciales</small></label>
            </p>
            
            <p>
                <input type="text" name="creditos" id="creditos" value="{$perfeccionamiento_profecional->creditos}" placeholder="Cr&eacute;ditos"  size="22" >
              <label for="email"><small>Cr&eacute;ditos</small></label>
            </p>
              <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$evento->area_id output=$area_output}
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
              {html_options values=$paises_values selected=$perfeccionamiento_profecional->pais_id output=$paises_output}
              </select>
            </p>
                 
            <p>
                <input type="text" name="otra_institucion" id="otra_institucion" value="{$perfeccionamiento_profecional->otra_institucion}" placeholder="Instituci&oacute;n"  size="22" >
              <label for="email"><small>Instituci&oacute;n donde Obtuvo el grado </small></label>
            </p>
            <p>
             <input type="hidden" name="perfeccionamiento_profecional_id"    value="{$perfeccionamiento_profecional->id}">
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
            $('#fecha_certificado').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
          
           
  function enviar(){
    window.location.href="index.php";
  
  }
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
     
              