<html>
<head>
  <meta name='layout' content='main'/>
  <title>Create User</title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-2">
      <h1>Create User</h1>
      <g:render template="../shared/alerts" />
      <form action="${createLink(controller: 'user', action: 'save')}" method="POST" name="create-user-form" id="create-user-form" data-abide>
        <div class="form-group">
          <label for="username"><g:message code="user.username.label" /></label>
          <input type="text" id="username" class="form-control" name="username" value="${userInstance?.username}" placeholder="${message(code: 'user.username.label')}" required />
        </div>
        <div class="form-group">
          <label for="firstName"><g:message code="user.first.name.label" /></label>
          <input type="text" id="firstName" class="form-control" name="firstName" value="${userInstance?.firstName}" placeholder="${message(code: 'user.first.name.label')}" />
        </div>
        <div class="form-group">
          <label for="lastName"><g:message code="user.last.name.label" /></label>
          <input type="text" id="lastName" class="form-control" name="lastName" value="${userInstance?.lastName}" placeholder="${message(code: 'user.last.name.label')}" />
        </div>
        <div class="form-group">
          <label for="email"><g:message code="user.email.label" /></label>
          <input type="text" id="email" class="form-control" name="email" value="${userInstance?.email}" placeholder="${message(code: 'user.email.label')}" required pattern=".*@.*\..*" />
        </div>
        <div class="form-group">
          <label for="password"><g:message code="user.password.label" /></label>
          <input type="password" id="password" class="form-control" name="password" value="" placeholder="${message(code: 'user.password.label')}" required />
        </div>
        <strong>Roles</strong>
        <g:each in="${roleInstanceList}" var="roleInstance">
          <div class="checkbox">
            <label for="role-${roleInstance?.id}">${roleInstance}</label>
            <input type="checkbox" id="role-${roleInstance?.id}" name="role-${roleInstance?.id}" />
          </div>
        </g:each>
        <g:submitButton id="submit" name="submit" class="btn btn-primary" value="${message(code: 'user.create.submit.button')}" />
        <br><br><g:link action="manage">Return to <g:message code="user.management.label" /></g:link>
      </form>
    </div>
  </div>
</div>
</body>
</html>