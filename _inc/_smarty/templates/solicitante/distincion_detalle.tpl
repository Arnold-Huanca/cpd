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
              <label for="rol"><small>Pais : {$pais->nombre_pais}</small></label>
             
            </p><br>
            
            <p>
              <label for="rol"><small>Universidad : {$universidad->nombre_uni}</small></label>
            
            </p><br>
            
            <p>
                <label for="rol"><small>Tipo Distinci&oacute;n :{$tipodistincion->sigla}</small></label>
             
            </p><br>

            <p>
                <label for="email"><small> Nombre de Distinci&oacute;n  :  {$distincion->nombre_distincion}</small></label>
            </p><br>
            <p>
                 <label for="email"><small> Otra Instituci&oacute;n :  {$distincion->otra_institucion}</small></label>
            </p><br>
            <p>
                 <label for="email"><small> Fecha : {$distincion->fecha}</small></label>
            </p><br>
            
            <p>
                 <label for="email"><small> Universitaria : {$distincion->universitaria}</small></label>
            </p><br>
            
            <p>
                 <label for="email"><small> Ambito de Distinci&oacute;n : {$distincion->ambitodistincion}</small></label>
            </p><br>
            <p>
                 <label for="email"><small> VB : {$distincion->vb}</small></label>
            </p><br>
            <p>
                  <label for="email"><small> Estado</small></label>
            
            </p><br>
            
            <p>
              
                 {if ($distincion->estado eq "Pendiente" || $distincion->estado eq "Aceptado" )}
                      <input type="radio" name="valora" value="Aceptado"  checked />Aceptar
                      <input type="radio" name="valora" value="Observado" /> Rechazar
                        {else}
                             <input type="radio" name="valora" value="Aceptado"   />Aceptar
                          <input type="radio" name="valora" value="Observado"  checked /> Rechazar
                   
                        {/if}
     
                
                        
	    </p>
	    <p>Observaci&oacute;n:
           <textarea name="observacion" rows="7" cols="40" >
			{$distincion->observacion}
	    </textarea>
	    </p>
         
           <p>
	     <input type="hidden" name="funcionario_id"    value="{$funcionario->id}">
              <input type="hidden" name="distincion_id"    value="{$distincion->id}">
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