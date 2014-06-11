     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
          <p>
                <label for="rol"><small>Tipo Distinci&oacute;n</small></label>
              <select  class="select-style gender" name="tipo_distincion_id" id="tipo_distincion_id" >
              {html_options values=$tipo_distinciones_values selected=$distincion->tipo_distincion_id output=$tipo_distinciones_output}
              </select>
            </p>
           <p>
              <input type="text" name="nombre_distincion" id="nombre_distincion" value="{$distincion->nombre_distincion}" placeholder="Nombre de Distincion"  size="22" >
              <label for="email"><small> Nombre de  la Distinci&oacute;n</small></label>
            </p>
            
              <p>
              <input type="text" name="institucion" id="institucion" value="{$distincion->institucion}" placeholder="Otra Institucion"  size="22" >
              <label for="email"><small> Instituci&oacute;n  que lo Distingue</small></label>
            </p><br>
            
            <p>
              <input type="fecha" name="fecha" id="fecha" value="{$distincion->fecha}" placeholder="Fecha"  size="22" >
              <label for="email"><small> Fecha</small></label>
            </p>
            
             <p>
                    {if ($distincion->universitaria eq "Si")}
                        <input type="radio" name="universitaria" value="Si"  checked />Si
                      <input type="radio" name="universitaria" value="No" />No
                        {else}
                             {if ($distincion->universitaria eq "No")}
                          <input type="radio" name="universitaria" value="Si"   />Si
                          <input type="radio" name="universitaria" value="No"  checked /> No
                           {else}
                               
                          <input type="radio" name="universitaria" value="Si"   />Si
                          <input type="radio" name="universitaria" value="No"  /> No
                   
                              {/if}
                        {/if}
     
                        <label for="email"><small> Universitaria</small></label>
            </p>
               
              <p>
                <label for="rol"><small>Ambito de Distinci&oacute;n</small></label>
              <select  class="select-style gender" name="ambitodistincion" id="ambitodistincion" >
              {html_options values=$ambitos_values selected=$distincion->ambitodistincion output=$ambitos_output}
              </select>
            </p>
           
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$distincion->pais_id output=$paises_output}
              </select>
            </p>
            
           
            
            

           
          
            
           
            
           <p>
              <input type="hidden" name="id"    value="{$distincion->id}">
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
     