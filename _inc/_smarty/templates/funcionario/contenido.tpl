     <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
            
            <p>
              <input type="text" name="ci_f" id="ci_f" value="{$funcionario->ci_f}"  placeholder="CI Funcionario" size="100"  >
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
              <input type="text" name="email" id="email" value="{$funcionario->email}"  placeholder="Email" size="100"  >
              <label for="nombre"><small>Email</small></label>
            </p>
            <p>
              <input type="text" name="numero_hijos" id="numero_hijos" value="{$funcionario->numero_hijos}"  placeholder="Numero de Hijos" size="100"  >
              <label for="nombre"><small>Numero de Hijos</small></label>
            </p>
            <p>
              <input type="text" name="direccion_domicilio" id="direccion_domicilio" value="{$funcionario->direccion_domicilio}"  placeholder="Direccion de Domicilio" size="100"  >
              <label for="nombre"><small>Direccion de Domicilio</small></label>
            </p>
            <p>
              <input type="text" name="numero_domicilio" id="numero_domicilio" value="{$funcionario->numero_domicilio}"  placeholder="Numero de Domicilio" size="100"  >
              <label for="nombre"><small>Numero de Domicilio</small></label>
            </p>
            <p>
              <input type="text" name="telefono_domicilio" id="telefono_domicilio" value="{$funcionario->telefono_domicilio}"  placeholder="Telefono Domicilio" size="100"  >
              <label for="nombre"><small>Telefono Domicilio</small></label>
            </p>
            <p>
              <input type="text" name="casilla_correo" id="casilla_correo" value="{$funcionario->casilla_correo}"  placeholder="Casilla de Correo" size="100"  >
              <label for="nombre"><small>Casilla de Correo</small></label>
            </p>
            <p>
              <input type="text" name="colegio_egreso" id="colegio_egreso" value="{$funcionario->colegio_egreso}"  placeholder="Egreso de Colegio" size="100"  >
              <label for="nombre"><small>Egreso de Colegio</small></label>
            </p>
            <p>
              <input type="text" name="echa_titulo_bachiller" id="Fecha_titulo_bachiller" value="{$funcionario->fecha_titulo_bachiller}"  placeholder="Fecha Titulo Bachiller" size="100"  >
              <label for="nombre"><small>Fecha Titulo Bachiller</small></label>
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
              <label for="rol"><small>Area Colegio</small></label>
              <select  class="select-style gender" name="area_colegio_id" id="area_colegio_id" >
              {html_options values=$area_colegios_values selected=$funcionario->area_colegio_id output=$area_colegios_output}
              </select>
              
              
            </p>
            <p>
              <label for="rol"><small>Dependencia Colegio</small></label>
              <select  class="select-style gender" name="dependencia_colegio_id" id="dependencia_colegio_id" >
              {html_options values=$dependencia_colegios_values selected=$funcionario->dependencia_colegio_id output=$dependencia_colegios_output}
              </select>
              
              
            </p>
          
            <p>
              <label for="rol"><small>Usuario</small></label>
              <select  class="select-style gender" name="usuario_id" id="usuario_id" >
              {html_options values=$usuarios_values selected=$funcionario->usuario_id output=$usuarios_output}
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
                <button class="submit" type="reset" >Cancelar</button> 

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>

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
     