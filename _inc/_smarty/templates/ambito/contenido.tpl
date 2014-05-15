     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_ambito" id="nombre_ambito" value="{$ambito->nombre_ambito}"  placeholder="Nombre Ambito" size="100"  >
              <label for="nombre"><small>Nombre Ambito </small></label>
            </p>
             <p>
              <input type="textarear"  name="descripcion_sigla" id="descripcion_sigla" value="{$ambito->descripcion_sigla}" placeholder="Descripcion Sigla" size="200">
              <label for="apellido_p"><small>Descripcion de la Sigla</small></label>
            </p>
           
           
         
           <p>
              <input type="hidden" name="ambito_id"    value="{$ambito->id}">
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
			nombre_ambito: "required",
			descripcion_sigla: "required",
     	
			//agree: "required"
		},
		messages: {
			nombre_ambito: "Ingrese Nombre de Ambito",
			descripcion_sigla: "Ingrese Descripcion",
			},
		
	errorElement:'span'
	});

});
</script>

</div>
     