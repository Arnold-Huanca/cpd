     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
             <p>
              <input type="text" name="materia" id="materia" value="{$docencia_auxiliatura_umss->materia}"  placeholder="Materia" size="100"  >
              <label for="nombre"><small>Materia</small></label>
            </p>
             
               <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$docencia_auxiliatura_umss->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
            <p>
              <input type="text" name="numero_gestiones" id="numero_gestiones" value="{$docencia_auxiliatura_umss->numero_gestiones}"  placeholder="Numero de Gestiones" size="100"  >
              <label for="nombre"><small>Numero de Gestiones</small></label>
            </p>
             <p>
              <input type="text" name="nombre_depto" id="carrera" value="{$docencia_auxiliatura_umss->carrera}"  placeholder="Carrera" size="100"  >
              <label for="nombre"><small>Carrera</small></label>
            </p>
            <p>
              <input type="text" name="departamento" id="departamento" value="{$docencia_auxiliatura_umss->departamento}"  placeholder="Departamento" size="100"  >
              <label for="nombre"><small>Departamento</small></label>
            </p>
            <p>
              <input type="text" name="facultad" id="facultad" value="{$docencia_auxiliatura_umss->facultad}"  placeholder="Facultad" size="100"  >
              <label for="nombre"><small>Facultad</small></label>
            </p>
            
            <p>
                <input type="text" name="condicion" id="condicion" value="{$docencia_auxiliatura_umss->condicion}"  placeholder="Condici&oacute;n" size="100"  >
              <label for="nombre"><small>Condici&oacute;n</small></label>
            </p>
                <p>
                <label for="rol"><small>Tipo de Gesti&oacute;n</small></label>
              <select  class="select-style gender" name="tipo_gestion_id" id="tipo_gestion_id" >
              {html_options values=$tipo_gestiones_values selected=$docencia_auxiliatura_umss->tipo_gestion_id output=$tipo_gestiones_output}
              </select>
            </p>
            
            <p>
                <label for="rol"><small>Nivel Formaci&oacute;n</small></label>
              <select  class="select-style gender" name="nivel_formacion_id" id="nivel_formacion_id" >
              {html_options values=$nivel_formaciones_values selected=$docencia_auxiliatura_umss->nivel_formacion_id output=$nivel_formaciones_output}
              </select>
            </p>
            
          
            <p>
                <input type="text" name="descripcion" id="descripcion" value="{$docencia_auxiliatura_umss->descripcion}"  placeholder="Descripci&oacute;n" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
           
           <p>
              <input type="hidden" name="docencia_auxiliatura_umss_id"    value="{$docencia_auxiliatura_umss->id}">
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
            $('#fecha_inicio').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>

</div>
     