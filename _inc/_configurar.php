<?php
  $SYSTEM_NAME  = 'dpa';
  $SESSION_TIME = 60*60;

  //Sistema en desarrollo (localhost)
if ('localhost' == $_SERVER['HTTP_HOST'])
  define('ENDESARROLLO', true);
else
  define('ENDESARROLLO', false);

  ////////////////////////////////////////////////////////
  // Reporte de errores en el sistema
  // Deshabilitar todo reporte de errores
  // error_reporting(0);
  // Errores de ejecucion simples
  // error_reporting(E_ERROR | E_WARNING | E_PARSE);
  ////////////////////////////////////////////////////////


  ////////////////////////////////////////////////////////
  // Directorios
  ////////////////////////////////////////////////////////
  define ("PATH"         , getBasePath()); //RUTA

  // SITE: SE MODIFICAN ARCHIVOS
  define ("DIR_CLASES"   , PATH."/_inc/clases");   //OBJETOS
  define ("DIR_SMARTY"   , PATH."/_inc/_smarty/"); //TEMPLATES
  define ("DIR_MAILTPL"  , PATH."/_inc/mail.tpl/"); // TEMPLATES DE MAIL


  if (ENDESARROLLO)
  {
    //INC: DONDE NO SE MODIFICAN ARCHIVOS
    define ("DIR_LIB"        , dirname( PATH )."/lib.inc/libs");
    define ("DIR_SMARTY_INC" , dirname( PATH )."/lib.inc/_smarty/");
  }
  else
  {
    //INC: DONDE NO SE MODIFICAN ARCHIVOS
    define ("DIR_LIB"        , dirname( PATH )."/beta.proyecto.inc/libs");
    define ("DIR_SMARTY_INC" , dirname( PATH )."/beta.proyecto.inc/_smarty/");
  }
  
  //URL - 1 nivel de este archivo
  define ("URL"        , getBaseUrl()); //direccion de dominio

  define ("URL_JS"     , URL."js/");
  define ("URL_CSS"    , URL."css/");
  define ("URL_IMG"    , URL."images/");

  define ("PATH_IMG"   , PATH."/images/");

  ////////////////////////////////////////////////////////
  // Smarty
  ////////////////////////////////////////////////////////
  //DESARROLLO
  define('TEMPLATES_DIR'    , DIR_SMARTY       . 'templates/');  

  //DE COMPLIACION Y CACHE NO EDITABLES
  define('SMARTY_COMPILEDIR', DIR_SMARTY_INC   . 'templates_c/');
  define('SMARTY_CONFIGDIR' , DIR_SMARTY_INC   . 'configs/');
  define('SMARTY_CACHEDIR'  , DIR_SMARTY_INC   . 'cache/');
  
  ////////////////////////////////////////////////////////
  //BD->MySQL
  ////////////////////////////////////////////////////////
  if (ENDESARROLLO)
  {
   // error_reporting(E_ALL);
   // error_reporting(E_ALL);
    ini_set('display_errors','On');

    define ("DBHOST"        , "localhost");
    //define ("BDNAME"        , "dpa");
    define ("BDNAME"        , "dpa");
    define ("DBUSER"        , "root");
    define ("BDPASS"        , "");
  }
  // SERVER
  // SERVER
  else
  {
		define ("DBHOST"        , "localhost");
		define ("DBUSER"        , "");
		define ("BDNAME"        , "");
		define ("BDPASS"        , "");
  }
