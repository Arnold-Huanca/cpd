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
              <input type="text" name="nombre_titulo" id="nombre_titulo" value="{$formacion_pregrado->nombre_titulo}"  placeholder="Nombre del Titulo" size="100"  >
              <label for="nombre"><small>Nombre del Titulo</small></label>
            </p>
            <p>
              <input type="text" name="tesis_pregrado" id="tesis_pregrado" value="{$formacion_pregrado->tesis_pregrado}"  placeholder="Tesis de Pregrado" size="100"  >
              <label for="nombre"><small>Tesis de Pregrado</small></label>
            </p>
            <p>
              <input type="text" name="titulo_tesis_pregrado" id="titulo_tesis_pregrado" value="{$formacion_pregrado->titulo_tesis_pregrado}"  placeholder="Titulo de Tesis Pregrado" size="100"  >
              <label for="nombre"><small>Titulo de Tesis Pregrado</small></label>
            </p>
            <p>
              <input type="text" name="duracion_curso_pregrado" id="duracion_curso_pregrado" value="{$formacion_pregrado->duracion_curso_pregrado}"  placeholder="Duracion de Curso Pregrado" size="100"  >
              <label for="nombre"><small>Duraci&oacute;n de Curso Pregrado</small></label>
            </p><br>
            <p>
              <input type="text" name="otra_institucio" id="otra_institucio" value="{$formacion_pregrado->otra_institucion}"  placeholder="Otra Institucion" size="100"  >
              <label for="nombre"><small>Otra Institucion</small></label>
            </p>
            <p>
              <input type="text" name="ciudad_pregrado" id="ciudad_pregrado" value="{$formacion_pregrado->ciudad_pregrado}"  placeholder="Ciudad Pregrado" size="100"  >
              <label for="nombre"><small>Ciudad Pregrado</small></label>
            </p>
           
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$formacion_pregrado->universidad_id output=$universidades_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$formacion_pregrado->pais_id output=$paises_output}
              </select>
            </p>
            <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion_curso_pregrado" id="duracion_curso_pregrado" >
              {html_options values=$duracion_values selected=$formacion_pregrado->duracion_curso output=$duracion_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad de Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$formacion_pregrado->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Grado Academico</small></label>
              <select  class="select-style gender" name="grado_academico_id" id="grado_academico_id" >
              {html_options values=$grado_academicos_values selected=$formacion_pregrado->grado_academico_id output=$grado_academicos_output}
              </select>
            </p>
          <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$formacion_pregrado->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
             <p>
                 <input type="text" name="fecha_diploma" id="fecha_diploma" value="{$formacion_pregrado->fecha_diploma}"  placeholder="Fecha Diploma" size="100"  >
              <label for="nombre"><small>Fecha Diploma</small></label>
            </p>
            <p>
                <input type="text" name="fecha_titulo" id="fecha_titulo" value="{$formacion_pregrado->fecha_titulo}"  placeholder="Fecha de Titulo" size="100"  >
              <label for="nombre"><small>Fecha de Titulo</small></label>
            </p>
               
           
           
            <p>
                 <label for="rol"><small>V.B.</small></label>
                    {if ($formacion_pregrado->estado eq "Pendiente" || $formacion_pregrado->estado eq "Aceptado" )}
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
               <textarea name="observacion" id="observacion" > {$formacion_pregrado->observacion}</textarea>
            </p>
                
              <p>
              <input type="hidden" name="id"    value="{$formacion_pregrado->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"  value="{$formacion_pregrado->funcionario_id}">
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
 

</div>
         







<script>
  
  function enviar(){
     var id = $("#funcionario_id").val();
    window.location.href="asistencia_evento.php?menus=mostrar&funcionario_id="+id;
  
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
     