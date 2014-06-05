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
              <label for="rol"><small>Tipo Evento</small></label>
              <select  class="select-style gender" name="tipo_evento_id" id="tipo_evento_id" >
              {html_options values=$tipo_eventos_values selected=$evento->tipo_evento_id output=$tipo_eventos_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="nombre_evento" id="nombre_evento" value="{$evento->nombre_evento}"  placeholder="Nombre del Evento" size="100"  >
              <label for="nombre"><small>Nombre del Evento</small></label>
            </p>
            <p>
              <input type="text" name="tema_expocicion" id="tema_expocicion" value="{$evento->tema_expocicion}"  placeholder="Tema de Expocicion" size="100"  >
              <label for="nombre"><small>Tema de Expocicion</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$evento->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="duracion" id="duracion" value="{$evento->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duracion</small></label>
            </p>
            <p>
              <input type="text" name="entidad_organizadora" id="entidad_organizadora" value="{$evento->entidad_organizadora}"  placeholder="Entidad Organizadora" size="100"  >
              <label for="nombre"><small>Entidad Organizadora</small></label>
            </p>
            <p>
              <input type="text" name="organizado_por_instacia_univ" id="organizado_por_instacia_univ" value="{$evento->organizado_por_instacia_univ}"  placeholder="Organizado por Instancia Universitaria" size="100"  >
              <label for="nombre"><small>Organizado por Instancia Universitaria</small></label>
            </p>

                  <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$evento->ambito_id output=$ambitos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=$unidad_tiempos_values selected=$evento->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            
           
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$evento->pais_id output=$paises_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Tipo Participacion</small></label>
              <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
              {html_options values=$tipo_participaciones_values selected=$evento->tipo_participacion_id output=$tipo_participaciones_output}
              </select>
            </p>
            <p>
                    {if ($evento->estado eq "Pendiente" || $evento->estado eq "Aceptado" )}
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
               <label for="rol"><small>Descripci&oacute;n</small></label>
               <textarea name="descripcion" id="descripcion" > {$evento->descripcion}</textarea>
            </p>
         
           <p>
              <input type="hidden" name="evento"    value="{$evento->id}">
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
    window.location.href="index.php";
  
  }
</script>

</div>
     