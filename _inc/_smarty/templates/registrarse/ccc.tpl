     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
          <div class="both">
            <div>
            <p>
              <input type="text" name="nombre" id="nombre" value=""  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombres (*)</small></label>
            </p>
            </div>
              <div>
             <p>
              <input type="text" name="apellido_p" id="apellido_p" value="" placeholder="Apellido Paterno" size="200">
              <label for="apellido_p"><small>Apellido Paterno</small></label>
            </p>
            </div>
            <div>
            <p>
              <input type="text" name="apellido_m" id="apellido_m" value=""  placeholder="Apellido Materno" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            </div>
            <div>
                <p>
                 <label for="email"><small> E-Mail</small></label>
                 </p>
            </div>
                
         
             <div>
               <input type="text" name="email" id="email" value="" placeholder="Correo Electronico"  size="22" > 
              
               <label id="Info"> </label>
            
             </div>
              <div>
                     <p>
                   <label for="apellido_materno"><small>Nombre Usuario</small></label>
                   </p>
              </div>
            
            <div>
            <p>
         
              <input type="text" name="login" id="login" value=""  placeholder="Nombre de Usuario" size="200">
               <label id="Infos"> </label>
             
            </p>
            </div>
              <div>
            <p>
                <input type="password" name="password" id="password" value=""  placeholder="Contraseña" size="200">
              <label for="apellido_materno"><small>Contraseña</small></label>
            </p>
            </div>
              
            <div>
         
           <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <button class="submit" type="submit">Guardar</button> 
              <button class="submit" type="reset" >Cancelar</button> 

            </p>
            </div>
            </div>
          </form>
              
            
              
        </div>
        <p>{$ERROR}</p>
</article>



<script type="text/javascript">
$(document).ready(function() {	
	$('#emails').blur(function(){
		
		$('#Info').html('<img src="{$URL_IMG}/loader.gif" alt="" />').fadeOut(1000);

		var email = $(this).val();		
		var dataString = 'email='+email;
		
		$.ajax({
            type: "POST",
            url: "check_email.php",
            data: dataString,
            success: function(data) {
		$('#Info').fadeIn(1000).html(data);
				//alert(data);
            }
        });
    });              
});    
</script>

<script type="text/javascript">
$(document).ready(function() {	
	$('#logins').blur(function(){
		
		$('#Infos').html('<img src="{$URL_IMG}/loader.gif" alt="" />').fadeOut(1000);

		var login = $(this).val();		
		var dataString = 'login='+login;
		
		$.ajax({
            type: "POST",
            url: "check_login.php",
            data: dataString,
            success: function(data) {
		$('#Infos').fadeIn(1000).html(data);
				//alert(data);
            }
        });
    });              
});    
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
     