     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_facultad" id="nombre_facultad" value="{$documento_titularidad->nombre_facultad}"  placeholder="Nombre Facultad" size="100"  >
              <label for="nombre"><small>Nombre Facultad</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$documento_titularidad->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
           
         
           <p>
              <input type="hidden" name="documento_titularidad"    value="{$documento_titularidad->id}">
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
     