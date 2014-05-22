     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
          <h1>Nombre &Aacute;rea: {$area->nombre} </h1>
             <p>
              <input type="text" name="nombre_subarea" id="nombre_subarea" value="{$subarea->nombre_subarea}"  placeholder="Nombre Subarea" size="100"  >
              <label for="nombre"><small>Nombre Subarea</small></label>
            </p>
            <p>
              <input type="text" name="sigla_subarea" id="sigla_subarea" value="{$subarea->sigla_subarea}"  placeholder="Sigla Subarea" size="100"  >
              <label for="nombre"><small>Sigla Subarea</small></label>
            </p>
              
           <p>
              <input type="hidden" name="subarea_id"    value="{$subarea->id}">
               <input type="hidden" name="area_id"    value="{$area->id}">
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
     