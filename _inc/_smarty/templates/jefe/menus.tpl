{include file="header.tpl"}
{include file="menu.tpl"}

 <script type="text/javascript">
         
$(document).ready(function(){
    verlistado()
    //CARGAMOS EL ARCHIVO QUE NOS LISTA LOS REGISTROS, CUANDO EL DOCUMENTO ESTA LISTO
         
        var randomnumber=Math.random()*11;
            $.post("vivienda_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#vivienda").html(data);
            });     
        var randomnumber=Math.random()*10;
            $.post("datos_familiares_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#datosfamiliares").html(data);
            });

           var randomnumber=Math.random()*11;
            $.post("dominio_idioma_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#dominioidioma").html(data);
            });

             var randomnumber=Math.random()*11;
            $.post("formacion_pregrado_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#formacionpregrado").html(data);
            });
            
             var randomnumber=Math.random()*11;
            $.post("formacion_postgrado_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#formacionpostgrado").html(data);
            });
            
            
             var randomnumber=Math.random()*11;
            $.post("perfeccionamiento_profesional_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#perfecionamientoprofesional").html(data);
            });



        var randomnumber=Math.random()*11;
            $.post("evento_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#evento").html(data);
            });
            
            
             var randomnumber=Math.random()*11;
            $.post("evento_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#evento").html(data);
            });
            
              
             var randomnumber=Math.random()*11;
            $.post("dedicacion_exclusiva_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#dedicacionexclusiva").html(data);
            });
              var randomnumber=Math.random()*11;
            $.post("docencia_auxiliar_umss_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#docenciaauxiliarumss").html(data);
            });
           
             var randomnumber=Math.random()*11;
            $.post("docencia_auxiliar_externa_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#docenciaauxiliarexterna").html(data);
            });
            
              var randomnumber=Math.random()*11;
            $.post("titularizacion_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#titularizacion").html(data);
            });
            
             var randomnumber=Math.random()*11;
            $.post("plan_proyecto_programa_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#planproyecto").html(data);
            });
            
            
               var randomnumber=Math.random()*11;
            $.post("desempenio_profesional_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#desempenioprofesional").html(data);
            });
})
function verlistado(){ //FUNCION PARA MOSTRAR EL LISTADO EN EL INDEX POR JQUERY
              var randomnumber=Math.random()*11;
            $.post("asistencia_evento_lista.php?funcionario_id={$funcionario->id}", {
                randomnumber:randomnumber
            }, function(data){
              $("#asistenciaevento").html(data);
            });
            

}

</script>
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
 <li><a href="{$URL}jefe" class="active">Inicio</a></li>
  </div>

<div class="art-vmenublock clearfix">
   <div class="art-vmenublockheader">
  <h3 class="t">Datos de :</h3>
  <h3 class="t">{$funcionario->nombre} {$funcionario->apellido_p} {$funcionario->apellido_m}</h3>
        </div>
        <div class="art-vmenublockcontent">
    
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
  
         <article>
            <h3 class="t">Vivienda</h3>
              <div id="vivienda">
               
              </div><br>
            
           <h3 class="t">Datos Familiares</h3>
              <div id="datosfamiliares">
               
              </div><br>
              
              <h3 class="t">Dominio Idioma</h3>
              <div id="dominioidioma">
               
              </div><br>
              
              <h3 class="t">Formaci&oacute;n Pregado</h3>
              <div id="formacionpregrado">
               
              </div><br>
              
              <h3 class="t"> Formaci&oacute;n Postgrado</h3>
              <div id="formacionpostgrado">
               
              </div><br>
              
              <h3 class="t">Perfeccionamiento Profesional</h3>
              <div id="perfecionamientoprofesional">
               
             </div>
              
              <h3 class="t">Eventos</h3>
              <div id="evento">
               
               </div>
              
              
              <h3 class="t">Asistencia a Eventos</h3>
              <div id="asistenciaevento">
               
               </div>
               <h3 class="t">Dedidicaci&oacute;n Exclusiva</h3>
              <div id="dedicacionexclusiva">
               
               </div>
               
                <h3 class="t">Docencia y Auxiliatura dentro la Umss</h3>
              <div id="docenciaauxiliarumss">
               
               </div>
                
                <h3 class="t">Docencia y Auxiliatura Externa</h3>
              <div id="docenciaauxiliarexterna">
               
               </div>
                
                <h3 class="t">Titularizacion dentro la Umss</h3>
              <div id="titularizacion">
               
               </div>
                
                 <h3 class="t">Plan Proyecto Programa</h3>
              <div id="planproyecto">
               
               </div>
                 
                 <h3 class="t">Desempeño Profesional Externa</h3>
              <div id="desempenioprofesional">
               
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