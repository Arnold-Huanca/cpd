     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_subarea" id="nombre_subarea" value="{$subarea->nombre_subarea}"  placeholder="Nombre Subarea" size="100"  >
              <label for="nombre"><small>Nombre Subarea</small></label>
            </p>
            <p>
              <input type="text" name="sigla_subarea" id="sigla_subarea" value="{$subarea->sigla_subarea}"  placeholder="Sigla Subarea" size="100"  >
              <label for="nombre"><small>Sigla Subarea</small></label>
            </p>
            <p>
              <input type="text" name="subareacol" id="subareacol" value="{$subarea->subareacol}"  placeholder="Subareacol" size="100"  >
              <label for="nombre"><small>Subareacol</small></label>
            <p>
              <label for="rol"><small>Area</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" >
              {html_options values=$areas_values selected=$subarea->area_id output=$areas_output}
              </select>
              
              
            </p>
          
         
           <p>
              <input type="hidden" name="subarea_id"    value="{$subarea->id}">
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
     