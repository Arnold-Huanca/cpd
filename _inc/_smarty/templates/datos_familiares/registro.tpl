{include file="header.tpl"}
{include file="menu.tpl"}
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      {include file="menuizquierdo.tpl"}
        {if ($ver)}
          {include file="datos_familiares/detalle.tpl"}   
           {else}
               {include file="datos_familiares/contenido.tpl"}
        {/if}
      
    
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}    