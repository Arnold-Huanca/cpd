                      
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
       <li><a href="{$URL}solicitante" class="active">Inicio</a></li>
  </div>

<div class="art-vmenublock clearfix">
   <div class="art-vmenublockheader">
  <h3 class="t">Datos de : {$funcionario->nombre} {$funcionario->apellido_p}</h3>
        </div>
        <div class="art-vmenublockcontent">
            
 {if (isset($menus))}
  <ul class="art-vmenu">
    <li><a href="formacion_pregrado.php?menus=mostrar&funcionario_id={$funcionario->id}" class="active">Formaci&oacute;n Pregrado</a></li>
    <li><a href="formacion_postgrado.php?menus=mostrar&funcionario_id={$funcionario->id}">Formaci&oacute;n Postgrado</a></li>
    <li><a href="distincion.php?menus=mostrar&funcionario_id={$funcionario->id}">Distinciones</a></li>
    <li><a href="dominio_idioma.php?menus=mostrar&funcionario_id={$funcionario->id}">Dominio Idiomas</a></li>
    <li><a href="perfeccionamiento_profesional.php?menus=mostrar&funcionario_id={$funcionario->id}">Perfeccionamiento Profesional</a></li>
   <li><a href="evento.php?menus=mostrar&funcionario_id={$funcionario->id}">Evento</a></li>
   <li><a href="asistencia_evento.php?menus=mostrar&funcionario_id={$funcionario->id}">Asistencia Evento</a></li>
   <li><a href="dedicacion_exclusiva.php?menus=mostrar&funcionario_id={$funcionario->id}">Dedicaci&oacute;n Exclusiva</a></li>
   <li><a href="docencia_auxiliar_umss.php?menus=mostrar&funcionario_id={$funcionario->id}">Docencia Aux. Umss</a></li>
   <li><a href="docencia_auxiliar_externa.php?menus=mostrar&funcionario_id={$funcionario->id}">Docencia Auxiliar en Otras U. </a></li>
   <li><a href="titularizacion.php?menus=mostrar&funcionario_id={$funcionario->id}">Titularizaci&oacute;n </a></li>
   <li><a href="desempenio_profesional.php?menus=mostrar&funcionario_id={$funcionario->id}">Desempe&ntilde;o Profesional </a></li>
   <li><a href="ejercicio_liberal.php?menus=mostrar&funcionario_id={$funcionario->id}">Ejercicio Liberal de Profesi&oacute;n (Free Lance) </a></li>
   <li><a href="produccion.php?menus=mostrar&funcionario_id={$funcionario->id}"> Producci&oacute;n </a></li>
   <li><a href="patente.php?menus=mostrar&funcionario_id={$funcionario->id}">Patente </a></li>
  <li><a href="membresia.php?menus=mostrar&funcionario_id={$funcionario->id}">Membresia </a></li>
 
  </ul>
{/if}
         
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