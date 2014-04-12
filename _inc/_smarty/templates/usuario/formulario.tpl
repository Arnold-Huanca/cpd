     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
 <form  class="contact_form" action="#" id="contact_form" name="contact_form" runat="server">  
        <div>  
            <ul>  
                <li>  
                    <h2>Registro de Usuario</h2>  
                    <span class="required_notification">* Datos requeridos</span>  
                </li>  
                <li>  
                    <label for="name">Nombre:</label>  
                    <input type="text" id="nombre" mane="nombre" placeholder="John Doe" required />  
                </li> 
                 <li>  
                    <label for="name">Apellido Paterno:</label>  
                    <input type="text" id="nombre" mane="nombre" placeholder="John Doe" required />  
                </li> 
                 <li>  
                    <label for="name">Apellido :</label>  
                    <input type="text" id="nombre" mane="nombre" placeholder="John Doe" required />  
                </li> 
                <li>  
                    <label for="email">Email:</label>  
                    <input type="email" name="email" placeholder="info@developerji.com" required />  
                    <span class="form_hint">Formato correcto: "name@something.com"</span>  
                </li>  
                <li>  
                    <label for="website">Sitio web:</label>  
                    <input type="url" name="website" placeholder="http://developerji.com" required pattern="(http|https)://.+" />  
                    <span class="form_hint">Formato correcto: "http://developerji.com"</span>  
                </li>  
                <li>  
                    <label for="message">Mensaje:</label>  
                    <textarea name="message" cols="40" rows="6" required></textarea>  
                </li>  
                <li>  
                    <button class="submit" type="submit">Enviar mensaje</button>  
                </li>  
            </ul>  
        </div>  
    </form>  
<div class="art-content-layout">
    <div class="art-content-layout-row">
    <div class="art-layout-cell layout-item-0" style="width: 60%" >
        <h3>Noticias</h3><ul><li><p><span style="font-weight: bold;">Hola mundo.</span><br><span style="font-style: italic;">Adipiscing metus.</span></p><br><p>Donec quis non maecenas quis vel faucibus eu curae sem. Blandit dapibus turpis nisi accumsan quis libero porta auctor id sem mi proin vestibulum sapien nullam mauris. </p><br></li><li><p><span style="font-weight: bold;">Vestibulum nec. </span><br><span style="font-style: italic;">Lacus luctus et.</span></p><br><p>Donec placerat vestibulum sem elit consectetuer odio  donec.  Arcu justo nunc eget fringilla massa tincidunt. Elit nec sed nulla congue justo quam ac sit.  Vel egestas eget sem ultrices ipsum sit a nec. </p></li></ul>
    </div><div class="art-layout-cell layout-item-1" style="width: 40%" >
        <h3>Why Us</h3><p><span style="font-weight: bold;">Dui sagittis amet ac.</span></p><p>Pretium nec amet nibh purus morbi metus lobortis orci.  Condimentum nec  dis vel feugiat ut arcu libero egestas  pede tempus  sit phasellus ut.</p><p><span style="font-style: italic;">Lacus et viverra lacus. </span></p><p><span style="font-weight: bold;">Ac venenatis pede. </span></p><p>Faucibus aenean etiam suspendisse.  Euismod lacus placerat pellentesque orci gravida nunc et ut elit leo. </p><p><span style="font-style: italic;">Urna varius nunc aliquam ut. </span></p>
    </div>
    </div>
</div>
</div>
</article>
         
         <script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre: "required",
			apellidop: "required",
			login: {
				required: true,
				minlength: 2
			},
			pasword: {
				required: true,
				minlength: 5
			},
			
			email: {
				required: true,
				email: true
			},
			
			//agree: "required"
		},
		messages: {
			nombre: "Por favor ingrese su nombre",
			apellidop: "Por favor ingrese su apellido",
			login: {
				required: "por favor ingrser su login",
				minlength: "Minimo es de dos caracteres es su login"
			},
			pasword: {
				required: "Ingrese su password",
				minlength: "minimo es de 5 caracteres"
			},
			email: "Ingrese un valida  direccion email",
			//agree: "Please accept our policy"
		},
		
	errorElement:'span'
	});

});
</script>

     </div>