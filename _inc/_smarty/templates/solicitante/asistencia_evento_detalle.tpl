{include file="header.tpl"}
{include file="menu.tpl"}

<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
         <div class="art-content-layout-row">
                      
       {include file="menus.tpl"}    
      <div class="art-layout-cell art-content clearfix">
  
        
          <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
         <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" enctype="multipart/form-data">
           
           <p>
              <input type="text" name="nombre_evento" id="nombre_evento" value="{$asistencia_evento->nombre_evento}"  placeholder="Nombre Evento" size="100"  >
              <label for="nombre"><small>Nombre del Evento</small></label>
            </p>
            <p>
                <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$asistencia_evento->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
             <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion" id="duracion" >
              {html_options values=$duracion_values selected=$asistencia_evento->duracion output=$duracion_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$asistencia_evento->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
            <p>
              <input type="text" name="entidad_organizadora" id="entidad_organizadora" value="{$asistencia_evento->entidad_organizadora}"  placeholder="Entidad Organizadora" size="100"  >
              <label for="nombre"><small>Entidad Organizadora</small></label>
            </p>                       
            <p>
              <input type="text" name="del_programa_formacion_doc" id="del_programa_formacion_doc" value="{$asistencia_evento->del_programa_formacion_doc}"  placeholder="Programa Formacion" size="100"  >
              <label for="nombre"><small>Formacion del Programa</small></label>
            </p>         
                <p>
              <label for="rol"><small>Tipo Evento</small></label>
              <select  class="select-style gender" name="tipo_evento_id" id="tipo_evento_id" >
              {html_options values=$tipo_eventos_values selected=$asistencia_evento->tipo_evento_id output=$tipo_eventos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Tipo Certificado</small></label>
              <select  class="select-style gender" name="tipo_certificado_id" id="tipo_certificado_id" >
              {html_options values=$tipo_certificados_values selected=$asistencia_evento->tipo_certificado_id output=$tipo_certificados_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$asistencia_evento->area_id output=$area_output}
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
              {html_options values=$ambitos_values selected=$asistencia_evento->ambito_id output=$ambitos_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$asistencia_evento->pais_id output=$paises_output}
              </select>
            </p>
          
           
            <p>
                 <label for="rol"><small>V.B.</small></label>
                    {if ($asistencia_evento->estado eq "Pendiente" || $asistencia_evento->estado eq "Aceptado" )}
                      <input type="radio" name="estado" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="estado" dovalue="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="estado" value="Aceptado"   />Aceptar
                          <input type="radio" name="estado" dovalue="Observado"  checked /> Rechazar
                   
                        {/if}
          </p>
              <p>
               <label for="rol"><small>Archivo</small></label>
                 <input type="file" name="archivo" id="archivo" value=""  size="100"  >
           
              </p>
           <p>
               <label for="rol"><small>Observaci&oacute;n</small></label>
               <textarea name="observacion" id="observacion" > {$asistencia_evento->observacion}</textarea>
            </p>
         
        
              <p>
              <input type="hidden" name="asistencia_evento_id"    value="{$asistencia_evento->id}">
              <input type="text" name="funcionario_id"    value="{$asistencia_evento->funcionario_id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
               <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         
         </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>

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
     

<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
         







<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>	


<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre: "required",
			apellido_p: "required",
                        apellido_m: "required",
                        estado: "required",
                       email: { required:true, email: true},
                      login: { required: true, minlength: 5},
                      password: { required: true, minlength: 5},

		},
		messages: {
			nombre: "Ingrese Nombre de Usuario",
			apellido_p: "Ingrese Apellido Paterno",
			
			apellido_m: "Ingrese Apellido Materno",
                        estado:"Selecciones su Estado",
                        email:"Ingrese Email Correcto",
                        login: "Introdusca su Nombre de Usuario.",
                        password: "Introdusca su Constraceña de Usuario Minimo 5 Caracteres.",
			//agree: "Please accept our policy"
		},
		
	errorElement:'span'
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
</div>
     