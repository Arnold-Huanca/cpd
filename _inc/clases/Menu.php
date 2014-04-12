<?php

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
     $listado=  mysql_query("select m.*
from modulo m, permiso p, grupo g , pertenece pr
where  m.id=p.modulo_id and p.grupo_id=g.id and g.id= pr.grupo_id  and pr.usuario_id=$usuario->id and p.ver=1 GROUP BY m.id ");

             while( $resultado = mysql_fetch_array($listado) )
                {
                        $menus=array();
                       
                        $texto = strtolower($resultado["codigo"]);
                        $cadena=str_replace(' ', '_',$texto);
                        $menus[]= str_replace('ó', 'o',$cadena);
                        $menus[]= $resultado["codigo"];
                        $thises[] = $menus;
                }
       return $thises;
  }
  
}

?>