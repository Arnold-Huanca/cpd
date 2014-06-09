{include file="header.tpl"}
{include file="menu.tpl"}

 <script type="text/javascript">
         
$(document).ready(function(){
    verlistado()
    //CARGAMOS EL ARCHIVO QUE NOS LISTA LOS REGISTROS, CUANDO EL DOCUMENTO ESTA LISTO


})
function verlistado(){ //FUNCION PARA MOSTRAR EL LISTADO EN EL INDEX POR JQUERY
              var randomnumber=Math.random()*11;
            $.post("listar.php", {
                randomnumber:randomnumber
            }, function(data){
              $("#contenido").html(data);
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
 <div class="art-vmenublockcontent">

     <div class="leftpanel"   style="width: 100%">
        
         <div class="leftmenu divleftmenu">  
             
            <ul class="nav nav-tabs nav-stacked">
                
                <li class="nav-header" style="background: #166063; color: #FFFFFF;">Navegaci&oacute;n</li>
                {if (isset($menuizquierda))}
                   
                 {section name=ic loop=$menuizquierda}
                  {assign var="menu" value=$menuizquierda[ic]}
                     {if {$menu->nombre_menu} == "Titularizacion"} 
                     {if ( $menu->getItemTotal() > 1 ) }
                  <li class="dropdown active dropdownactiveli" >
                     <a href=""><span class="iconfa-briefcase"></span> {$menu->nombre_menu}</a>
                    <ul style="display: block;">
                 
                     {section name=id loop=$menu->menu_items}
                     {assign var="menu_item" value=$menu->menu_items[id]}
                     <li class="active"><a href="{$URL}{$menu_item->link}">{$menu_item->titulo}</a></li>
                      {/section}
                  
                    </ul>
                   </li>
                    {else}
                     <li class="active"><a href=""><span class="iconfa-laptop"></span> {$menu->nombre_menu}</a></li>
                     {/if}
                  {else}
                    {if ( $menu->getItemTotal() > 1 ) }
                   <li class="dropdown" style="color: #FFFFFF;"><a href=""><span class="iconfa-briefcase"></span> {$menu->nombre_menu}</a>
                 
                     <ul >
                          
                     {section name=id loop=$menu->menu_items}
                     {assign var="menu_item" value=$menu->menu_items[id]}
                     <li ><a href="{$URL}{$menu_item->link}">{$menu_item->titulo}</a></li>
                      {/section}
                   
                    </ul>
                   </li>
                   {else}
                     <li><a href="{$URL}{$menu->menu_items[0]->link}"><span class="iconfa-laptop"></span> {$menu->nombre_menu}</a></li>
                   {/if}

                  {/if} 
               
                 {/section}
                {/if}
                 <li><a href="#"><span class="iconfa-hand-up"></span></a></li>
               
            </ul>
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->
 
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
  
         <article id="contenido">
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