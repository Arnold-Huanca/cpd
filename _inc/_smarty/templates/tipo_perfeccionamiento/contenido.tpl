     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <input type="text" name="sigla" id="sigla" value="{$tipo_perfeccionamiento->sigla}" placeholder="Nombre" size="200">
              <label for="apellido_p"><small>Nombre</small></label>
            </p>
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$tipo_perfeccionamiento->descripcion}"  placeholder="Sigla" size="100"  >
              <label for="nombre"><small>Sigla</small></label>
            </p>
             
                <p>
              <input type="hidden" name="tipo_perfeccionamiento_id"    value="{$tipo_perfeccionamiento->id}">
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
     