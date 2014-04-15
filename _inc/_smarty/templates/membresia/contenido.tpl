     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <label for="rol"><small>Tipo Organizacion</small></label>
              <select  class="select-style gender" name="tipo_organizacion_id" id="tipo_organizacion_id" >
              {html_options values=$tipo_organizaciones_values selected=$membresia->tipo_organizacion_id output=$tipo_organizaciones_output}
              </select>
            </p>
          
            <p>
              <input type="text" name="investigacion" id="investigacion" value="{$membresia->investigacion}" placeholder="Investigacion"  size="22" >
              <label for="email"><small> Investigacion</small></label>
            </p>
            <p>
                <input type="date" name="fecha_inicio" id="fecha_inicio" value="{$membresia->fecha_inicio}" placeholder="Fecha Inicio"  size="22" >
              <label for="email"><small> Fecha Inicio</small></label>
            </p>
            <p>
              <input type="date" name="fecha_fin" id="fecha_fin" value="{$membresia->fecha_fin}" placeholder=" Fecha Fin"  size="22" >
              <label for="email"><small> Fecha Fin</small></label>
            </p>
            <p>
              <input type="text" name="otra_organizacion" id="otra_organizacion" value="{$membresia->otra_organizacion}" placeholder="Otra Organizacion"  size="22" >
              <label for="email"><small> Otra Organizacion</small></label>
            </p>
            <p>
              <input type="text" name="miembro" id="miembro" value="{$membresia->miembro}" placeholder="Miembro"  size="22" >
              <label for="email"><small> Miembro</small></label>
            </p>
            <p>
              <input type="text" name="vb" id="vb" value="{$membresia->vb}" placeholder="VB"  size="22" >
              <label for="email"><small> VB</small></label>
            </p>
              
           <p>
              <input type="hidden" name="departamento_id"    value="{$membresia->id}">
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
     