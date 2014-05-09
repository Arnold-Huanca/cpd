     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="numero_patente" id="numero_patente" value="{$patente->numero_patente}"  placeholder="Numero de Patente" size="100"  >
              <label for="nombre"><small>Numero de Patente</small></label>
            </p>
            <p>
              <input type="text" name="titulo_descripcion" id="titulo_descripcion" value="{$patente->titulo_descripcion}"  placeholder="Titulo de descripcion" size="100"  >
              <label for="nombre"><small>Titulo de descripcion</small></label>
            </p> 
            <p>
                <input type="text" name="fecha" id="fecha" value="{$patente->fecha}"  placeholder="Fecha" size="100"  >
              <label for="nombre"><small>Fecha</small></label>
            </p>
             <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$patente->pais_id output=$paises_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$patente->subarea_id output=$subareas_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$patente->descripcion}"  placeholder="Desripcion" size="100"  >
              <label for="nombre"><small>Desripci&oacute;n</small></label>
            </p> 
               
           <p>
              <input type="hidden" name="patente_id"    value="{$patente->id}">
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

<script type="text/javascript">
           $(function(){
            $('#fecha').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>


</div>
     