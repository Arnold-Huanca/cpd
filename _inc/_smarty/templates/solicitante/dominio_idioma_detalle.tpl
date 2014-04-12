{include file="header.tpl"}
{include file="menu.tpl"}
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      {include file="menus.tpl"}
          <div class="art-layout-cell art-content clearfix">
     <article class="art-post art-article">
                                
          <h2></h2>                                        
   <div class="art-postcontent art-postcontent-0 clearfix">
     
     
      <form  class="contact_form"  id="contact_form"  action="#" method="post" id="registro" name="registro" >
               
             <p>
              <label for="rol"><small>Idioma : {$idioma->nombre_idioma}</small></label>
           
              
            </p><br>
            
            <p>
                  <label for="nombre"><small>Habla : {$dominio_idioma->habla}</small></label>
            </p><br>
             <p>
                 <label for="nombre"><small>Lee : {$dominio_idioma->lee}</small></label>
            </p><br>
            <p>
                 <label for="nombre"><small>Escribe : {$dominio_idioma->escribe} </small></label>
            </p><br>
            <p>
                       <label for="nombre"><small>Dominio Idioma : {$dominio_idioma->dominio_idioma}</small></label>
            </p><br>
            <p>
                 <label for="nombre"><small>Descripci&oacute;n : {$dominio_idioma->descripcion} </small></label>
            </p><br>
            <p>
                  <label for="email"><small> Estado</small></label>
            
            </p><br>
            
            <p>
              
                 {if ($dominio_idioma->estado eq "Pendiente" || $dominio_idioma->estado eq "Aceptado" )}
                      <input type="radio" name="valora" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="valora" value="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="valora" value="Aceptado"   />Aceptar
                          <input type="radio" name="valora" value="Observado"  checked /> Rechazar
                   
                        {/if}
     
                
                        
	    </p>
	    <p>Observaci&oacute;n:
           <textarea name="observacion" rows="7" cols="40" >
			{$dominio_idioma->observacion}
	    </textarea>
	    </p>
         
           <p>
	     <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
              <input type="hidden" name="dominio_idioma_id"    value="{$dominio_idioma->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <button class="submit" type="submit">Guardar</button> 
              <button class="submit" type="reset" >Cancelar</button> 

            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>


</div>
     
      
                    </div>
                </div>
            </div>
      <footer class="art-footer clearfix">
<p>Pie de pagina</p>
</footer>

    </div>
 {include file="footer.tpl"}    