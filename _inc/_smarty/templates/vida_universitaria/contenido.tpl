     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="otro_tip_participacion" id="otro_tip_participacion" value="{$vida_universitaria->otro_tip_participacion}"  placeholder="Otro tip de Participacion" size="100"  >
              <label for="nombre"><small>Otro tip de Participacion</small></label>
            </p>
            <p>
              <input type="text" name="otra_instancia_univ" id="otra_instancia_univ" value="{$vida_universitaria->otra_instancia_univ}"  placeholder="Otra instancia Universitaria" size="100"  >
              <label for="nombre"><small>Otra instancia Universitaria</small></label>
            </p>
            <p>
              <input type="date" name="fecha_inicio" id="fecha_inicio" value="{$vida_universitaria->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="duracion" id="duracion" value="{$vida_universitaria->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duracion</small></label>
            </p>
            <p>
              <input type="text" name="condicion" id="condicion" value="{$vida_universitaria->condicion}"  placeholder="Condicion" size="100"  >
              <label for="nombre"><small>Condicion</small></label>
            </p>
            <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$vida_universitaria->funcionario_id output=$funcionarios_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Instancia Universitaria</small></label>
              <select  class="select-style gender" name="instancia_universitaria_id" id="instancia_universitaria_id" >
              {html_options values=$instancia_universitarias_values selected=$vida_universitaria->instancia_universitaria_id output=$instancia_universitarias_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$vida_universitaria->universidad_id output=$universidades_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Unidad de Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=$unidad_tiempos_values selected=$vida_universitaria->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Tipo de Participacion</small></label>
              <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
              {html_options values=$tipo_participaciones_values selected=$vida_universitaria->tipo_participacion_id output=$tipo_participaciones_output}
              </select>
            </p>
           
                <p>
              <input type="hidden" name="vida_universitaria_id"    value="{$vida_universitaria->id}">
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
     