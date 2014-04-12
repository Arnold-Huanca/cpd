     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_idioma" id="nombre_idioma" value="{$idioma->nombre_idioma}"  placeholder="Nombre Idioma" size="100"  >
              <label for="nombre"><small>Nombre del Idioma</small></label>
            </p>
             <p>
              <input type="text" name="sigla_idioma" id="sigla_idioma" value="{$idioma->sigla_idioma}" placeholder="Sigla Idioma" size="200">
              <label for="apellido_p"><small>Sigla del Idioma</small></label>
            </p>
            
                <p>
              <input type="hidden" name="idioma_id"    value="{$idioma->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="reset" >Cancelar</button> 

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre_idioma: "required",
		                 
			//agree: "required"
		},
		messages: {
			nombre_idioma: "Por favor ingrese su nombre",
			},
		
	errorElement:'span'
	});

});
</script>


</div>
     