     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
        
            <p>
              <input type="text" name="tesis_post" id="tesis_post" value="{$formacion_postgrado->tesis_post}"  placeholder="Tesis Postgrado" size="100"  >
              <label for="nombre"><small>Tesis Postgrado</small></label>
            </p>
            <p>
              <input type="text" name="titulo_post" id="titulo_post" value="{$formacion_postgrado->titulo_post}"  placeholder="Titulo Postgrado" size="100"  >
              <label for="nombre"><small>Titulo Postgrado</small></label>
            </p>
            <p>
              <input type="text" name="duracion_curso_post" id="duracion_curso_post" value="{$formacion_postgrado->duracion_curso_post}"  placeholder="Duracion Curso Postgrado" size="100"  >
              <label for="nombre"><small>Duracion Curso Postgrado</small></label>
            </p>
            <p>
              <input type="text" name="otra_institucion_post" id="otra_institucion_post" value="{$formacion_postgrado->otra_institucion_post}"  placeholder="Otra Institucion de Postgrado" size="100"  >
              <label for="nombre"><small>Otra Institucion de Postgrado</small></label>
            </p>
            <p>
              <input type="text" name="ciudad_post" id="ciudad_post" value="{$formacion_postgrado->ciudad_post}"  placeholder="Ciudad de Postgrado" size="100"  >
              <label for="nombre"><small>Ciudad de Postgrado</small></label>
            </p>
           
            <p>
              <input type="text" name="hrs_presenciales_post" id="hrs_presenciales_post" value="{$formacion_postgrado->hrs_presenciales_post}"  placeholder="Horas Prensenciales" size="100"  >
              <label for="nombre"><small>Horas Prensenciales</small></label>
            </p>
            <p>
              <input type="text" name="hrs_no_presenciales_post" id="hrs_no_presenciales_post" value="{$formacion_postgrado->hrs_no_presenciales_post}"  placeholder="Horas No Presenciales" size="100"  >
              <label for="nombre"><small>Horas No Presenciales</small></label>
            </p>
            <p>
              <input type="text" name="creditos_post" id="creditos_post" value="{$formacion_postgrado->creditos_post}"  placeholder="Creditos Postgrado" size="100"  >
              <label for="nombre"><small>Creditos Postgrado</small></label>
            </p>
             
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$formacion_postgrado->universidad_id output=$universidades_output}
              </select>
            </p>
          
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$formacion_postgrado->pais_id output=$paises_output}
              </select>
            </p>
            
           <p>
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$formacion_postgrado->subarea_id output=$subareas_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$formacion_postgrado->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Grado Academico</small></label>
              <select  class="select-style gender" name="grado_academico_id" id="grado_academico_id" >
              {html_options values=$grado_academicos_values selected=$formacion_postgrado->grado_academico_id output=$grado_academicos_output}
              </select>
            </p>
                
            <p>
              <input type="text" name="fecha_titulo_post" id="fecha_titulo_post" value="{$formacion_postgrado->fecha_titulo_post}"  placeholder="Fecha Titulo" size="100"  >
              <label for="nombre"><small>Fecha Titulo</small></label>
            </p>
            
            <p>
                <input type="text" name="descripci&oacute;n" id="descripcion" value="{$formacion_postgrado->descripcion}"  placeholder="Descripcion" size="100"  >
                <label for="nombre"><small>Descripci&oacute;n</small></label>
            </p>
           
           <p>
              <input type="hidden" name="formacion_postgrado_id"    value="{$formacion_postgrado->id}">
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
     