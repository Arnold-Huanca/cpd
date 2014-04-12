<?php
  global $SYSTEM_NAME,$SESSION_TIME;
  $SYSTEM_NAME  = "PROYECTOFINALDPA";
  $SESSION_TIME = 60*60; //

 /**
  * Inicia la session, el codigo del grupo que puede ser
  * @global string $SYSTEM_NAME el nombre del sistema
  * @global string $SESSION_TIME el tiempo de la session
  * @param string $login el nombre de usuario
  * @param string $passwd la clave de acceso
  * @param string $grupo_codigo el codigo del grupo
  * @return boolean
  */
function initSession($login, $passwd) {
  global $SYSTEM_NAME,$SESSION_TIME;
  leerClase("Usuario");
  $user = new Usuario();
  $user = $user->issetUser($login, $passwd);
  if ($user)
    {
    $user = new Usuario($user->id);
  //  $user->getAllObjects();
    saveObject($user, "$SYSTEM_NAME-USER");
    setcookie("$SYSTEM_NAME-USER", $login, time() + $SESSION_TIME, '/');
    return true;
    }
  else
    return false;
}

/**
 * Pregunta si hay session
 */
function isUserSession($grupo_codigo = false) {
  global $SYSTEM_NAME,$SESSION_TIME;
  if(!isset($_SESSION))
    session_start();
  
  if ($grupo_codigo && !getSessionEsTipo($grupo_codigo))
  {
    //closeSession();
    return 0;
  }

  if (!isset($_COOKIE["$SYSTEM_NAME-USER"]) )
  {
    //exit("CERRANDO CESSION desde aca");
    //closeSession();
    return 0;
  }
                 
  // renovamos en tiempo de la session pq hay actividad del usuario
  $login = $_COOKIE["$SYSTEM_NAME-USER"];
  setcookie("$SYSTEM_NAME-USER", $login, time() + $SESSION_TIME, '/');

  return isset($_SESSION["$SYSTEM_NAME-USER"]) ? 1 : 0;
}

/**
 * Lee el objeto incompleto de la session
 * @return Usuario El usuario de la session
 */
function getSessionUser() {
  global $SYSTEM_NAME;
  if (isset($_COOKIE["$SYSTEM_NAME-USER"])) {
    return loadObject("$SYSTEM_NAME-USER");
  }
  else {
    return 0;
  }
}
/**
 * obtenemos si es session de cierto tipo
 * @param String $grupo_codigo
 * @param Usuario|FALSE $usuario_aux
 * @return boolean
 */
function getSessionEsTipo($grupo_codigo,$usuario_aux = false) {
    leerClase("Usuario");
    if (!$usuario_aux)
      $usuario_aux = getSessionUser();
    $id = '';
    if (is_object($usuario_aux))
      $id = $usuario_aux->id;
    $usuario   = new Usuario($id);
    return $usuario->perteneceGrupo($grupo_codigo);
}

/**
 * Guarda el objeto en la session
 */
function saveObject($object, $name) {
  $_SESSION[$name] = serialize($object);
}

/**
 * Lee cualquier objeto
 */
function loadObject($name) {
  if (!isset($_SESSION[$name])) return "EMPTY";
  return unserialize($_SESSION[$name]);
}

/**
 * cierra la session
 * @global type $SESSION_TIME
 */
function closeSession() {
  global $SYSTEM_NAME,$SESSION_TIME;
  if(isset($_SESSION)) {
    setcookie("$SYSTEM_NAME-USER", "" , 1 - ($SESSION_TIME * 2), '/');
    unset($_SESSION["$SYSTEM_NAME-USER"]);
  }
  session_destroy();
}

 /**
 * obtiene el ip
 */
function getIP() {
  if (getenv("HTTP_X_FORWARDED_FOR"))
    return getenv("HTTP_X_FORWARDED_FOR");
  return getenv("REMOTE_ADDR");
}


?>