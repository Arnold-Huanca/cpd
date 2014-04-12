     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_municipio" id="nombre_municipio" value="{$municipio->nombre_municipio}"  placeholder="Nombre Municipio" size="100"  >
              <label for="nombre"><small>Nombre Municipio</small></label>
            </p>
             <p>
              <input type="text" name="sigla_municipio" id="sigla_municipio" value="{$municipio->sigla_municipio}" placeholder="Sigla Municipio" size="200">
              <label for="apellido_p"><small>Sigla Municipio</small></label>
            </p>
            
            <p>
              <label for="rol"><small>Provincia</small></label>
              <select  class="select-style gender" name="provinvia_id" id="provinvia_id" >
              {html_options values=$provincias_values selected=$municipio->provinvia_id output=$provincias_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$municipio->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small>Descripcion</small></label>
            </p>
            
         
           <p>
              <input type="hidden" name="municipio_id"    value="{$municipio->id}">
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
     