     <div class="art-layout-cell art-content clearfix">
     <article >
                                
          <h2></h2>                                        
   <div >
     
     
      <form  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
          
    
<div>

    
  <table >
  <tr>
  <td> Nombre:
   </td>
   <td>  <input type="text" name="nombre" id="nombre" value="{$funcionario->nombre}"  placeholder="Nombre" size="30%"  >
   
    </td>
    <td> Apellidos Paterno:
    </td>
    <td> <input type="text" name="Apellido_p" id="Apellido_p" placeholder="Apellido Paterno" value="{$funcionario->apellido_p}"/>
    </td>
    
    <td> Apellidos Materno:
    </td>
    <td> <input type="text" name="Apellido_m" id="Apellido_m" placeholder="Apellido Materno" value="{$funcionario->apellido_m}"/>
    </td>
     
    </tr>
    
    <tr>
  <td> Ci.:
    </td>
   <td> 
    <input type="text" name="ci" id="ci" value="{$funcionario->ci}"  placeholder="Ci" size="30%"  >
   
    </td>
    <td> Fecha Nacimiento:
    </td>
    <td> <input type="text" name="fecha_nac" id="fecha_nac" placeholder="Fecha de Nacimiento" value="{$funcionario->fecha_nac}"/>
    </td>
    
    <td> Libreta Serv. Militar .:
    </td>
    <td> <input type="text" name="num_libreta_militar" id="num_libreta_militar" placeholder="Numero de Libreta Militar" value="{$funcionario->num_libreta_militar}"/>
    </td>
    
     
    </tr>
    
     <tr>
    <td> Nacionalidad.:
    </td>
    <td> 
   {if ($funcionario->nacionalidad eq "Boliviana"  || $funcionario->nacionalidad eq "")}
                      <input type="radio" name="nacionalidad" value="Boliviana"  checked />Boliviana
                      <input type="radio" name="nacionalidad" value="Extranjera" /> Extranjera
                        {else}
                          <input type="radio" name="nacionalidad" value="Boliviana"   />Boliviana
                          <input type="radio" name="nacionalidad" value="Extranjera"  checked /> Extranjera
                   
                        {/if}
     
                 </td>
                  <td> Especificar Nacionalidad es caso de ser extranjero .:
    </td>
    <td> <input type="text" name="descripcion" id="descripcion" placeholder="Especificar NAcionalidad" value="{$funcionario->descripcion}"/>
    </td>
    
    
   
   
    
   
     
    </tr>
    <td> Sexo:
    </td>
     <td>{if ($funcionario->sexo eq "Femenino" || $funcionario->sexo eq "" )}
                      <input type="radio" name="sexo" value="Femenino"  checked />Femenino
                      <input type="radio" name="sexo" value="Masculino" /> Masculino
                        {else}
                          <input type="radio" name="sexo" value="Femenino"   />Femenino
                          <input type="radio" name="sexo" value="Masculino"  checked /> Masculino
                   
                        {/if}  </td>
                        
    </td>
    
     <td> Estado.:
    </td>
    <td>
      <select  class="select-style gender" name="estado_civil" id="estado_civil" >
              {html_options values=$estado_values selected=$funcionario->estado_civil output=$estado_output}
              </select>
	 </td>
	 <td> Email 1.:
    </td>
     <td> <input type="text" name="email1" id="email1" placeholder="Email" value="{$funcionario->email1}"/>
    </td>
    
    
   
    <tr>
    <td> Email 2.:
    </td>
     <td> <input type="text" name="email2" id="email2" placeholder=" Email 2" value="{$funcionario->email2}"/>
    </td>
    
     </tr>
      <td>
              <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
          </td>
     
    </tr>
    </table>
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
     