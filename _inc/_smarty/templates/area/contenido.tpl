     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
 
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="area" id="area" value="{$area->area}"  placeholder="Area" size="100"  >
              <label for="nombre"><small>Area</small></label>
            </p>
             <p>
              <input type="text" name="nombre_area" id="nombre_area" value="{$area->nombre_area}" placeholder="Nombre Area" size="200">
              <label for="apellido_p"><small>Nombre Area</small></label>
            </p>
           
            <p>
              <input type="text" name="sigla_area" id="sigla_area" value="{$area->sigla_area}" placeholder="Sigla"  size="22" >
              <label for="email"><small> Sigla</small></label>
            </p>
         
           <p>
              <input type="hidden" name="area_id"    value="{$area->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <input class="submit"  type="button" value="Cancelar" onclick="enviar()">

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			area: "required",
			nombre_area: "required",
                        sigla_area: "required",
		
			//agree: "required"
		},
		messages: {
			area: "Por favor ingrese el Area",
			nombre_area: "Por favor ingrese el Nombre del Area",
			
			sigla_area: "Ingrese Sigla Valida",
			//agree: "Please accept our policy"
		},
		
	errorElement:'span'
	});

});
</script>



</div>
     