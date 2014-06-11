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
              <label for="rol"><small> Tipo</small></label>
              <select  class="select-style gender" name="tipo" id="tipo" >
              {html_options values=$tipo_values selected=$plan_proyecto_programa->tipo output=$tipo_output}
              </select>
            </p>
            <p>
              <input type="text" name="titulo" id="titulo" value="{$plan_proyecto_programa->titulo}"  placeholder="Titulo" size="100"  >
              <label for="nombre"><small>Titulo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$plan_proyecto_programa->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="beneficiario" id="beneficiario" value="{$plan_proyecto_programa->beneficiario}"  placeholder="Beneficiario" size="100"  >
              <label for="nombre"><small>Beneficiario</small></label>
            </p>
           <p>
               <label for="rol"><small> Duraci&oacute;n</small></label>
              <select  class="select-style gender" name="duracion" id="duracion" >
              {html_options values=$duracion_values selected=$plan_proyecto_programa->duracion output=$duracion_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$plan_proyecto_programa->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
            <p>
              <input type="text" name="unidad_ejecutora" id="unidad_ejecutora" value="{$plan_proyecto_programa->unidad_ejecutora}"  placeholder="Unidad Ejecutora" size="100"  >
              <label for="nombre"><small>Unidad Ejecutora</small></label>
            </p>
            <p>
              <input type="text" name="otra_universidad" id="otra_universidad" value="{$plan_proyecto_programa->otra_universidad}"  placeholder="Universidad" size="100"  >
              <label for="nombre"><small>Universidad</small></label>
            </p>
               
                <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$plan_proyecto_programa->area_id output=$area_output}
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
              {html_options values=$ambitos_values selected=$plan_proyecto_programa->ambito_id output=$ambitos_output}
              </select>
            </p>
              <p>
              <label for="rol"><small> Tipo Participacion</small></label>
              <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
              {html_options values=$tipo_participaciones_values selected=$plan_proyecto_programa->tipo_participacion_id output=$tipo_participaciones_output}
              </select>
            </p>
          
                     <p>
                         <label for="rol"><small> V.B. </small></label>
                    {if ($plan_proyecto_programa->estado eq "Pendiente" || $plan_proyecto_programa->estado eq "Aceptado" )}
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
               <label for="rol"><small>Oservaci&oacute;n</small></label>
               <textarea name="descripcion" id="descripcion" > {$plan_proyecto_programa->observacion}</textarea>
            </p>
            
         
           <p>
              <input type="hidden" name="evento"    value="{$plan_proyecto_programa->id}">
               <input type="hidden" name="funcionario_id"id="funcionario_id"    value="{$plan_proyecto_programa->funcionario_id}">
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
            $('#fecha_inicio').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
             });
      
</script>
<script>
  
  function enviar(){
    var id = $("#funcionario_id").val();
    window.location.href="asistencia_evento.php?menus=mostrar&funcionario_id="+id;

  
  }
</script>

</div>
     