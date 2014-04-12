     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <input type="text" name="descripcion" id="descrion" value="{$tipo_produccion->descripcion}" placeholder="Descripcion" size="200">
              <label for="apellido_p"><small>Descripcion</small></label>
            </p>
            <p>
              <input type="text" name="sigla" id="si" value="{$tipo_produccion->sigla}"  placeholder="Sigla" size="100"  >
              <label for="nombre"><small>Sigla</small></label>
            </p>
         
           <p>
              <input type="hidden" name="tipo_produccion_id"    value="{$tipo_produccion->id}">
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
     