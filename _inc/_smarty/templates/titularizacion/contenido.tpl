     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
       <li><a href=""><i class="iconfa-home"></i> Titularizaciones como Docente en Umss</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="fecha_resolucion" id="fecha_resolucion" value="{$titularizacion->fecha_resolucion}"  placeholder="Fecha de Resolucion" size="100"  >
              <label for="nombre"><small>Fecha de Resolucion</small></label>
            </p>
            <p>
              <input type="text" name="materia_doc" id="materia_doc" value="{$titularizacion->materia_doc}"  placeholder="Materia Doc" size="100"  >
              <label for="nombre"><small>Materia</small></label>
            </p>
            <p>
              <input type="text" name="carrera_doc" id="carrera_doc" value="{$titularizacion->carrera_doc}"  placeholder="Carrera Doc" size="100"  >
              <label for="nombre"><small>Carrera</small></label>
            </p>
            <p>
              <input type="text" name="departamento_doc" id="departamento_doc" value="{$titularizacion->departamento_doc}"  placeholder="Departamento Doc" size="100"  >
              <label for="nombre"><small>Departamento</small></label>
            </p>
            <p>
              <input type="text" name="facultad_doc" id="facultad_doc" value="{$titularizacion->facultad_doc}"  placeholder="Facultad Doc" size="100"  >
              <label for="nombre"><small>Facultad</small></label>
            </p>
                  <p>
              <input type="text" name="nro_documento" id="nro_documento" value="{$titularizacion->nro_documento}"  placeholder="Nro de Documento" size="100"  >
              <label for="nombre"><small>Nro de Documento</small></label>
            </p>
             
          <p>
              <label for="rol"><small>Documento Titularidad</small></label>
              <select  class="select-style gender" name="documento_titularidad_id" id="documento_titularidad_id" >
              {html_options values=$documento_titularidades_values selected=$titularizacion->documento_titularidad_id output=$documento_titularidades_output}
              </select>
              
              
            </p>
           
           <p>
              <input type="hidden" name="titularizacion_id"    value="{$titularizacion->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                 <button class="submit" type="button" onclick="enviar()">Guardar</button>  
         

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>

<script type="text/javascript">
           $(function(){
            $('#fecha_resolucion').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>
        
<script>
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>

</div>
     