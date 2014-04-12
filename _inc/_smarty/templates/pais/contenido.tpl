     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_pais" id="nombre_pais" value="{$pais->nombre_pais}"  placeholder="Nombre Pais" size="100"  >
              <label for="nombre"><small>Nombre Pais</small></label>
            </p>
            <p>
              <input type="text" name="sigla_pais" id="sigla_pais" value="{$pais->sigla_pais}"  placeholder="Sigla del Pais" size="100"  >
              <label for="nombre"><small>Sigla del Pais</small></label>
            </p>
            <p>
              <input type="text" name="gentilicio_pais" id="gentilicio_pais" value="{$pais->gentilicio_pais}"  placeholder="Gentilicio" size="100"  >
              <label for="nombre"><small>Gentilicio Pais</small></label>
            </p>
               <p>
              <input type="hidden" name="pais_id"    value="{$pais->id}">
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
			nombre_pais: "required",
		                 
			//agree: "required"
		},
		messages: {
			nombre_pais: "Por favor Ingrese el nombre",
			},
		
	errorElement:'span'
	});

});
</script>

</div>
     