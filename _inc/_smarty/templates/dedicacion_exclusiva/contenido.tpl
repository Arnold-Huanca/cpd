     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <label for="rol"><small>Tipo Gestion</small></label>
              <select  class="select-style gender" name="tipo_gestion_id" id="tipo_gestion_id" >
              {html_options values=$tipo_gestiones_values selected=$dedicacion_exclusiva->tipo_gestion_id output=$tipo_gestiones_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$dedicacion_exclusiva->ambito_id output=$ambitos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$dedicacion_exclusiva->funcionario_id output=$funcionarios_output}
              </select>
            </p>
            
            <p>
              <input type="date" name="fecha_inicio" id="fecha_inicio" value="{$dedicacion_exclusiva->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
            <p>
              <input type="date" name="fecha_fin" id="fecha_fin" value="{$dedicacion_exclusiva->fecha_fin}"  placeholder="Fecha Fin" size="100"  >
              <label for="nombre"><small>Fecha Fin</small></label>
            </p>
            <p>
              <input type="text" name="unidad_academica" id="unidad_academica" value="{$dedicacion_exclusiva->unidad_academica}"  placeholder="Unidad Academica" size="100"  >
              <label for="nombre"><small>Unidad Academica</small></label>
            </p>
            <p>
              <input type="text" name="vb" id="vb" value="{$dedicacion_exclusiva->vb}"  placeholder="VB" size="100"  >
              <label for="nombre"><small>VB</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$dedicacion_exclusiva->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripci&oacute;n</small></label>
            </p>
           
            <p>
              <input type="hidden" name="dedicacion_exclusiva_id"    value="{$dedicacion_exclusiva->id}">
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

</div>
     