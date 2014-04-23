<%@ page import="edu.clayton.irb.Role" %>
<html>
<head>
  <meta name='layout' content='main'/>
  <title>Profile</title>
  <script>
    $(function() {
      $('.tooltip-link').tooltip({ placement: 'right', container: 'body' });
    })
  </script>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1>Update Profile</h1>
      <g:render template="../shared/alerts" />
      <form action="${createLink(controller: 'user', action: 'edit')}" method="POST" name="edit-user-form" id="edit-user-form" data-abide>
        <g:hiddenField name="userId" value="${userInstance?.id}" />
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
          <label for="currentPassword"><g:message code="user.current.password.label" /> (Required) <a class="tooltip-link" title="The currently logged in user's password">?</a></a></label>
          <input type="password" id="currentPassword" class="form-control" name="currentPassword" value="" placeholder="${message(code: 'user.current.password.label')}" required />
        </div>
        <div class="form-group">
          <label for="newPassword"><g:message code="user.new.password.label" /></label>
          <input type="password" id="newPassword" class="form-control" name="newPassword" value="" placeholder="${message(code: 'user.new.password.label')}" />
        </div>
        <div class="form-group">
          <label for="newPasswordConfirmation"><g:message code="user.new.password.confirmation.label" /></label>
          <input type="password" id="newPasswordConfirmation" class="form-control" name="newPasswordConfirmation" value="" placeholder="${message(code: 'user.new.password.confirmation.label')}" />
        </div>
        <sec:ifAllGranted roles="ROLE_ADMIN">
          <irb:isNotUser username="${userInstance?.username}">
            <g:each in="${roleInstanceList}" var="roleInstance">
              <div class="checkbox">
                <label for="role-${roleInstance?.id}">${roleInstance}</label>
                <input type="checkbox" id="role-${roleInstance?.id}" name="role-${roleInstance?.id}" <g:if test="${userInstance?.hasRole(roleInstance)}"> checked</g:if>/>
              </div>
            </g:each>
          </irb:isNotUser>
        </sec:ifAllGranted>
        <strong>Gravatar</strong><br>
        <irb:gravatar id="${userInstance?.id}" size="125" class="img img-thumbnail" /><br><br>
        <g:submitButton id="submit" name="submit" class="btn btn-primary" value="${message(code: 'user.profile.submit.button')}" />
        <sec:ifAllGranted roles="ROLE_ADMIN">
          <br><br><g:link action="manage">Return to <g:message code="user.management.label" /></g:link>
        </sec:ifAllGranted>
      </form>
    </div>
  </div>
</div>
</body>
</html>