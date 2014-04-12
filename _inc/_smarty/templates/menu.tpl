
<nav class="art-nav clearfix">
    <ul class="art-hmenu">
      <li><a href="{$URL}index.php" class="active">Principal</a></li>
      <li><a href="#">Noticias</a></li>
      <li><a href="#">Products</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Clients</a></li>
      <li><a href="#">About Us</a></li>
      <li><a href="#">Contact Us</a></li>
      
       {if (isUserSession())}
          <li><a href="{$URL}?salir=1">Salir</a></li>     
        {/if}
    </ul> 

</nav>