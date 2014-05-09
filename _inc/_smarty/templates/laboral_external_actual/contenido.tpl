     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="institucion_actividad" id="institucion_actividad" value="{$laboral_external_actual->institucion_actividad}"  placeholder="Actividad Institucion" size="100"  >
              <label for="nombre"><small>Actividad Institucion</small></label>
            </p>
             <p>
              <input type="text" name="direccion" id="direccion" value="{$laboral_external_actual->direccion}"  placeholder="Direccion" size="100"  >
              <label for="nombre"><small>Direccion</small></label>
            </p>
            <p>
              <input type="text" name="cargo" id="cargo" value="{$laboral_external_actual->cargo}"  placeholder="Cargo" size="100"  >
              <label for="nombre"><small>Cargo</small></label>
            </p>
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$laboral_external_actual->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
            <p>
              <input type="text" name="fecha_fin" id="fecha_fin" value="{$laboral_external_actual->fecha_fin}"  placeholder="Fecha Fin" size="100"  >
              <label for="nombre"><small>Fecha Fin</small></label>
            </p>
            <p>
              <input type="text" name="casilla_correo" id="casilla_correo" value="{$laboral_external_actual->casilla_correo}"  placeholder="Casilla de Correo" size="100"  >
              <label for="nombre"><small>Casilla de Correo</small></label>
            </p>
            <p>
              <input type="text" name="telefono" id="telefono" value="{$laboral_external_actual->telefono}"  placeholder="Telefono" size="100"  >
              <label for="nombre"><small>Telefono</small></label>
            </p>
            <p>
              <input type="text" name="fax" id="fax" value="{$laboral_external_actual->fax}"  placeholder="Fax" size="100"  >
              <label for="nombre"><small>Fax</small></label>
            </p>
            <p>
              <input type="text" name="email" id="email" value="{$laboral_external_actual->email}"  placeholder="Email" size="100"  >
              <label for="nombre"><small>Email</small></label>
            </p>
               <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$laboral_external_actual->funcionario_id output=$funcionarios_output}
              </select>
            </p>
            
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$laboral_external_actual->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
                  
           <p>
              <input type="hidden" name="laboral_external_actual_id"    value="{$laboral_external_actual->id}">
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
     