{include file="header.tpl"}
{include file="menu.tpl"}

 <script type="text/javascript">
         
$(document).ready(function(){
   // verlistado()
    EliminarDato(1)
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
function EliminarDato(id)
        {
		
			$.ajax({
				url: 'listar.php',
				type: "GET",
				data: "id="+1,
				success: function(datos){
					//alert(datos);
					$("#contenido").html(datos);
				}
			});
			 // window.location = "index.php"; 
		
		return false;
	 }



</script>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper clearfix">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                      
      {include file="menuizquierdo.tpl"}
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