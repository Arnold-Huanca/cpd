

    <div class="art-blockheader">
     <h3 class="t">Login Form</h3>
   </div>
<div class="art-blockcontent">
  <form action="#" method="post"  name="login" id="login">
     <p>{$ERRORLOGIN}</p>
  <fieldset class="input" style="border: 0 none;">
    <p id="form-login-username">
      <label for="modlgn_username">Username(*)</label>
      <br />
      <input id="modlgn_username" type="text" name="username" class="inputbox" alt="username" size="18" />
    </p>
    <p id="form-login-password">
      <label for="modlgn_passwd">Password(*)</label>
      <br />
      <input id="modlgn_passwd" type="password" name="passwd" class="inputbox" size="18" alt="password" />
    </p>
     <label for="modlgn_username">Datos de ingreso</label>
    <p id="form-login-remember">
      <label class="art-checkbox">
      <input type="checkbox" id="modlgn_remember" name="remember" value="yes" alt="Remember Me" />Remember Me
      </label>
    </p>
    
     <input type="hidden" name="tarea" value="ingreso">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Ingresar" class="art-button">
    </fieldset>
              
               <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
  <ul>
    <li>
      <a href="#">Forgot your password?</a>
    </li>
    <li>
      <a href="#">Forgot your username?</a>
    </li>
    <li>
      <a href="#">Create an account</a>
    </li>
  </ul>
</form>
        </div>