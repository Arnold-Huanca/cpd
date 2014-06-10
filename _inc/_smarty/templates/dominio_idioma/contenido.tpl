     <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
         <li><a href=""><i class="iconfa-home"></i> Dominio Idioma</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
          
           <input type="checkbox" name="numero[]" value="1"/> 1 <br/>
          <input type="checkbox" name="numero[]" value="2"/> 2 <br/>
          <input type="checkbox" name="numero[]" value="3"/> 3 <br/>
          <input type="checkbox" name="numero[]" value="4"/> 4 <br/>
          
           <p>
              <label for="rol"><small>Idioma</small></label>
              <select  class="select-style gender" name="id_idioma" id="id_idioma" >
              {html_options values=$idiomas_values selected=$dominio_idioma->id_idioma output=$idiomas_output}
              </select>
              
            </p>
            
            <p>
              <input type="text" name="habla" id="habla" value="{$dominio_idioma->habla}"  placeholder="Habla" size="100"  >
              <label for="nombre"><small>Habla</small></label>
            </p>
             <p>
              <input type="text" name="lee" id="lee" value="{$dominio_idioma->lee}"  placeholder="Lee" size="100"  >
              <label for="nombre"><small>Lee</small></label>
            </p>
            <p>
              <input type="text" name="escribe" id="escribe" value="{$dominio_idioma->escribe}"  placeholder="Escribe" size="100"  >
              <label for="nombre"><small>Escribe</small></label>
            </p>
            <p>
              <input type="text" name="dominio_idioma" id="dominio_idioma" value="{$dominio_idioma->dominio_idioma}"  placeholder="Dominio Idioma" size="100"  >
              <label for="nombre"><small>Dominio Idioma</small></label>
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
     