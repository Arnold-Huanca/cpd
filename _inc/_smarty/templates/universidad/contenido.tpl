     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_uni" id="nombre_uni" value="{$universidad->nombre_uni}"  placeholder="Nombre de Universidad" size="100"  >
              <label for="nombre"><small>Nombre de Universidad</small></label>
            </p>
            <p>
              <input type="text" name="sigla_uni" id="sigla_uni" value="{$universidad->sigla_uni}"  placeholder="Sigla de Universidad" size="100"  >
              <label for="nombre"><small>Sigla de Universidad</small></label>
            </p>
            <p>
              <input type="text" name="sistema_nacional" id="sistema_nacional" value="{$universidad->sistema_nacional}"  placeholder="Sistema Nacional" size="100"  >
              <label for="nombre"><small>Sistema Nacional</small></label>
            </p>
             
            <p>
              <select name="pais_id" id="pais_id" >
              {html_options values=$pais_values selected=$universidad->pais_id output=$pais_output}
              </select>
              <label for="rol"><small>Pais</small></label>
            </p>
           
              
           <p>
              <input type="hidden" name="universidad_id"    value="{$universidad->id}">
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
     