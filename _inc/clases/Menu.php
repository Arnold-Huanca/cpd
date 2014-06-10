<?php
leerClase('Menu_item');
class Menu
{
     
    

 /**
  * Nombre del menu
  */
  var $nombre_menu;

 /**
  * Todos los items del menu
  * @var object|null 
  */
  var $thise_items;

  
  public function __construct($nombre_menu) {
    $this->nombre_menu = $nombre_menu;
  }

  
  /**
   * Agregamos items al menu
   * @param type $titulo
   * @param type $descripcion
   * @param type $file_icono
   * @param type $link
   * @param int $pendientes
   * @param int $nopendientes
   * @param string $target
   */
  function agregarItem($titulo,$descripcion,$file_icono,$link,$pendientes = 0,$nopendientes = 0,$target = '_self')
  {
    $item               = new Menu_item($titulo,$descripcion,$file_icono,$link,$pendientes,$nopendientes,$target);
    $this->menu_items[] = $item;
  }
  
  
  function  getItemTotal()
  {
      return sizeof($this->menu_items);
  }

  /**
   * Mostarmos el string conformado
   * @param type $string
   */
   function ucpalabras($frace) { 
        $excepciones = array( 
          'de','a','el','y','o','no','para',
          'la','las','lo','los','que',
          'un','dar','es','si','por', 
          'sino','cuando', 'usa','una', 
          'de','del','por','en' 
        ); 

        $palabras = explode(' ', $frace); 
        foreach ($palabras as $key => $palabra) 
        { 
            if (!in_array($palabra, $excepciones)) 
            $palabras[$key] = ucwords($palabra); 
        } 

        $nuevafrace = implode(' ', $palabras); 
        return $nuevafrace; 
    } 

  
  /**
   * Mostramos el menu de las autoridades
   * @return \Menu
   */
  function getAdminIndex() {
      $thises   = array();
      $usuario = getSessionUser();
	
    if (!isset($usuario->id) || (!$usuario->id))
      return;
     mysql_query('SET NAMES \'utf8\'');
     $listado=  mysql_query("select c.id,c.grupo, c.importancia,c.modulo_id , c.nivel
from secuencia c, modulo m,permiso p, grupo g, pertenece pe
where c.modulo_id=p.modulo_id and m.id=p.modulo_id and g.id=p.grupo_id and g.id=pe.grupo_id and p.ver=1 and pe.usuario_id=$usuario->id GROUP BY c.grupo  ORDER BY c.nivel ASC
");
 
             while( $resultado = mysql_fetch_array($listado) )
                {
                	$gruposmenus=$resultado["grupo"];
                	$listadomenus=  mysql_query("select c.id,c.grupo, c.importancia,c.modulo_id , c.nivel, m.codigo
					from secuencia c, modulo m,permiso p, grupo g, pertenece pe
					where c.modulo_id=p.modulo_id and m.id=p.modulo_id and g.id=p.grupo_id and g.id=pe.grupo_id and c.grupo='$gruposmenus' and  p.ver=1 and pe.usuario_id=$usuario->id GROUP BY m.codigo ORDER BY c.nivel ASC
					");
						
						 
			$thise = new Menu($resultado["grupo"]);
			while( $resultados= mysql_fetch_array($listadomenus) )
                          {
                        $texto = strtolower($resultados["codigo"]);
                        $cadena=str_replace(' ', '_',$texto);
                          $menus= str_replace('ó', 'o',$cadena);
			$link =  $cadena;
                        $thise->agregarItem($texto,'Registro y modificaciones para Docentes','basicset/user4.png',$link);
                          }
                              $thises[] =  $thise;
						
						
                }
       return $thises;
  }
  
}

?>