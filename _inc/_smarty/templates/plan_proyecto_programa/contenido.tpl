     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="tipo" id="tipo" value="{$plan_proyecto_programa->tipo}"  placeholder="Tipo" size="100"  >
              <label for="nombre"><small>Tipo</small></label>
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
              <input type="text" name="duracion" id="duracion" value="{$plan_proyecto_programa->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duracion</small></label>
            </p>
            <p>
              <input type="text" name="unidad_ejecutora" id="unidad_ejecutora" value="{$plan_proyecto_programa->unidad_ejecutora}"  placeholder="Unidad Ejecutora" size="100"  >
              <label for="nombre"><small>Unidad Ejecutora</small></label>
            </p>
            <p>
              <input type="text" name="otra_universidad" id="otra_universidad" value="{$plan_proyecto_programa->otra_universidad}"  placeholder="Otra Universidad" size="100"  >
              <label for="nombre"><small>Otra Universidad</small></label>
            </p>
             <p>
              <input type="text" name="vb" id="vb" value="{$plan_proyecto_programa->vb}"  placeholder="VB" size="100"  >
              <label for="nombre"><small>VB</small></label>
            </p>
            
            <p>
              <label for="rol"><small> Tipo Participacion</small></label>
              <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
              {html_options values=$tipo_participaciones_values selected=$plan_proyecto_programa->tipo_participacion_id output=$tipo_participaciones_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$plan_proyecto_programa->funcionario_id output=$funcionarios_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=$unidad_tiempos_values selected=$plan_proyecto_programa->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$plan_proyecto_programa->universidad_id output=$universidades_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$plan_proyecto_programa->ambito_id output=$ambitos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$plan_proyecto_programa->subarea_id output=$subareas_output}
              </select>
            </p>
            
            
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$plan_proyecto_programa->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small>Descripcion</small></label>
            </p>
           <p>
              <input type="hidden" name="plan_proyecto_programa_id"    value="{$plan_proyecto_programa->id}">
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
     