     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
           
            <p>
              <label for="rol"><small>Tipo Perfeccionamiento</small></label>
              <select  class="select-style gender" name="tipo_perfeccionamiento_id" id="tipo_perfeccionamiento_id" >
              {html_options values=$tipo_perfeccionamientos_values selected=$perfeccionamiento_profecional->tipo_perfeccionamiento_id output=$tipo_perfeccionamientos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Funcionario</small></label>
              <select  class="select-style gender" name="funcionario_id" id="funcionario_id" >
              {html_options values=$funcionarios_values selected=$perfeccionamiento_profecional->funcionario_id output=$funcionarios_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id_unidad_tiempo" id="unidad_tiempo_id_unidad_tiempo" >
              {html_options values=$unidad_tiempos_values selected=$perfeccionamiento_profecional->unidad_tiempo_id_unidad_tiempo output=$unidad_tiempos_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$perfeccionamiento_profecional->pais_id output=$paises_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Universidad</small></label>
              <select  class="select-style gender" name="universidad_id" id="universidad_id" >
              {html_options values=$universidades_values selected=$perfeccionamiento_profecional->universidad_id output=$universidades_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Subarea</small></label>
              <select  class="select-style gender" name="subarea_id" id="subarea_id" >
              {html_options values=$subareas_values selected=$perfeccionamiento_profecional->subarea_id output=$subareas_output}
              </select>
            </p>
            
            <p>
              <input type="date" name="fecha_certificado" id="fecha_certificado" value="{$perfeccionamiento_profecional->fecha_certificado}" placeholder="Fecha Certificado"  size="22" >
              <label for="email"><small> Fecha Certificado</small></label>
            </p>
            <p>
              <input type="text" name="certificado" id="certificado" value="{$perfeccionamiento_profecional->certificado}" placeholder="Certificado"  size="22" >
              <label for="email"><small> Certificado</small></label>
            </p>
            <p>
              <input type="text" name="titulo" id="titulo" value="{$perfeccionamiento_profecional->titulo}" placeholder="Titulo"  size="22" >
              <label for="email"><small>Titulo</small></label>
            </p>
            <p>
              <input type="text" name="diploma" id="diploma" value="{$perfeccionamiento_profecional->diplona}" placeholder="Diploma"  size="22" >
              <label for="email"><small>Diploma</small></label>
            </p>
            <p>
              <input type="text" name="titulo_trabajo_final" id="titulo_trabajo_final" value="{$perfeccionamiento_profecional->titulo_trabajo_final}" placeholder="Titulo Trabajo Final"  size="22" >
              <label for="email"><small>Titulo Trabajo Final</small></label>
            </p>
            <p>
              <input type="text" name="mencion" id="mencion" value="{$perfeccionamiento_profecional->mencion}" placeholder="Mencion"  size="22" >
              <label for="email"><small>Mencion</small></label>
            </p>
            <p>
              <input type="text" name="duracion_curso" id="duracion_curso" value="{$perfeccionamiento_profecional->duracion_curso}" placeholder="Duracion del Curso"  size="22" >
              <label for="email"><small>Duracion del Curso</small></label>
            </p>
            <p>
              <input type="text" name="hrs_presenciales" id="hrs_presenciales" value="{$perfeccionamiento_profecional->hrs_presenciales}" placeholder="Hrs Presenciales"  size="22" >
              <label for="email"><small>Hrs Presenciales</small></label>
            </p>
            <p>
              <input type="text" name="hrs_no_presenciales" id="hrs_no_presenciales" value="{$perfeccionamiento_profecional->hrs_no_presenciales}" placeholder="Hrs. No Presenciales"  size="22" >
              <label for="email"><small> Hrs. No Presenciales</small></label>
            </p>
            <p>
              <input type="text" name="creditos" id="creditos" value="{$perfeccionamiento_profecional->creditos}" placeholder="Creditos"  size="22" >
              <label for="email"><small>Creditos</small></label>
            </p>
            <p>
              <input type="text" name="otra_institucion" id="otra_institucion" value="{$perfeccionamiento_profecional->otra_institucion}" placeholder="Otra Institucion"  size="22" >
              <label for="email"><small>Otra Institucion</small></label>
            </p>
            <p>
              <input type="text" name="vb" id="vb" value="{$perfeccionamiento_profecional->vb}" placeholder="VB"  size="22" >
              <label for="email"><small>VB</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$perfeccionamiento_profecional->descripcion}" placeholder="Descripcion"  size="22" >
              <label for="email"><small>Descripcion</small></label>
            </p>
                
           <p>
              <input type="hidden" name="perfeccionamiento_profecional_id"    value="{$perfeccionamiento_profecional->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
                <button class="submit" type="reset" >Cancelar</button> 

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>


</div>
     