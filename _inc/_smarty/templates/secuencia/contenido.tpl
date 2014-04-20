     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
                <label for="rol"><small>Modulo</small></label>
              <select  class="select-style gender" name="modulo_id" id="modulo_id" >
              {html_options values=$modulo_values selected=$secuencia->modulo_id output=$modulo_output}
              </select>
            </p>
             <p>
              <input type="text" name="grupo" id="grupo" value="{$secuencia->grupo}" placeholder="Grupo"  size="22" >
              <label for="email"><small> Grupo</small></label>
            </p>
           
            <p>
              <input type="text" name="importancia" id="importancia" value="{$secuencia->importancia}" placeholder="Importancia"  size="22" >
              <label for="email"><small> Importancia</small></label>
            </p>
            <p>
              <input type="text" name="nivel" id="nivel" value="{$secuencia->nivel}" placeholder="Nivel"  size="22" >
              <label for="email"><small> Nivel</small></label>
            </p>
            
           
           <p>
              <input type="hidden" name="secuencia_id"    value="{$secuencia->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="button" onclick="enviar()">Guardar</button>  
         

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
     