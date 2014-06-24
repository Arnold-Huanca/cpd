     <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
         <li><a href=""><i class="iconfa-home"></i> Datos de Comunicacion</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
       
         
              <p>
              <label for="tipo"><small>    Tipo .:  </small></label>
              <select  class="select-style gender" name="tipo" id="estado_civil" >
              {html_options values= $tipo_telefono_values selected=$datos->tipo output=$tipo_telefono_values}
              </select>
                 </p>
           
           
            <p>
              <input type="text" name="numero" id="numero" value="{$datos->numero}"  placeholder="Numero" size="200">
              <label for="numero"><small>Numero</small></label>
            </p>
            
          
           
           <p>
              <input type="hidden" name="datos_de_communicacion"    value="{$datos->id}">
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
     