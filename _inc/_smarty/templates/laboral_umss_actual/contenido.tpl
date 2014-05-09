     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="cargo" id="cargo" value="{$laboral_umss_actual->cargo}"  placeholder="Cargo" size="100"  >
              <label for="nombre"><small>Cargo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$laboral_umss_actual->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="dedicacion" id="dedicacion" value="{$laboral_umss_actual->dedicacion}"  placeholder="Dedicacion" size="100"  >
              <label for="nombre"><small>Dedicacion</small></label>
            </p>
                <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$laboral_umss_actual->funcionario_id output=$funcionarios_output}
              </select>
              
              
            </p>
            
            <p>
              <label for="rol"><small>Dedicacion</small></label>
              <select  class="select-style gender" name="dedicacion_id" id="dedicacion_id" >
              {html_options values=$dedicaciones_values selected=$laboral_umss_actual->dedicacion_id output=$dedicaciones_output}
              </select>
              
              
            </p>
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$laboral_umss_actual->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
                
           <p>
              <input type="hidden" name="laboral_umss_actual_id"    value="{$laboral_umss_actual->id}">
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
     