     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="sigla" id="sigla" value="{$medio_difunsion->sigla}"  placeholder="Sigla" size="100"  >
              <label for="nombre"><small>Sigla</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$medio_difunsion->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
            
           <p>
              <input type="hidden" name="medio_difunsion_id"    value="{$medio_difunsion->id}">
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
     