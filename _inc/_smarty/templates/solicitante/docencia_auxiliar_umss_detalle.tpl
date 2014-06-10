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
              <input type="text" name="materia" id="materia" value="{$docencia_auxiliatura_umss->materia}"  placeholder="Materia" size="100"  >
              <label for="nombre"><small>Materia</small></label>
            </p>
             
               <p>
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$docencia_auxiliatura_umss->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
                <p>
                <label for="rol"><small>Tipo de Gesti&oacute;n</small></label>
              <select  class="select-style gender" name="tipo_gestion_id" id="tipo_gestion_id" >
              {html_options values=$tipo_gestiones_values selected=$docencia_auxiliatura_umss->tipo_gestion_id output=$tipo_gestiones_output}
              </select>
            </p>
            
            <p>
              <input type="text" name="numero_gestiones" id="numero_gestiones" value="{$docencia_auxiliatura_umss->numero_gestiones}"  placeholder="Numero de Gestiones" size="100"  >
              <label for="nombre"><small>Numero de Gestiones</small></label>
            </p>
            
              <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$docencia_auxiliatura_umss->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                  
             </select>
            </p>
             <p>
              <input type="text" name="carrera" id="carrera" value="{$docencia_auxiliatura_umss->carrera}"  placeholder="Carrera" size="100"  >
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
                    <label for="nombre"><small>Condici&oacute;n</small></label>
             <select  class="select-style gender" name="condicion" id="condicion" >
              {html_options values=$condicion_values selected=$docencia_auxiliatura_umss->condicion output=$condicion_output}
              </select>
            </p>
            
            <p>
              <label for="rol"><small>Nivel Formaci&oacute;n</small></label>
              <select  class="select-style gender" name="nivel_formacion_id" id="nivel_formacion_id" >
              {html_options values=$nivel_formaciones_values selected=$docencia_auxiliatura_umss->nivel_formacion_id output=$nivel_formaciones_output}
              </select>
            </p>
            
                   
           
           
            <p>
                 <label for="rol"><small>V.B.</small></label>
                    {if ($docencia_auxiliatura_umss->estado eq "Pendiente" || $docencia_auxiliatura_umss->estado eq "Aceptado" )}
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
               <textarea name="observacion" id="observacion" > {$docencia_auxiliatura_umss->observacion}</textarea>
            </p>
         <p>
              <input type="hidden" name="docencia_auxiliatura_umss_id"    value="{$docencia_auxiliatura_umss->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"   value="{$docencia_auxiliatura_umss->funcionario_id}">
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
    window.location.href="docencia_auxiliatura_umss.php?menus=mostrar&funcionario_id="+id;
  
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
     