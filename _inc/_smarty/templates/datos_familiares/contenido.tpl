     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
       <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="nombre" id="nombre" value="{$datos->nombre}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombres (*)</small></label>
            </p>
             <p>
              <input type="text" name="apellido_p" id="apellido_p" value="{$datos->apellido_p}" placeholder="Apellido Paterno" size="200">
              <label for="apellido_p"><small>Apellido Paterno</small></label>
            </p>
            <p>
              <input type="text" name="apellido_m" id="apellido_m" value="{$datos->apellido_m}"  placeholder="Apellido Materno" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
             <p>
              <input type="text" name="parentesco" id="parentesco" value="{$datos->parentesco}"  placeholder="Parentesco" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            <p>
              {if ( $datos->sexo eq "Mujer" )}
                      <input type="radio" name="sexo" value="Hombre"   />Hombre
                      <input type="radio" name="sexo" value="Mujer" checked /> Mujer
                        {else}
                         <input type="radio" name="sexo" value="Hombre"  checked   />Hombre
                          <input type="radio" name="sexo" value="Mujer"  /> Mujer
                   
                        {/if}
                        <label for="apellido_materno"><small>G&eacute;nero</small></label>
             </p>
     
            <p>
              <input type="text" name="fecha_nacimiento" id="fecha_nacimiento" value="{$datos->fecha_nacimiento}"  placeholder="Fecha Nacimiento" size="200">
              <label for="apellido_materno"><small>Apellido Materno</small></label>
            </p>
            <p>
                <input type="text" name="profesion" id="profesion" value="{$datos->profesion}"  placeholder="Profesi&oacute;n" size="200">
              <label for="apellido_materno"><small>Profesi&oacute;n : </small></label>
            </p>
            <p>
              <input type="text" name="lugar_residencia" id="lugar_residencia" value="{$datos->lugar_residencia}"  placeholder="Lugar Residencia" size="200">
              <label for="apellido_materno"><small>Lugar Residencia:</small></label>
            </p>
            
              <p>
              <input type="text" name="lugar_de_trabajo" id="lugar_de_trabajo" value="{$datos->lugar_de_trabajo}"  placeholder="Lugar de Trabajo" size="200">
              <label for="apellido_materno"><small>Lugar de Trabajo:</small></label>
            </p>
         
           <p>
              <input type="hidden" name="id"    value="{$datos->id}">
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

<script type="text/javascript">
           $(function(){
            $('#fecha_nacimiento').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>
        
</div>
     