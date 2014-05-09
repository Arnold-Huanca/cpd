     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$funcionario_id selected=$desemp_prof_externo->funcionario_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>Funcionario</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$subarea_id selected=$desemp_prof_externo->subarea_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>Subarea</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$pais_id selected=$desemp_prof_externo->pais_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>Pais</small></label>
            </p>
             <p>
              <input type="text" name="institucion" id="institucion" value="{$desemp_prof_externo->institucion}" placeholder="Institucion" size="200">
              <label for="apellido_p"><small>Institucion</small></label>
            </p>
            <p>
              <input type="text" name="cargo" id="cargo" value="{$desemp_prof_externo->cargo}" placeholder="Cargo" size="200">
              <label for="apellido_p"><small>Cargo</small></label>
            </p>
            <p>
              <input type="text" name="nivel_cargo" id="nivel_cargo" value="{$desemp_prof_externo->nivel_cargo}" placeholder="Nivel Cargo" size="200">
              <label for="apellido_p"><small>Nivel Cargo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$desemp_prof_externo->fecha_inicio}" placeholder="Fecha de Inicio" size="200">
              <label for="apellido_p"><small>Fecha de Inicio</small></label>
            </p>
            <p>
              <input type="text" name="fecha_conclusion" id="fecha_conclusion" value="{$desemp_prof_externo->fecha_conclusion}" placeholder="Fecha de Conclusion" size="200">
              <label for="apellido_p"><small>Fecha de Conclusion</small></label>
            </p>
            <p>
              <input type="text" name="fecha_conclusion" id="fecha_conclusion" value="{$desemp_prof_externo->fecha_conclusion}" placeholder="Fecha de Conclusion" size="200">
              <label for="apellido_p"><small>Fecha de Conclusion</small></label>
            </p>
                <p>
              <input type="text" name="descripcion" id="descripcion" value="{$desemp_prof_externo->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small> Descripcion</small></label>
            </p>
           
           <p>
              <input type="hidden" name="desemp_prof_externo_id"    value="{$desemp_prof_externo->id}">
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
     