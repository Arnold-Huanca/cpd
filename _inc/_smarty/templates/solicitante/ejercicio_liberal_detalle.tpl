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
     
     

             <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
                <input type="text" name="institucion_actividad" id="institucion_actividad" value="{$ejercicio_liberal_prof->institucion_actividad}"  placeholder="Instituci&oacute;n o Empresa" size="100"  >
              <label for="nombre"><small>Instituci&oacute;n o Empresa o Nombre de la Actividad Privada</small></label>
            </p><br>
            <p>
              <input type="text" name="cargo_actividad" id="cargo_actividad" value="{$ejercicio_liberal_prof->cargo_actividad}"  placeholder="Nombre del Cargo o Actividad" size="100"  >
              <label for="nombre"><small>Nombre del Cargo Actividad o Actividad </small></label>
            </p>
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
              <input type="text" name="duracion" id="duracion" value="{$ejercicio_liberal_prof->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duraci&oacute;n</small></label>
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
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$ejercicio_liberal_prof->pais_id output=$paises_output}
              </select>
            </p>
            <p>
                    {if ($ejercicio_liberal_prof->estado eq "Pendiente" || $ejercicio_liberal_prof->estado eq "Aceptado" )}
                      <input type="radio" name="estado" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="estado" dovalue="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="estado" value="Aceptado"   />Aceptar
                          <input type="radio" name="estado" dovalue="Observado"  checked /> Rechazar
                   
                        {/if}
          </p>
         
           <p>
              <input type="hidden" name="ejercicio_liberal_prof_id"    value="{$ejercicio_liberal_prof->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="reset" >Cancelar</button> 

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
     