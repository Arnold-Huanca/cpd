     <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
         <li><a href=""><i class="iconfa-home"></i> Dedicaci&oacute;n</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_dedicacion" id="nombre_dedicacion" value="{$dedicacion->nombre_dedicacion}"  placeholder="Nombre Dedicacion" size="100"  >
              <label for="nombre"><small>Nombre Dedicacion</small></label>
            </p>
             <p>
              <input type="text" name="dedicacioncol" id="dedicacioncol" value="{$dedicacion->dedicacioncol}"  placeholder="Dedicacion Col" size="100"  >
              <label for="nombre"><small>Dedicacion Col</small></label>
            </p>
              
           <p>
              <input type="hidden" name="dedicacion_id"    value="{$dedicacion->id}">
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
<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre_dedicacion: "required",
			
			//agree: "required"
		},
		messages: {
			nombre_dedicacion: "Por favor ingrese el Nombre",
		
		},
		
	errorElement:'span'
	});

});
</script>


</div>
     