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
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" enctype="multipart/form-data" >
               
            <p>
              <label for="rol"><small>Grado Academico</small></label>
              <select  class="select-style gender" name="grado_academico_id" id="grado_academico_id" >
              {html_options values=$grado_academicos_values selected=$formacion_postgrado->grado_academico_id output=$grado_academicos_output}
              </select>
            </p>
             <p>
              <input type="text" name="fecha_titulo_post" id="fecha_titulo_post" value="{$formacion_postgrado->fecha_titulo_post}"  placeholder="Fecha Titulo" size="100"  >
              <label for="nombre"><small>Fecha T&iacute;tulo</small></label>
            </p>
          
            <p>
              <input type="text" name="tesis_post" id="tesis_post" value="{$formacion_postgrado->tesis_post}"  placeholder="Tesis Postgrado" size="100"  >
              <label for="nombre"><small>Tesis Postgrado</small></label>
            </p>
            <p>
              <input type="text" name="titulo_post" id="titulo_post" value="{$formacion_postgrado->titulo_post}"  placeholder="Titulo Postgrado" size="100"  >
              <label for="nombre"><small>T&iacute;tulo Postgrado</small></label>
            </p>
            <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion_curso_pregrado" id="duracion_curso_pregrado" >
              {html_options values=$duracion_values selected=$formacion_postgrado->duracion_curso output=$duracion_output}
              </select>
            </p>
            <p>
              <label for="rol"><small>Unidad de Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$formacion_postgrado->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
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
              <label for="nombre"><small>Cr&eacute;ditos Postgrado</small></label>
            </p>
            
               <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$formacion_postgrado->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
             <p>
             <input type="text" name="institucion_post" id="institucion_post" value="{$formacion_postgrado->institucion_post}"  placeholder="Instituci&oacute;n donde obtuvo el grado" size="100"  >
              <label for="nombre"><small>Instituci&oacute;n donde Obtuvo el Grado</small></label>
            </p> <br>
           
            <p>
                <label for="rol"><small>Pa&iacute;s</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$formacion_postgrado->pais_id output=$paises_output}
              </select>
            </p>

            <p>
              <label for="rol"><small>V.B.</small></label>
                 {if ($formacion_postgrado->estado eq "Pendiente" || $formacion_postgrado->estado eq "Aceptado" )}
                      <input type="radio" name="estado" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="estado" value="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="estado" value="Aceptado"   />Aceptar
                          <input type="radio" name="estado" value="Observado"  checked /> Rechazar
                   
                        {/if}
     
                
                        
	    </p>
            
             <p>
               <label for="rol"><small>Archivo</small></label>
                 <input type="file" name="archivo" id="archivo" value=""  size="100"  >
           
              </p>
           <p>
               <label for="rol"><small>Observaci&oacute;n</small></label>
               <textarea name="observacion" id="observacion" > {$formacion_postgrado->observacion}</textarea>
            </p>
           
           <p>
	     <input type="hidden" name="funcionario_id" id="funcionario_id"    value="{$formacion_postgrado->funcionario_id}">
              <input type="hidden" name="id"    value="{$formacion_postgrado->id}">
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
            $('#fecha_diploma').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>
        
<script type="text/javascript">
           $(function(){
            $('#fecha_titulo_post').datepicker({
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

 <script>
jQuery('#area_id').change(function () {
var numero =document.getElementById("area_id").value;
var poblacio = jQuery(this).attr("poblacioattri");
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";
jQuery.ajax({
type: "POST", 
url: "buscar.php",
data: 'idnumero='+numero,
success: function(a) {
jQuery('#subarea_id').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script> 
</div>
     
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}    