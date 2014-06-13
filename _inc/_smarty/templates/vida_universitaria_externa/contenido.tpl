     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$vida_universitaria_externa->funcionario_id output=$funcionarios_output}
              </select>
            </p>
             
            <p>
              <label for="rol"><small>Tipo Participacion</small></label>
              <select  class="select-style gender" name="tipo_participacion_id" id="tipo_participacion_id" >
              {html_options values=$tipo_participaciones_values selected=$vida_universitaria_externa->tipo_participacion_id output=$tipo_participaciones_output}
              </select>
            </p>
             <p>
              <input type="date" name="fecha_inicio" id="fecha_inicio" value="{$vida_universitaria_externa->fecha_inicio}" placeholder="Fecha de Inicio"  size="22" >
              <label for="email"><small> Fecha de Inicio</small></label>
            </p>
             <p>
              <input type="text" name="duracion" id="duracion" value="{$vida_universitaria_externa->duracion}" placeholder="Duracion"  size="22" >
              <label for="email"><small> Duracion</small></label>
            </p>
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=$unidad_tiempos_values selected=$vida_universitaria_externa->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            <p>
              
              <label for="email"><small> Calidad en la que participo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=Estudiante selected=Estudiante output=Estudiante}
               {html_options values=Docente selected=Docente output=Docente}
                {html_options values=Administrativo selected=Administrativo output=Administrativo}
                {html_options values=Seleccione selected=Seleccione output=Seleccione}
              </select>
           
            </p>
              <br>
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$vida_universitaria_externa->universidad_id output=$universidades_output}
              </select>
            </p>
            
            
            
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$vida_universitaria_externa->pais_id output=$paises_output}
              </select>
            </p>
            
           
            <p>
              <input type="text" name="otro_tipo_participacion" id="otro_tipo_participacion" value="{$vida_universitaria_externa->otro_tipo_participacion}" placeholder="Otro Tipo de Participacion"  size="22" >
              <label for="email"><small> Otro Tipo de Participacion</small></label>
            </p>
           
           
            
            <p>
              <input type="text" name="otra_universidad" id="otra_universidad" value="{$vida_universitaria_externa->otra_universidad}" placeholder="Otra Universidad"  size="22" >
              <label for="email"><small> Otra Universidad</small></label>
            </p>
            <p>
              <input type="text" name="estado" id="estado" value="{$vida_universitaria_externa->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small> Descripcion</small></label>
            </p>
             
           <p>
              <input type="hidden" name="vida_universitaria_externa_id"    value="{$vida_universitaria_externa->id}">
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

</div>
     