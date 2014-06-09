     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
       <li><a href=""><i class="iconfa-home"></i> Dedicaci&oacute;n Exclusiva</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
             
            <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$dedicacion_exclusiva->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
            <p>
                <input type="text" name="fecha_fin" id="fecha_fin" value="{$dedicacion_exclusiva->fecha_fin}"  placeholder="Fecha Conclusi&oacute;n" size="100"  >
              <label for="nombre"><small>Fecha Conclusi&oacute;n</small></label>
            </p>
            <p>
              <label for="rol"><small>Tipo Gestion</small></label>
              <select  class="select-style gender" name="tipo_gestion_id" id="tipo_gestion_id" >
              {html_options values=$tipo_gestiones_values selected=$dedicacion_exclusiva->tipo_gestion_id output=$tipo_gestiones_output}
              </select>
            </p>
             <p>
                 <input type="text" name="numero_gestiones" id="numero_gestiones" value="{$dedicacion_exclusiva->numero_gestiones}"  placeholder="Numero Gesti&oacute;n" size="100"  >
                 <label for="nombre"><small>Numero Gesti&oacute;n</small></label>
            </p>
           
            <p>
              <input type="text" name="unidad_academica" id="unidad_academica" value="{$dedicacion_exclusiva->unidad_academica}"  placeholder="Unidad Academica" size="100"  >
              <label for="nombre"><small>Unidad Academica</small></label>
            </p>
            
              
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$dedicacion_exclusiva->ambito_id output=$ambitos_output}
              </select>
            </p>
               <p>
              <input type="hidden" name="dedicacion_exclusiva_id"    value="{$dedicacion_exclusiva->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                 <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script type="text/javascript">
           $(function(){
            $('#fecha_inicio').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
           
            });
          });
          
             $(function(){
            $('#fecha_fin').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
           
            });
          });
        </script>
        
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
     