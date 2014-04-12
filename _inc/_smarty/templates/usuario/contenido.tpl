     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre" id="nombre" value="{$usuario->nombre}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombres (*)</small></label>
            </p>
             <p>
              <input type="text" name="apellido_p" id="apellido_p" value="{$usuario->apellido_p}" placeholder="Apellido Paterno" size="200">
              <label for="apellido_p"><small>Apellido Paterno</small></label>
            </p>
            <p>
              <input type="text" name="apellido_m" id="apellido_m" value="{$usuario->apellido_m}"  placeholder="Apellido Materno" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            
            <p>
              <select name="estado" id="estado" >
              {html_options values=$titulo_h_values selected=$usuario->estado output=$titulo_h_output}
              </select>
              <label for="rol"><small>Rol Usuario(*)</small></label>
            </p>
              
            <p>
              <input type="text" name="email" id="email" value="{$usuario->email}" placeholder="Correo Electronico"  size="22" >
              <label for="email"><small> E-Mail</small></label>
            </p>
         
           <p>
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
              <input type="hidden" name="docente_id" value="{$docente->id}">
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
			nombre: "required",
			apellido_p: "required",
                        apellido_m: "required",
                        estado: "required",
                        email: "required",

		},
		messages: {
			nombre: "Ingrese Nombre de Usuario",
			apellido_p: "Ingrese Apellido Paterno",
			
			apellido_m: "Ingrese Apellido Materno",
                        estado:"Selecciones su Estado",
                        email:"Ingrese Email Correcto",
			//agree: "Please accept our policy"
		},
		
	errorElement:'span'
	});

});
</script>


</div>
     