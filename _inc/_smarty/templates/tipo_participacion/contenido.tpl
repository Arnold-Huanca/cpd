     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="textarea" name="descripcion" id="descripcion" value="{$tipo_participacion->descripcion}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombre</small></label>
            </p>
             <p>
              <input type="text" name="sigla" id="sigla" value="{$tipo_participacion->sigla}" placeholder="Sigla" size="200">
              <label for="apellido_p"><small>Sigla</small></label>
            </p>
            <p>
              <input type="text" name="dominio_participacion" id="dominio_participacion" value="{$tipo_participacion->dominio_participacion}" placeholder="Sigla Departamento" size="200">
              <label for="apellido_p"><small>Dominio de Participacion</small></label>
            </p>
            
             
           <p>
              <input type="hidden" name="tipo_participacion_id"    value="{$tipo_participacion->id}">
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
     