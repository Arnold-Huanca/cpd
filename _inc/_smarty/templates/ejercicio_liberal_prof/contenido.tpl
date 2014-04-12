     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="institucion_actividad" id="institucion_actividad" value="{$ejercicio_liberal_prof->institucion_actividad}"  placeholder="Actividad de Institucion" size="100"  >
              <label for="nombre"><small>Actividad de Institucion</small></label>
            </p>
            <p>
              <input type="text" name="cargo_actividad" id="cargo_actividad" value="{$ejercicio_liberal_prof->cargo_actividad}"  placeholder="Cargo Actividad" size="100"  >
              <label for="nombre"><small>Cargo Actividad</small></label>
            </p>
            <p>
              <input type="text" name="tipo" id="tipo" value="{$ejercicio_liberal_prof->tipo}"  placeholder="Tipo" size="100"  >
              <label for="nombre"><small>Tipo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$ejercicio_liberal_prof->fecha_inicio}"  placeholder="Fecha de Inicio" size="100"  >
              <label for="nombre"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="duracion" id="duracion" value="{$ejercicio_liberal_prof->duracion}"  placeholder="Duracion" size="100"  >
              <label for="nombre"><small>Duracion</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$funcionario_id selected=$ejercicio_liberal_prof->funcionario_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>ID Funcionario</small></label>
            </p>
            
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$pais_id selected=$ejercicio_liberal_prof->pais_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>Pais</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$subarea_id selected=$ejercicio_liberal_prof->subarea_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>ID Subarea</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$unidad_tiempo_id_unidad_tiempo selected=$ejercicio_liberal_prof->unidad_tiempo_id_unidad_tiempo output=$titulo_h_output}
              </select>
              <label for="rol"><small>Unidad de Tiempo</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$ejercicio_liberal_prof->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
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
     