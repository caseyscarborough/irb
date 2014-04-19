<html>
<head>
  <meta name='layout' content='main'/>
  <title>Create User</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Create User</h1>
    <g:render template="../shared/alerts" />
    <form action="${createLink(controller: 'user', action: 'save')}" method="POST" name="create-user-form" id="create-user-form" data-abide>
      <div class="row">
        <div class="small-12 columns">
          <label for="username"><g:message code="user.username.label" /> (must be unique)</label>
          <input type="text" id="username" name="username" value="${userInstance?.username}" placeholder="${message(code: 'user.username.label')}" required />
          <small id="username-error" class="error">A user must have a unique username.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 medium-6 columns">
          <label for="firstName"><g:message code="user.first.name.label" /></label>
          <input type="text" id="firstName" name="firstName" value="${userInstance?.firstName}" placeholder="${message(code: 'user.first.name.label')}" />
        </div>
        <div class="small-12 medium-6 columns">
          <label for="lastName"><g:message code="user.last.name.label" /></label>
          <input type="text" id="lastName" name="lastName" value="${userInstance?.lastName}" placeholder="${message(code: 'user.last.name.label')}" />
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="email"><g:message code="user.email.label" /></label>
          <input type="text" id="email" name="email" value="${userInstance?.email}" placeholder="${message(code: 'user.email.label')}" required pattern=".*@.*\..*"/>
          <small class="error">A user must have a valid email address.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="password"><g:message code="user.password.label" /></label>
          <input type="password" id="password" name="password" value="" placeholder="${message(code: 'user.password.label')}" required />
          <small class="error">A user must have a password.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="role"><g:message code="user.role.label" />
            <select id="role" name="role">
              <g:each in="${roleInstanceList}" var="roleInstance">
                <option value="${roleInstance?.id}">${roleInstance}</option>
              </g:each>
            </select>
          </label>
        </div>
      </div>
      <g:submitButton id="submit" name="submit" class="button small radius" value="${message(code: 'user.create.submit.button')}" />
    </form>
  </div>
</div>
</body>
</html>