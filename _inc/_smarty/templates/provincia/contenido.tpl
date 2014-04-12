     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
          <h1>Pais : {$pais->nombre_pais}  : Departamento  :{$departamento->nombre_depto}</h1>
            
            <p>
              <input type="text" name="nombre_provincia" id="nombre_provincia" value="{$provincia->nombre_provincia}"  placeholder="Nombre de Provincia" size="100"  >
              <label for="nombre"><small>Nombre de Provincia</small></label>
            </p>
             <p>
              <input type="text" name="sigla_provincia" id="sigla_provincia" value="{$provincia->sigla_provincia}" placeholder="Sigla de Provincia" size="200">
              <label for="apellido_p"><small>Sigla de Provincia</small></label>
            </p>
              <p>
              <input type="hidden" name="provincia_id"    value="{$provincia->id}">
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
     