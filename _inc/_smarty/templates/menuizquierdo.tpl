    
    
    
    {if (isset($menuizquierda))}

{else}
  
{/if}

 {literal}
   <script type="text/javascript">
    $(function(){
      $("#menuizq>li ul").hide();
      $('ul#menuizq>li').click(function() {$(this).children('ul').fadeIn(200);}); //Hand!
    });
   </script>
{/literal}

              
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
        <div class="art-vmenublockheader">
            <h3 class="t">Navigation</h3>
        </div>
        
        <div class="art-vmenublockcontent">
             
 {if (isset($menuizquierda))}
<div id='cssmenu'>
<ul>
   <li class='active'><a href='index.html'><span>Menu</span></a></li>
   
    {section name=ic loop=$menuizquierda}
      {assign var="menu" value=$menuizquierda[ic]}
    
    
   <li class='has-sub'><a href='#'><span>{$menu->nombre_menu}</span></a>
      <ul>
        {section name=id loop=$menu->menu_items}
          {assign var="menu_item" value=$menu->menu_items[id]}
          <li><a href="{$URL}{$menu_item->link}" target="{$menu_item->target}" title="{$menu_item->descripcion}" >{$menu_item->titulo}</a>
          </li>
       {/section}
      </ul>
   </li>
  
    {/section}
   </ul>
</div>

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