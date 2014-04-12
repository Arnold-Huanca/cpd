     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_unidad_tiempo" id="nombre_unidad_tiempo" value="{$unidad_tiempo->nombre_unidad_tiempo}"  placeholder="Nombre Unidad de Tiempo" size="100"  >
              <label for="nombre"><small>Nombre Unidad de Tiempo</small></label>
            </p>
            <p>
              <input type="text" name="sigla_unidad_tiempo" id="sigla_unidad_tiempo" value="{$unidad_tiempo->sigla_unidad_tiempo}"  placeholder="Sigla Unidad Tiempo" size="100"  >
              <label for="nombre"><small>Sigla Unidad Tiempo</small></label>
            </p>
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$unidad_tiempo->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
         
           <p>
              <input type="hidden" name="unidad_tiempo_id"    value="{$unidad_tiempo->id}">
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
     