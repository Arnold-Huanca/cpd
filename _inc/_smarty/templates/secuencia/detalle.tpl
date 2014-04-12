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
              <input type="hidden" name="distincion_id"    value="{$distincion->id}">
                <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
             
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
</article>


<script type="text/javascript">
           $(function(){
            $('#fecha').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:{date('Y')}"
        
            });
          });
        </script>
        
</div>
     