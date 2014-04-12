     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_nivel_formacion" id="nombre_nivel_formacion" value="{$nivel_formacion->nombre_nivel_formacion}"  placeholder="Nombre Nivel Formacion" size="100"  >
              <label for="nombre"><small>Nombre Nivel Formacion</small></label>
            </p>
            <p>
              <input type="text" name="sigla_nivel_formacion" id="sigla_nivel_formacion" value="{$nivel_formacion->sigla_nivel_formacion}"  placeholder="Nivel Sigla de Formacion" size="100"  >
              <label for="nombre"><small>Nivel Sigla de Formacion</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$nivel_formacion->descripcion}"  placeholder="Nivel Sigla de Formacion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
                 
              <input type="hidden" name="nivel_formacion_id"    value="{$nivel_formacion->id}">
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
			nombre_nivel_formacion: "required",
		                 
			//agree: "required"
		},
		messages: {
			nombre_nivel_formacion: "Por favor Ingrese el nombre",
			},
		
	errorElement:'span'
	});

});
</script>


</div>
     