     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
 
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre" id="nombre" value="{$area->nombre}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombre</small></label>
            </p>
             <p>
              <input type="text" name="sigla" id="sigla" value="{$area->sigla}" placeholder="Sigla" size="200">
              <label for="apellido_p"><small>Sigla</small></label>
            </p>
           
            <p>
                <input type="text" name="descripcion" id="descripcion" value="{$area->descripcion}" placeholder="Descripci&oacute;n"  size="22" >
                <label for="email"><small> Descripci&oacute;n</small></label>
            </p>
         
           <p>
              <input type="hidden" name="id"    value="{$area->id}">
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

<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
     