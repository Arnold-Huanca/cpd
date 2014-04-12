     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="titulo_tema" id="titulo_tema" value="{$produccion->titulo_tema}"  placeholder="Titulo de Tema" size="100"  >
              <label for="nombre"><small>Titulo de Tema</small></label>
            </p>
            <p>
              <input type="text" name="tipo_circulacion" id="tipo_circulacion" value="{$produccion->tipo_circulacion}"  placeholder="Tipo de Circulacion" size="100"  >
              <label for="nombre"><small>Tipo de Circulacion</small></label>
            </p>
            <p>
              <input type="text" name="institucion_entrega" id="institucion_entrega" value="{$produccion->institucion_entrega}"  placeholder="Institucion de Entrega" size="100"  >
              <label for="nombre"><small>Institucion de Entrega</small></label>
            </p>
            <p>
              <input type="text" name="fecha_conclucion" id="fecha_conclucion" value="{$produccion->fecha_conclucion}"  placeholder="Fecha de Conclusion" size="100"  >
              <label for="nombre"><small>Fecha de Conclusion</small></label>
            </p>
      
            <p>
              <input type="text" name="vb" id="vb" value="{$produccion->vb}"  placeholder="VB" size="100"  >
              <label for="nombre"><small>VB</small></label>
            </p>
             
            <p>
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$produccion->subarea_id output=$subareas_output}
              </select>
            </p>
       
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$produccion->ambito_id output=$ambitos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Medio Difunsion</small></label>
              <select  class="select-style gender" name="medio_difunsion_id" id="medio_difunsion_id" >
              {html_options values=$medio_difunsiones_values selected=$produccion->medio_difunsion_id output=$medio_difunsiones_output}
              </select>
            </p>
            
            
            <p>
              <label for="rol"><small>Tipo de Produccion</small></label>
              <select  class="select-style gender" name="tipo_produccion_id" id="tipo_produccion_id" >
              {html_options values=$tipo_producciones_values selected=$produccion->tipo_produccion_id output=$tipo_producciones_output}
              </select>
            </p>
            
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$produccion->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
              
           <p>
              <input type="hidden" name="produccion_id"    value="{$produccion->id}">
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
     