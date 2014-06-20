     <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
         <li><a href=""><i class="iconfa-home"></i> Dominio Idioma</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
       
           <p>
              <label for="rol"><small>Idiomas: </small></label>
              <select  class="select-style gender" name="id_idioma" id="id_idioma" >
              {html_options values=$idiomas_values selected=$dominio_idioma->id_idioma output=$idiomas_output}
              </select>
              
            </p>
            
            <p>
              <label for="nombre"><small>Habla</small></label>
              <Select class="select-style gender" name="habla" id="habla">
              {html_options options=$myOptions selected=$dominio_idioma->habla}
              </Select>
            </p>
             <p>
              <label for="nombre"><small>Lee</small></label>
              <Select class="select-style gender" name="lee" id="lee">
              {html_options options=$myOptions selected=$dominio_idioma->lee}
              </Select>
            </p>
            <p>
              <label for="nombre"><small>Escribe</small></label>
              <Select class="select-style gender" name="escribe" id="escribe">
              {html_options options=$myOptions selected=$dominio_idioma->escribe}
              </Select>
            </p>
            <p>
              <label for="nombre"><small>Entiende</small></label>
              <Select class="select-style gender" name="dominio_idioma" id="dominio_idioma">
              {html_options options=$myOptions selected=$dominio_idioma->dominio_idioma}
              </Select>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$dominio_idioma->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
           
           <p>
              <input type="hidden" name="dominio_idioma_id"    value="{$dominio_idioma->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
     