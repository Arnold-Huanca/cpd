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
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$grupos_values selected=$usuario->grupo_id output=$grupos_output}
              </select>
              <label for="rol"><small>Rol Usuario(*)</small></label>
            </p>
            <p>
              <input type="text" name="email" id="email" value="{$usuario->email}" placeholder="Correo Electronico"  size="22" >
              <label for="email"><small> E-Mail</small></label>
            </p>
            
            <p>
              <input type="text" name="ci" id="ci" value="{$usuario->ci}"  placeholder="Numero de c.i" size="200">
              <label for="ci"><small>C.I.</small></label>
            </p>
            
             
                <p>
         
              <input type="text" name="login" id="login" value="{$usuario->login}"  placeholder="Nombre de Usuario" size="200">
                <label for="apellido_materno"><small>Nombre Usuario</small></label>
                  </p>
           
            <p>
                <input type="password" name="password" id="password" value=""  placeholder="Contraseña" size="200">
              <label for="apellido_materno"><small>Contraseña</small></label>
            </p>
         
           <p>
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
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
     