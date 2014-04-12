     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
              <h2> Pais : {$pais->nombre_pais}</h2>   
            <p>
              <input type="text" name="nombre_depto" id="nombre_depto" value="{$departamento->nombre_depto}"  placeholder="Nombre Departamento" size="100"  >
              <label for="nombre"><small>Nombre Departamento</small></label>
            </p>
             <p>
              <input type="text" name="sigla_depto" id="sigla_depto" value="{$departamento->sigla_depto}" placeholder="Sigla Departamento" size="200">
              <label for="apellido_p"><small>Sigla Departamento</small></label>
            </p>
            
            
         
           <p>
              <input type="hidden" name="departamento_id"    value="{$departamento->id}">
               <input type="hidden" name="pais_id"    value="{$pais->id}">
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
     