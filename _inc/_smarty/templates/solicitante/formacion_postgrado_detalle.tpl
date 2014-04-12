{include file="header.tpl"}
{include file="menu.tpl"}
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      {include file="menus.tpl"}
          <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
               
             
            <p>
              <label for="nombre"><small>Tesis Postgrado : {$formacion_postgrado->tesis_post}</small></label>
            </p><br>
            <p>
                 <label for="nombre"><small>Titulo Postgrado : {$formacion_postgrado->titulo_post}</small></label>
            </p><br>
            <p>
               <label for="nombre"><small>Duracion Curso Postgrado : {$formacion_postgrado->duracion_curso_post}</small></label>
            </p><br>
            <p>
                 <label for="nombre"><small>Otra Institucion de Postgrado : {$formacion_postgrado->otra_institucion_post}</small></label>
            </p><br>
            <p>
             <label for="nombre"><small>Ciudad de Postgrado : {$formacion_postgrado->ciudad_post}</small></label>
            </p><br>
           
            <p>
               <label for="nombre"><small>Horas Prensenciales : {$formacion_postgrado->hrs_presenciales_post}</small></label>
            </p><br>
            <p>
                <label for="nombre"><small>Horas No Presenciales : {$formacion_postgrado->hrs_no_presenciales_post}</small></label>
            </p><br>
            <p>
                 <label for="nombre"><small>Creditos Postgrado : {$formacion_postgrado->creditos_post} </small></label>
            </p><br>
             
            <p>
              <label for="rol"><small>Universidad : {$universidad->nombre_uni}</small></label>
             
            </p><br>
          
            <p>
              <label for="rol"><small>Pais :{$pais->nombre_pais}</small></label>
             
            </p><br>
            
           <p>
              <label for="rol"><small>Subarea :{$subarea->nombre_subarea}</small></label>
            
            </p><br>
            
            <p>
              <label for="rol"><small>Unidad Tiempo : {$unidadtiempo->nombre_unidad_tiempo}</small></label>
        
            </p><br>
            
            <p>
              <label for="rol"><small>Grado Academico : {$gradoacademico->nombre_grado_academico}</small></label>
             
            </p><br>
                
            <p>
                <label for="nombre"><small>Fecha Titulo : {$formacion_postgrado->fecha_titulo_post}</small></label>
            </p><br>
            
            <p>
                <label for="nombre"><small>Descripci&oacute;n : {$formacion_postgrado->descripcion}</small></label>
            </p><br>
            
            <p>
              
                 {if ($formacion_postgrado->estado eq "Pendiente" || $formacion_postgrado->estado eq "Aceptado" )}
                      <input type="radio" name="valora" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="valora" value="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="valora" value="Aceptado"   />Aceptar
                          <input type="radio" name="valora" value="Observado"  checked /> Rechazar
                   
                        {/if}
     
                
                        
	    </p><br>
	    <p>Observaci&oacute;n:
           <textarea name="observacion" rows="7" cols="40" >
			{$formacion_postgrado->observacion}
	    </textarea>
	    </p><br>
         
           <p>
	     <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
              <input type="hidden" name="formacionpostgrado_id"    value="{$formacion_postgrado->id}">
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
     
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}    