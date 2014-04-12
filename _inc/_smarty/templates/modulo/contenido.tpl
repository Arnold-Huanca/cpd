     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="codigo" id="codigo" value="{$modulo->codigo}"  placeholder="Codigo" size="100"  >
              <label for="nombre"><small>Codigo</small></label>
            </p>
             <p>
              <input type="text" name="descripcion" id="descripcion" value="{$modulo->descripcion}" placeholder="Descripcion" size="200">
              <label for="apellido_p"><small>Descripcion</small></label>
            </p>
                     <p>
              <input type="hidden" name="modulo_id"    value="{$modulo->id}">
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
     