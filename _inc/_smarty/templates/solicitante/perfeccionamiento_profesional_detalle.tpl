{include file="header.tpl"}
{include file="menu.tpl"}
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      <div class="art-layout-cell art-sidebar1 clearfix">
<div class="art-vmenublock clearfix">
  
   {if (isUserSession())}
     
     <div class="art-blockcontent"><p>
          Usuario:  {$UsuarioSesion}
            <br /></p>
        </div>
     
           {else}
             <form action="#" method="post"  name="login">
     <p id="form-login-username">
      <label for="modlgn_username">Username(*)</label>
      <br />
      <input  type="text" name="username"  alt="username" size="18" />
    </p>
    <p id="form-login-password">
      <label for="modlgn_passwd">Password(*)</label>
      <br />
      <input  type="password" name="passwd"  size="18" alt="password" />
    </p>
     <label for="modlgn_username">Datos de Ingreso</label>
    <p id="form-login-remember">
      <label class="art-checkbox">
      <input type="checkbox" id="modlgn_remember" name="remember" value="yes" alt="Remember Me" />Remember Me
      </label>
    </p>
    
     <input type="hidden" name="tarea" value="ingreso">
     <input type="hidden" name="token" value="{$token}">
     <input name="submit" type="submit" id="submit" value="Ingresar" class="art-button">

  <ul>
    <li>
      <a href="{$URL}registrarse">Crear Su Cuenta</a>
    </li>
  </ul>
</form>
          {/if}
     

</div>
         
<div class="art-vmenublock clearfix">
 <div class="art-vmenublockcontent">

   {include file="menus.tpl"}    
     

 
 </div>
</div>
<div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t">  nota</h3>
        </div>
        <div class="art-blockcontent">
           
          
          <p>
          comentario
          
          </p>
        </div>
</div>
 <div class="art-block clearfix">
        <div class="art-blockheader">
            <h3 class="t">Nuevo Bloque</h3>
        </div>
        <div class="art-blockcontent"><p>
            nuevo
            <br /></p>
        </div>
</div>
</div>
         <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
            <li><a href=""><i class="iconfa-home"></i> Perfeccionamiento Profesional</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" enctype="multipart/form-data">
           
           
            <p>
              <label for="rol"><small>Tipo Perfeccionamiento</small></label>
              <select  class="select-style gender" name="tipo_perfeccionamiento_id" id="tipo_perfeccionamiento_id" >
              {html_options values=$tipo_perfeccionamientos_values selected=$perfeccionamiento_profecional->tipo_perfeccionamiento_id output=$tipo_perfeccionamientos_output}
              </select>
            </p>
             <p>
              <input type="text" name="fecha_certificado" id="fecha_certificado" value="{$perfeccionamiento_profecional->fecha_certificado}" placeholder="Fecha Certificado"  size="22" >
              <label for="email"><small> Fecha Certificado</small></label>
            </p>
             <p>
                    {if ($perfeccionamiento_profecional->certificado eq "Si")}
                        <input type="radio" name="certificado" value="Si"  checked />Si
                      <input type="radio" name="certificado" value="No" />No
                        {else}
                             {if ($perfeccionamiento_profecional->certificado eq "No")}
                          <input type="radio" name="certificado" value="Si"   />Si
                          <input type="radio" name="certificado" value="No"  checked /> No
                           {else}
                               
                          <input type="radio" name="certificado" value="Si"   />Si
                          <input type="radio" name="certificado" value="No"  /> No
                   
                              {/if}
                        {/if}
     
                        <label for="email"><small> Certificado</small></label>
            </p>
            
           
            <p>
                
                 {if ($perfeccionamiento_profecional->titulo eq "Si")}
                        <input type="radio" name="titulo" id="titulo"  value="Si"  checked />Si
                      <input type="radio" name="titulo" id="titulo"  value="No" />No
                        {else}
                             {if ($perfeccionamiento_profecional->titulo eq "No")}
                          <input type="radio" name="titulo" id="titulo"  value="Si"   />Si
                          <input type="radio" name="titulo" id="titulo"  value="No"  checked /> No
                           {else}
                               
                          <input type="radio" name="titulo" id="titulo"  value="Si"   />Si
                          <input type="radio" name="titulo" id="titulo"  value="No"  /> No
                   
                              {/if}
                        {/if}
     
                   <label for="email"><small>T&iacute;tulo</small></label>
            </p>
            
            <p>
                
                 {if ($perfeccionamiento_profecional->diploma eq "Si")}
                        <input type="radio" name="diploma" id="diploma"  value="Si"  checked />Si
                      <input type="radio" name="diploma" id="diploma"  value="No" />No
                        {else}
                             {if ($perfeccionamiento_profecional->diploma eq "No")}
                          <input type="radio" name="diploma" id="diploma"  value="Si"   />Si
                          <input type="radio" name="diploma" id="diploma"  value="No"  checked /> No
                           {else}
                               
                          <input type="radio" name="diploma" id="diploma"  value="Si"   />Si
                          <input type="radio" name="diploma" id="diploma"  value="No"  /> No
                   
                              {/if}
                        {/if}
                 <label for="email"><small>Diploma: </small></label>
            </p>
               <p>
                   <input type="text" name="titulo_trabajo_final" id="titulo_trabajo_final" value="{$perfeccionamiento_profecional->titulo_trabajo_final}" placeholder="T&iacute;tulo Trabajo Final"  size="22" >
                   <label for="email"><small>T&iacute;tulo Trabajo Final</small></label>
            </p>
            
            
            <p>
                <input type="text" name="mencion" id="mencion" value="{$perfeccionamiento_profecional->mencion}" placeholder="Menci&iacute;n"  size="22" >
              <label for="email"><small>Menci&oacute;n</small></label>
            </p>
             <p>
               <label for="email"><small>Duraci&oacute;n del Curso</small></label>
               <select  class="select-style gender" name="duracion_curso" id="duracion_curso" >
              {html_options values=$duracion_values selected=$perfeccionamiento_profecional->duracion_curso output=$duracion_output}
              </select>
            </p>
             <p>
              <label for="rol"><small>Unidad Tiempo</small></label>
              <select  class="select-style gender" name="unidad_tiempo_id" id="unidad_tiempo_id" >
              {html_options values=$unidad_tiempos_values selected=$perfeccionamiento_profecional->unidad_tiempo_id output=$unidad_tiempos_output}
              </select>
            </p>
               <p>
              <input type="text" name="hrs_presenciales" id="hrs_presenciales" value="{$perfeccionamiento_profecional->hrs_presenciales}" placeholder="Hrs. Presenciales"  size="22" >
              <label for="email"><small>Hrs. Presenciales</small></label>
            </p>
            <p>
              <input type="text" name="hrs_no_presenciales" id="hrs_no_presenciales" value="{$perfeccionamiento_profecional->hrs_no_presenciales}" placeholder="Hrs. No Presenciales"  size="22" >
              <label for="email"><small> Hrs. No Presenciales</small></label>
            </p>
            
            <p>
                <input type="text" name="creditos" id="creditos" value="{$perfeccionamiento_profecional->creditos}" placeholder="Cr&eacute;ditos"  size="22" >
              <label for="email"><small>Cr&eacute;ditos</small></label>
            </p>
              <p>
              <label for="rol"><small>&Aacute;rea</small></label>
              <select  class="select-style gender" name="area_id" id="area_id" poblacioattri=''>
              {html_options values=$area_values selected=$perfeccionamiento_profecional->area_id output=$area_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            <p>
              <label for="rol"><small>Sub &Aacute;rea</small></label>
               <select  class="select-style gender" name="subarea_id" id="subarea_id"   >
                
             </select>
            </p>
            
                     
            <p>
                <input type="text" name="otra_institucion" id="otra_institucion" value="{$perfeccionamiento_profecional->otra_institucion}" placeholder="Instituci&oacute;n"  size="22" >
              <label for="email"><small>Instituci&oacute;n donde Obtuvo el grado </small></label>
            </p><br>
              <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" >
              {html_options values=$paises_values selected=$perfeccionamiento_profecional->pais_id output=$paises_output}
              </select>
            </p>
             <p>
                    {if ($perfeccionamiento_profecional->estado eq "Pendiente" || $perfeccionamiento_profecional->estado eq "Aceptado" )}
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
               <label for="rol"><small>Oservaci&oacute;n</small></label>
               <textarea name="observacion" id="observacion" > {$perfeccionamiento_profecional->observacion}</textarea>
            </p>
      
            <p>
             <input type="hidden" name="perfeccionamiento_profecional_id"    value="{$perfeccionamiento_profecional->id}">
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
            $('#fecha_certificado').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
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