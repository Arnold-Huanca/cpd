     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre_grado_academico" id="nombre_grado_academico" value="{$grado_academico->nombre_grado_academico}"  placeholder="Nombre Grado Academico" size="100"  >
              <label for="nombre"><small>Nombre Grado Academico</small></label>
            </p>
             <p>
              <input type="text" name="sigla_grado_academico" id="sigla_grado_academico" value="{$grado_academico->sigla_grado_academico}" placeholder="Sigla Grado Academico" size="200">
              <label for="apellido_p"><small>Sigla Grado Academico</small></label>
            </p>
            <p>
              <label for="rol"><small>Nivel Formacion</small></label>
              <select  class="select-style gender" name="id_nivel_formacion" id="id_nivel_formacion" >
              {html_options values=$nivel_formacion_values selected=$grado_academico->id_nivel_formacion output=$nivel_formacion_output}
              </select>
              
              
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$grado_academico->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small> Descripcion</small></label>
            </p>
                
           <p>
              <input type="hidden" name="grado_academico_id"    value="{$grado_academico->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="button" onclick="enviar()">Guardar</button>  
         

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

</div>
     