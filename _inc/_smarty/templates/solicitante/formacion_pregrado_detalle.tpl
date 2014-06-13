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
               <label for="nombre"><small>Nombre del Titulo   : {$formacion_pregrado->nombre_titulo}</small></label>
            </p></br>
			 <p>
                 <label for="nombre"><small>Titulo de Tesis Pregrado  {$formacion_pregrado->titulo_tesis_pregrado}</small></label>
            </p> </br>
            <p>
                <label for="nombre"><small>Tesis de Pregrado  : {$formacion_pregrado->tesis_pregrado}</small></label>
            </p> </br>
           
            <p>
               <label for="nombre"><small>Duracion de Curso Pregrado : {$formacion_pregrado->duracion_curso_pregrado}</small></label>
            </p> </br>
            <p>
               <label for="nombre"><small>Otra Institucion : {$formacion_pregrado->otra_institucion}</small></label>
            </p> </br>
            <p>
              <label for="nombre"><small>Ciudad Pregrado : {$formacion_pregrado->ciudad_pregrado}</small></label>
            </p> </br>
           
          <p>
              <label for="nombre"><small>Visto Bueno : {$formacion_pregrado->vb_pregrado}</small></label>
            </p> </br>
            
            <p>
              <label for="nombre"><small>Universidad  : {$universidad->nombre_uni}</small></label>
            </p> </br>
            
            <p>
              <label for="nombre"><small> Pais : {$pais->nombre_pais} </small></label>
            </p> </br>
            
            <p>
              <label for="nombre"><small>Unidad Tiempo : {$unidad_tiempo->nombre_unidad_tiempo} </small></label>
            </p> </br>
            
            <p>
              <label for="nombre"><small>Grado Academico : {$grado_academico->nombre_grado_academico}</small></label>
            </p> </br>
             <p>
              <label for="nombre"><small> Sub Area  : {$subarea->nombre_subarea}</small></label>
            </p> </br>
            <p>
              <label for="nombre"><small>Ciudad Pregrado</small></label>
            </p> </br>
            <p>
            <label for="nombre"><small>Descripcion {$formacion_pregrado->descripcion}</small></label>
            </p></br>
	<p>
              
                 {if ($formacion_pregrado->estado eq "Pendiente" || $formacion_pregrado->estado eq "Aceptado" )}
                      <input type="radio" name="valora" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="valora" value="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="valora" value="Aceptado"   />Aceptar
                          <input type="radio" name="valora" value="Observado"  checked /> Rechazar
                   
                        {/if}
     
                
                        
	    </p>
			 <p>Observaci&oacute;n:
			<textarea name="observacion" rows="7" cols="40" >
			{$formacion_pregrado->observacion}
			</textarea>
		</p>
		    
           <p>
	    <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
              <input type="hidden" name="formacion_pregrado_id"    value="{$formacion_pregrado->id}">
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