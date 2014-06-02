
<nav class="art-nav clearfix">
    <ul class="art-hmenu">
      <li><a href="{$URL}index.php" class="active">Inicio</a></li>
      <li><a href="#">Noticias</a></li>
      <li><a href="#">Contactenos</a></li>
      <li><a href="#">Acerca de Nosotros</a></li>
      {if (isUserSession())}
      <li><a href="{$URL}?salir=1">Salir</a></li>     
      {/if}
    </ul> 

</nav>