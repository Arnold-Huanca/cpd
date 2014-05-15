     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$distincion->pais_id output=$paises_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$distincion->universidad_id output=$universidades_output}
              </select>
            </p>
            
            <p>
                <label for="rol"><small>Tipo Distinci&oacute;n</small></label>
              <select  class="select-style gender" name="tipo_distincion_id" id="tipo_distincion_id" >
              {html_options values=$tipo_distinciones_values selected=$distincion->tipo_distincion_id output=$tipo_distinciones_output}
              </select>
            </p>

            <p>
              <input type="text" name="nombre_distincion" id="nombre_distincion" value="{$distincion->nombre_distincion}" placeholder="Nombre de Distincion"  size="22" >
              <label for="email"><small> Nombre de Distinci&oacute;n</small></label>
            </p>
            <p>
              <input type="text" name="otra_institucion" id="otra_institucion" value="{$distincion->otra_institucion}" placeholder="Otra Institucion"  size="22" >
              <label for="email"><small> Otra Instituci&oacute;n</small></label>
            </p>
            <p>
              <input type="fecha" name="fecha" id="fecha" value="{$distincion->fecha}" placeholder="Fecha"  size="22" >
              <label for="email"><small> Fecha</small></label>
            </p>
            
            <p>
              <input type="text" name="ambitodistincion" id="universitaria" value="{$distincion->universitaria}" placeholder="Universitaria"  size="22" >
              <label for="email"><small> Universitaria</small></label>
            </p>
            
            <p>
              <input type="text" name="ambitodistincion" id="ambitodistincion" value="{$distincion->ambitodistincion}" placeholder="Ambito de Distincion"  size="22" >
              <label for="email"><small> Ambito de Distinci&oacute;n</small></label>
            </p>
            
           <p>
              <input type="hidden" name="distincion_id"    value="{$distincion->id}">
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
     