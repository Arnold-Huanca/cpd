     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <label for="rol"><small>Departamento</small></label>
              <select  class="select-style gender" name="departamento_id" id="departamento_id" >
              {html_options values=$departamentos_values selected=$vivienda->departamento_id output=$departamentos_output}
              </select>
            </p>
             <p>
              <input type="text" name="nombre_distincion" id="tipo_vivienda" value="{$vivienda->tipo_vivienda}" placeholder="Tipo Vivienda"  size="22" >
              <label for="email"><small> Tipo Vivienda</small></label>
            </p>
            <p>
              <input type="text" name="zona" id="zona" value="{$vivienda->zona}" placeholder="Zona"  size="22" >
              <label for="email"><small>Zona</small></label>
            </p>
           
            <p>
                <input type="text" name="nombre_hurbanizacion" id="nombre_hurbanizacion" value="{$vivienda->nombre_hurbanizacion}" placeholder="Urbanizaci&oacute;n"  size="22" >
              <label for="email"><small> Urbanizaci&oacute;n</small></label>
            </p>
            
            <p>
              <input type="text" name="viviendacol" id="viviendacol" value="{$vivienda->viviendacol}" placeholder="Vivienda"  size="22" >
              <label for="email"><small>  Vivienda</small></label>
            </p>
             <p>
                 <input type="text" name="ubicacion_vivienda" id="ubicacion_vivienda" value="{$vivienda->ubicacion_vivienda}" placeholder="Ubicaci&oacute;n"  size="22" >
                 <label for="email"><small>  Ubicaci&oacute;n</small></label>
            </p>
            
         
           <p>
              <input type="hidden" name="vivienda_id"    value="{$vivienda->id}">
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
            $('#fecha').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>
        
</div>
     