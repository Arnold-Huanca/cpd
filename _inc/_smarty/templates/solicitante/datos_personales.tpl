{include file="header.tpl"}
{include file="menu.tpl"}

<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
         <div class="art-content-layout-row">
                      
      {include file="menus.tpl"}
      <div class="art-layout-cell art-content clearfix">
  
         <article id="contenido">
             
             
             
                  <div class="art-layout-cell art-content clearfix">
          <ul class="breadcrumbs">
         <li><a href=""><i class="iconfa-home"></i> Datos Personales</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h3>Llenado de datos Personales</h3>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            <p>
              <label for="nombre"><small>Nombre Ambito </small></label>
           <input type="text" name="nombre" id="nombre" value="{$funcionario->nombre}"  placeholder="Nombre" size="30%"  >  
             </p>
             
               <p>
              <label for="nombre"><small>Apellidos Paterno: </small></label>
             <input type="text" name="Apellido_p" id="Apellido_p" placeholder="Apellido Paterno" value="{$funcionario->apellido_p}"/>     
               </p>
               
                 <p>
              <label for="nombre"><small>Apellidos Materno:</small></label>
            <input type="text" name="Apellido_m" id="Apellido_m" placeholder="Apellido Materno" value="{$funcionario->apellido_m}"/>
                 </p>
                 
                   <p>
              <label for="nombre"><small>Ci.:</small></label>
           <input type="text" name="ci" id="ci" value="{$funcionario->ci}"  placeholder="Ci" size="30%"  >
                   </p>
               
                    <p>
              <label for="nombre"><small>Fecha Nacimiento:</small></label>
           <input type="text" name="fecha_nac" id="fecha_nac" placeholder="Fecha de Nacimiento" value="{$funcionario->fecha_nac}"/>
                   </p>
                   
                   <p>
              <label for="nombre"><small>  Libreta Serv. Militar .:  </small></label>
         <input type="text" name="num_libreta_militar" id="num_libreta_militar" placeholder="Numero de Libreta Militar" value="{$funcionario->num_libreta_militar}"/>
                   </p>
                   
                     
                   <p>
              <label for="nombre"><small> Nacionalidad.: </small></label>
          {if ($funcionario->nacionalidad eq "Boliviana"  || $funcionario->nacionalidad eq "")}
                      <input type="radio" name="nacionalidad" value="Boliviana"  checked />Boliviana
                      <input type="radio" name="nacionalidad" value="Extranjera" /> Extranjera
                        {else}
                          <input type="radio" name="nacionalidad" value="Boliviana"   />Boliviana
                          <input type="radio" name="nacionalidad" value="Extranjera"  checked /> Extranjera
                   
                        {/if}
   
                
   
                   </p>
               <p>
              <label for="nombre"><small>    Especificar Nacionalidad es caso de ser extranjero .:  </small></label>
      <input type="text" name="descripcion" id="descripcion" placeholder="Especificar Nacionalidad" value="{$funcionario->descripcion}"/>
                </p><br>
                
                
                <p>
              <label for="nombre"><small>  Sexo:  </small></label>
                 {if ($funcionario->sexo eq "Femenino" || $funcionario->sexo eq "" )}
                      <input type="radio" name="sexo" value="Femenino"  checked />Femenino
                      <input type="radio" name="sexo" value="Masculino" /> Masculino
                        {else}
                          <input type="radio" name="sexo" value="Femenino"   />Femenino
                          <input type="radio" name="sexo" value="Masculino"  checked /> Masculino
                   
                        {/if} 
                   </p>
                 <p>
              <label for="nombre"><small>     Estado.:  </small></label>
              <select  class="select-style gender" name="estado_civil" id="estado_civil" >
              {html_options values=$estado_values selected=$funcionario->estado_civil output=$estado_output}
              </select>             </p>
                 
                 <p>
              <label for="nombre"><small>    Email 1.: </small></label>
     <input type="text" name="email1" id="email1" placeholder="Email" value="{$funcionario->email1}"/>
                 </p>
                
                 <p>
              <label for="nombre"><small>   Email 2.: </small></label>
   <input type="text" name="email2" id="email2" placeholder=" Email 2" value="{$funcionario->email2}"/>
                 </p>
                
                <p>
              <label for="nombre"><small>    Colegio de Egreso: </small></label>
   <input type="text" name="colegio_egreso" id="colegio_egreso" placeholder="Colegio de egreso" value="{$funcionario->colegio_egreso}"/>
               
                
             <select  class="select-style gender" name="tipo_colegio" id="tipo_colegio" >
              {html_options values=$colegio_values selected=$funcionario->tipo_colegio output= $colegio_output}
              </select>    
              
              <select  class="select-style gender" name="area_colegio" id="area_colegio" >
              {html_options values=$area_values selected=$funcionario->area_colegio output= $area_output}
              </select>  
                </p>
                
                
                 <p>
              <label for="nombre"><small>   Fecha : </small></label>
   <input type="text" name="fecha_titulo_bachiller" id="fecha_titulo_bachiller" placeholder="Fecha de Egreso" value="{$funcionario->fecha_titulo_bachiller}"/>
                 </p>
                
                
           <p>
             <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
             <input type="hidden" name="tarea" value="registrar">
             <input type="hidden" name="token" value="{$token}">
             <button class="submit" type="submit">Guardar</button> 

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
            $('#fecha_nac').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:2013"
            });
            
             $('#fecha_titulo_bachiller').datepicker({
              dateFormat:'dd/mm/yy',
         
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:2013"
            });
  
  function enviar(){
    window.location.href="index.php";
  
  }
</script>
        
<script>
jQuery('#pais_id').change(function () {
var numero =document.getElementById("pais_id").value;
var poblacio = jQuery(this).attr("poblacioattri");
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";
jQuery.ajax({
type: "POST", 
url: "busqueda.php",
data: 'idnumero='+numero,
success: function(a) {
jQuery('#departamento_id').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script> 
</div>
     
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