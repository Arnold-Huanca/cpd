     <div class="art-layout-cell art-content clearfix">
     <article >
                                
          <h2></h2>                                        
   <div >
     
     
      <form  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
          
    
<div>
<table width="200" border="0" align="left">
  <tr>
    <th width="87" scope="col">&nbsp;</th>
    <th colspan="3" scope="col">Datos Generales</th>
    <th width="6" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th colspan="3" scope="col" align="left">Datos Personales </th>
    <td width="35"><input type="checkbox" name="validacion_datos_personales" id="validacion_datos_personales" />
      <label for="validacion_datos_personales" hidden="true"></label></td>
    <td width="35">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row">Apellidos:</th>
    <td>&nbsp;</td>
    <td><input type="text" name="Apellidos" id="Apellidos" placeholder="Apellidos"/></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <th scope="row">Nombre:</th>
    <td>&nbsp;</td>
    <td> <input type="text" name="nombre" id="nombre" value="{$funcionario->nombre}"  placeholder="Nombre" size="100"  >
            </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th scope="row">CI:</th>
    <td>&nbsp;</td>
    <td><label for="ci"></label>
    <input type="text" name="ci" id="ci" /></td>
    <td>Extendido:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="ci_extendido" id="ci_extendido" /></td>
  </tr>
  <tr>
    <th scope="row">Estado Civil:</th>
    <td>&nbsp;</td>
    <td><input type="text" name="estado_civil" id="estado_civil" /></td>
    <td>Grupo Sanguineo:</td>
    <td>&nbsp;</td>
    <td><input type="text" name="grupo_sanguineo" id="grupo_sanguineo" /></td>
  </tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  </table>
  </div>
  <div>
  <table width="200" border="0" align="left">
  <tr>
    <th colspan="2" scope="row">&nbsp;</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row">Sexo:</th>
    <td><select name="sexo" size="1" id="sexo">
    <option value="ninguno" selected="selected">Ninguno</option>
    <option value="Masculino">Masculino</option>
    <option value="Femenino">Femenino</option>
    </select></td>
    <td>&nbsp;</td>
    <td>Nacionalidad:</td>
    <td><select name="nacionalidad" size="1" id="nacionalidad">
    <option selected="selected" value="Boliviano">Boliviano</option>
    </select></td>
    <td>
    </td>
    <td>
    Fecha de Nacimiento:
    </td>
    <td><input type="text" name="fecha_nacimiento" id="fecha_nacimiento" />
    </td>
  </tr>
  <tr>
    <th scope="row">Pais de Nacimiento</th>
    <td><select name="pais_nac" id="pais_nac">
    </select></td>
    <td>&nbsp;</td>
    <td>Ciudad</td>
    <td><select name="ciudad" id="ciudad">
    </select></td>
  </tr>
  <tr hidden="true">
    <th scope="row">Provincia</th>
    <td><select name="provincia" id="provincia">
    </select></td>
    <td>&nbsp;</td>
    <td>Municipio</td>
    <td><label for="municipio"></label>
      <select name="municipio" id="municipio">
      </select></td>
  </tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
          <br/>
<div>
  <table width="200" border="0" align="left">
  <tr>
    <th colspan="2" scope="row" align="left">Domicilio:</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><h3>Tipo de vivienda:</h3></th>
    <td>&nbsp;</td>
    <td><select name="tipo_vivienda" id="tipo_vivienda">
    </select></td>
    <td>Zona:</td>
    <td><input type="text" name="zona" id="zona" /></td>
  </tr>
  <tr>
    <th scope="row">Ubicacion:
      (Calle\Avenida\Plazuela)</th>
    <td>&nbsp;</td>
    <td><label for="ubicacion"></label>
      <input type="text" name="ubicacion" id="ubicacion" /></td>
    <td>No:</td>
    <td><input type="text" name="num" id="num" /></td>
  </tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
          
          
          
          
          
          
          
          
          
          
            
            <p>
                <label for="nombre"><small>CI Funcionario</small></label>
            </p>
            <p>
              <input type="text" name="apellido_p" id="apellido_p" value="{$funcionario->apellido_p}"  placeholder="Apellido Paterno" size="100"  >
              <label for="nombre"><small>Apellido Paterno</small></label>
            </p>
            <p>
              <input type="text" name="apellido_m" id="apellido_m" value="{$funcionario->apellido_m}"  placeholder="Apellido Materno" size="100"  >
              <label for="nombre"><small>Apellido Materno</small></label>
            </p>
            <p>
              <input type="text" name="nombre" id="nombre" value="{$funcionario->nombre}"  placeholder="Nombre" size="100"  >
              <label for="nombre"><small>Nombre</small></label>
            </p>
            <p>
              <input type="text" name="fecha_nac" id="fecha_nac" value="{$funcionario->fecha_nac}"  placeholder="Fecha de Nacimiento" size="100"  >
              <label for="nombre"><small>Fecha de Nacimiento</small></label>
            </p>
            <p>
              <input type="text" name="sexo" id="sexo" value="{$funcionario->sexo}"  placeholder="Sexo" size="100"  >
              <label for="nombre"><small>Sexo</small></label>
            </p>
            <p>
              <input type="text" name="estado_civil" id="estado_civil" value="{$funcionario->estado_civil}"  placeholder="Estado Civil" size="100"  >
              <label for="nombre"><small>Estado Civil</small></label>
            </p>
            <p>
              <input type="text" name="email" id="email" value="{$funcionario->email1}"  placeholder="Email" size="100"  >
              <label for="nombre"><small>Email</small></label>
            </p>
            <p>
              <input type="text" name="numero_hijos" id="numero_hijos" value="{$funcionario->numero_hijos}"  placeholder="Numero de Hijos" size="100"  >
              <label for="nombre"><small>Numero de Hijos</small></label>
            </p>
           
              
            <p>
              <label for="rol"><small>Pais</small></label>
              <select  class="select-style gender" name="pais_id" id="pais_id" poblacioattri='' >
              {html_options values=$paises_values selected=$funcionario->pais_id output=$paises_output}
              </select>&nbsp;<span id='Buscando'></span>
            </p>
            
             <p>
              <label for="rol"><small>Departamento</small></label>
              <select  class="select-style gender" name="departamento_id" id="departamento_id" >
              {html_options values=$departamentos_values selected=$funcionario->departamento_id output=$departamentos_output}
              </select>
              
              
            </p>
            <p>
              <label for="rol"><small>Municipio</small></label>
              <select  class="select-style gender" name="municipio_id" id="municipio_id" >
              {html_options values=$municipios_values selected=$funcionario->municipio_id output=$municipios_output}
              </select>
              
              
            </p>
            
          
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$funcionario->descripcion}"  placeholder="Descripcion" size="100"  >
              <label for="nombre"><small>Descripcion</small></label>
            </p>
             
           <p>
              <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
               <button class="submit" type="button" onclick="enviar()">Guardar</button>  
         

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>
<script>
  
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
     