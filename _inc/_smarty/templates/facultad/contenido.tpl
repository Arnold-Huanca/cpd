     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre" id="nombre" value="{$facultad->nombre}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombre</small></label>
            </p>
            <p>
              <input type="text" name="sigla" id="sigla" value="{$facultad->sigla}"  placeholder="Sigla" size="100"  >
              <label for="nombre"><small>Sigla</small></label>
            </p>
            
         
           <p>
              <input type="hidden" name="facultad_id"    value="{$facultad->id}">
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
<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre: "required",
		                 
			//agree: "required"
		},
		messages: {
			nombre: "Por favor ingrese su nombre",
			},
		
	errorElement:'span'
	});

});
</script>


</div>
     