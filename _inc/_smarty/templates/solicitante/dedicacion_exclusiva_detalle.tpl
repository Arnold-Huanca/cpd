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
              <input type="text" name="fecha_inicio" id="fecha_inicio" value="{$dedicacion_exclusiva->fecha_inicio}"  placeholder="Fecha Inicio" size="100"  >
              <label for="nombre"><small>Fecha Inicio</small></label>
            </p>
            <p>
                <input type="text" name="fecha_fin" id="fecha_fin" value="{$dedicacion_exclusiva->fecha_fin}"  placeholder="Fecha Conclusi&oacute;n" size="100"  >
              <label for="nombre"><small>Fecha Conclusi&oacute;n</small></label>
            </p>
            <p>
              <label for="rol"><small>Tipo Gestion</small></label>
              <select  class="select-style gender" name="tipo_gestion_id" id="tipo_gestion_id" >
              {html_options values=$tipo_gestiones_values selected=$dedicacion_exclusiva->tipo_gestion_id output=$tipo_gestiones_output}
              </select>
            </p>
             <p>
                 <input type="text" name="numero_gestiones" id="numero_gestiones" value="{$dedicacion_exclusiva->numero_gestiones}"  placeholder="Numero Gesti&oacute;n" size="100"  >
                 <label for="nombre"><small>Numero Gesti&oacute;n</small></label>
            </p>
           
            <p>
              <input type="text" name="unidad_academica" id="unidad_academica" value="{$dedicacion_exclusiva->unidad_academica}"  placeholder="Unidad Academica" size="100"  >
              <label for="nombre"><small>Unidad Academica</small></label>
            </p>
            
              
            <p>
              <label for="rol"><small>Ambito</small></label>
              <select  class="select-style gender" name="ambito_id" id="ambito_id" >
              {html_options values=$ambitos_values selected=$dedicacion_exclusiva->ambito_id output=$ambitos_output}
              </select>
            </p>
              
           
            <p>
                 <label for="rol"><small>V.B.</small></label>
                    {if ($dedicacion_exclusiva->estado eq "Pendiente" || $dedicacion_exclusiva->estado eq "Aceptado" )}
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
               <textarea name="observacion" id="observacion" > {$dedicacion_exclusiva->observacion}</textarea>
            </p>
         
                <p>
              <input type="hidden" name="asistencia_evento_id"    value="{$dedicacion_exclusiva->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"  value="{$dedicacion_exclusiva->funcionario_id}">
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
    window.location.href="dedicacion_exclusiva.php?menus=mostrar&funcionario_id="+id;
  
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
     