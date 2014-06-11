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
                <label for="rol"><small>Tipo Distinci&oacute;n</small></label>
              <select  class="select-style gender" name="tipo_distincion_id" id="tipo_distincion_id" >
              {html_options values=$tipo_distinciones_values selected=$distincion->tipo_distincion_id output=$tipo_distinciones_output}
              </select>
            </p>
           <p>
              <input type="text" name="nombre_distincion" id="nombre_distincion" value="{$distincion->nombre_distincion}" placeholder="Nombre de Distincion"  size="22" >
              <label for="email"><small> Nombre de  la Distinci&oacute;n</small></label>
            </p>
            
              <p>
              <input type="text" name="institucion" id="institucion" value="{$distincion->institucion}" placeholder="Otra Institucion"  size="22" >
              <label for="email"><small> Instituci&oacute;n  que lo Distingue</small></label>
            </p><br>
            
            <p>
              <input type="fecha" name="fecha" id="fecha" value="{$distincion->fecha}" placeholder="Fecha"  size="22" >
              <label for="email"><small> Fecha</small></label>
            </p>
            
             <p>
                    {if ($distincion->universitaria eq "Si")}
                        <input type="radio" name="universitaria" value="Si"  checked />Si
                      <input type="radio" name="universitaria" value="No" />No
                        {else}
                             {if ($distincion->universitaria eq "No")}
                          <input type="radio" name="universitaria" value="Si"   />Si
                          <input type="radio" name="universitaria" value="No"  checked /> No
                           {else}
                               
                          <input type="radio" name="universitaria" value="Si"   />Si
                          <input type="radio" name="universitaria" value="No"  /> No
                   
                              {/if}
                        {/if}
     
                        <label for="email"><small> Universitaria</small></label>
            </p>
               
              <p>
                <label for="rol"><small>Ambito de Distinci&oacute;n</small></label>
              <select  class="select-style gender" name="ambitodistincion" id="ambitodistincion" >
              {html_options values=$ambitos_values selected=$distincion->ambitodistincion output=$ambitos_output}
              </select>
            </p>
           
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$distincion->pais_id output=$paises_output}
              </select>
            </p>
                    
            <p>
                 <label for="rol"><small>V.B.</small></label>
                    {if ($distincion->estado eq "Pendiente" || $distincion->estado eq "Aceptado" )}
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
               <textarea name="observacion" id="observacion" > {$distincion->observacion}</textarea>
            </p>
         
              <p>
              <input type="hidden" name="id"    value="{$distincion->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"  value="{$distincion->funcionario_id}">
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
    window.location.href="distincion.php?menus=mostrar&funcionario_id="+id;
  
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
     