     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_evento" id="nombre_evento" value="{$asistencia_evento->nombre_evento}"  placeholder="Nombre Evento" size="100"  >
              <label for="nombre"><small>Nombre del Evento</small></label>
            </p>
            <p>
                <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$asistencia_evento->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="duracion" id="duracion" value="{$asistencia_evento->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duraci&oacute;n</small></label>
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
              <input type="text" name="vb" id="vb" value="{$asistencia_evento->vb}"  placeholder="VB" size="100"  >
              <label for="nombre"><small>VB</small></label>
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
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$asistencia_evento->subarea_id output=$subareas_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$asistencia_evento->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$asistencia_evento->pais_id output=$paises_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$asistencia_evento->ambito_id output=$ambitos_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$asistencia_evento->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
          
          
            <p>
              <input type="hidden" name="asistencia_evento_id"    value="{$asistencia_evento->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
               <button class="submit" type="button" onclick="enviar()">Guardar</button>  
         

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
     