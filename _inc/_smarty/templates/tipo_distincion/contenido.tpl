     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <input type="text" name="sigla" id="sigla" value="{$tipo_distincion->sigla}" placeholder="Sigla " size="200">
              <label for="apellido_p"><small>Sigla</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$tipo_distincion->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
             
               
           <p>
              <input type="hidden" name="tipo_distincion_id"    value="{$tipo_distincion->id}">
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
     