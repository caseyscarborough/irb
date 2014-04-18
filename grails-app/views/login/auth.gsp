<html>
<head>
  <meta name='layout' content='main'/>
  <title>Login</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Login</h1>
    <g:render template="../shared/alerts" />
    <p><g:message code="login.header"/></p>
    <form action="${postUrl}" method="POST" data-abide>
      <div class="row">
        <div class="small-12 columns">
          <label for="username"><g:message code="user.username.label"/></label>
          <input name="j_username" type="text" placeholder="${message(code: 'user.username.label')}" required>
          <small class="error">Username is required.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="password"><g:message code="user.password.label"/></label>
          <input name="j_password" type="password" placeholder="${message(code: 'user.password.label')}" required>
          <small class="error">Password is required.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <input type='checkbox' name='_spring_security_remember_me' id='remember-me' <g:if test='${hasCookie}'>checked='checked'</g:if>>
            <label for='remember-me'><g:message code="login.remember.me.label"/></label>
          </input>
        </div>
      </div>
      <g:submitButton name="${message(code: 'login.submit')}" class="button"/>
    </form>
  </div>
</div>
</body>
</html>
