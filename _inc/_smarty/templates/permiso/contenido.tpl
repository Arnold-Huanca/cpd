     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="ver" id="ver" value="{$permiso->ver}"  placeholder="Ver" size="100"  >
              <label for="nombre"><small>Ver</small></label>
            </p>
            <p>
              <input type="text" name="crear" id="crear" value="{$permiso->crear}"  placeholder="Crear" size="100"  >
              <label for="nombre"><small>Crear</small></label>
            </p>
            <p>
              <input type="text" name="editar" id="editar" value="{$permiso->editar}"  placeholder="Editar" size="100"  >
              <label for="nombre"><small>Editar</small></label>
            </p>
            <p>
              <input type="text" name="eliminar" id="eliminar" value="{$permiso->eliminar}"  placeholder="Eliminar" size="100"  >
              <label for="nombre"><small>Eliminar</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$modulo_id selected=$permiso->modulo_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>ID Modulo</small></label>
            </p>
            <p>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$grupo_id selected=$permiso->grupo_id output=$titulo_h_output}
              </select>
              <label for="rol"><small>ID Grupo</small></label>
            </p>
             
           <p>
              <input type="hidden" name="departamento_id"    value="{$departamento->id}">
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
     