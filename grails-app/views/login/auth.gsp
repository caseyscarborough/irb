<html>
<head>
  <meta name='layout' content='main'/>
  <title>Login</title>
</head>

<body>
<div class="row">
  <div class="medium-8 medium-offset-2 small-12 columns">
    <g:render template="../shared/alerts" />
    <p><g:message code="login.header"/></p>
    <form action="${postUrl}" method="POST">
      <div class="row">
        <div class="small-12 columns">
          <label for="username"><g:message code="login.username.label"/></label>
          <input name="j_username" type="text" placeholder="${message(code: 'login.username.label')}">
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="password"><g:message code="login.password.label"/></label>
          <input name="j_password" type="password" placeholder="${message(code: 'login.password.label')}">
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <input type='checkbox' name='j_remember_me' id='remember-me' <g:if test='${hasCookie}'>checked='checked'</g:if>>
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
