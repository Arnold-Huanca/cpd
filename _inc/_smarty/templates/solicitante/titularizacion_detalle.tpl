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
     
         <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" enctype="multipart/form-data">
           
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
                 <label for="rol"><small>V.B.</small></label>
                    {if ($titularizacion->estado eq "Pendiente" || $titularizacion->estado eq "Aceptado" )}
                      <input type="radio" name="estado" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="estado" dovalue="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="estado" value="Aceptado"   />Aceptar
                          <input type="radio" name="estado" dovalue="Observado"  checked /> Rechazar
                   
                        {/if}
          </p>
              <p>
               <label for="rol"><small>Archivo</small></label>
                 <input type="file" name="archivo" id="archivo" value=""  size="100"  >
           
              </p>
           <p>
               <label for="rol"><small>Observaci&oacute;n</small></label>
               <textarea name="observacion" id="observacion" > {$titularizacion->observacion}</textarea>
            </p>
         
        
              <p>
              <input type="hidden" name="id"    value="{$titularizacion->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"  value="{$titularizacion->funcionario_id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
               <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         
         </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>

   </div>


</div>
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}        
 

</div>
         







<script>
  
  function enviar(){
     var id = $("#funcionario_id").val();
    window.location.href="asistencia_evento.php?menus=mostrar&funcionario_id="+id;
  
  }
</script>	


<script>
$(document).ready(function() {
		$("#contact_form").validate({
		rules: {
			nombre: "required",
			apellido_p: "required",
                        apellido_m: "required",
                        estado: "required",
                       email: { required:true, email: true},
                      login: { required: true, minlength: 5},
                      password: { required: true, minlength: 5},

		},
		messages: {
			nombre: "Ingrese Nombre de Usuario",
			apellido_p: "Ingrese Apellido Paterno",
			
			apellido_m: "Ingrese Apellido Materno",
                        estado:"Selecciones su Estado",
                        email:"Ingrese Email Correcto",
                        login: "Introdusca su Nombre de Usuario.",
                        password: "Introdusca su Constraceña de Usuario Minimo 5 Caracteres.",
			//agree: "Please accept our policy"
		},
		
	errorElement:'span'
	});

});
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
     