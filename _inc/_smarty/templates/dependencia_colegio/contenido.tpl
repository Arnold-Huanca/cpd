     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_colegio" id="nombre_colegio" value="{$dependencia_colegio->nombre_colegio}"  placeholder="Nombre Colegio" size="100"  >
              <label for="nombre"><small>Nombres de Colegio</small></label>
            </p>
             <p>
              <input type="text" name="sigla_colegio" id="sigla_colegio" value="{$dependencia_colegio->sigla_colegio}" placeholder="Sigla Colegio" size="200">
              <label for="apellido_p"><small>Sigla de Colegio</small></label>
            </p>
           
        
           <p>
              <input type="hidden" name="dependencia_colegio_id"    value="{$dependencia_colegio->id}">
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
     