
	function EliminarDato(cliente_id)
  {
		var msg = confirm("Desea eliminar este dato?")
		if ( msg )
    {
			$.ajax({
				url: 'eliminar.php',
				type: "GET",
				data: "id="+cliente_id,
				success: function(datos){
					//alert(datos);
					$("#fila-"+cliente_id).remove();
				}
			});
			 // window.location = "index.php"; 
		}
		return false;
	}

	