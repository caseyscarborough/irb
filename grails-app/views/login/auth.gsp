<html>
<head>
  <meta name='layout' content='main'/>
  <title>Login</title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1>Login</h1>
      <g:render template="../shared/alerts" />
      <p><g:message code="login.header"/></p>
      <form action="${postUrl}" method="POST" role="form">
        <div class="form-group">
          <label for="username"><g:message code="user.username.label"/></label>
          <input name="j_username" class="form-control" type="text" placeholder="${message(code: 'user.username.label')}" required>
        </div>
        <div class="form-group">
          <label for="password"><g:message code="user.password.label"/></label>
          <input name="j_password" class="form-control" type="password" placeholder="${message(code: 'user.password.label')}" required>
        </div>
        <div class="checkbox">
            <label for='remember-me'><g:message code="login.remember.me.label"/>
              <input type='checkbox' name='_spring_security_remember_me' id='remember-me' <g:if test='${hasCookie}'>checked='checked'</g:if> />
            </label>
        </div>
        <g:submitButton name="${message(code: 'login.submit')}" class="btn btn-primary"/>
      </form>
    </div>
  </div>
</div>
</body>
</html>
