     <div class="art-layout-cell art-content clearfix">
         <ul class="breadcrumbs">
       <li><a href=""><i class="iconfa-home"></i> Docencias y Auxiliaturas Umss</a> <span class="separator"></span></li>
           </ul>
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
           
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
              <input type="hidden" name="docencia_auxiliatura_umss_id"    value="{$docencia_auxiliatura_umss->id}">
              <input type="hidden" name="funcionario_id"  id="funcionario_id"   value="{$docencia_auxiliatura_umss->funcionario}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
               <button class="submit" type="submit">Guardar</button> 
               <button class="submit" type="button" onclick="enviar()">Cancelar</button>  
         

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
     