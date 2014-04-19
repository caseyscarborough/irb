<html>
<head>
  <meta name='layout' content='main'/>
  <title>Profile</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Update Profile</h1>
    <g:render template="../shared/alerts" />
    <form action="${createLink(controller: 'user', action: 'edit')}" method="POST" name="edit-user-form" id="edit-user-form" data-abide>
      <g:hiddenField name="userId" value="${userInstance?.id}" />
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
          <input type="text" id="email" name="email" value="${userInstance?.email}" placeholder="${message(code: 'user.email.label')}" required pattern=".*@.*\..*" />
          <small class="error">You must have a valid email address.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="currentPassword"><g:message code="user.current.password.label" /></label>
          <input type="password" id="currentPassword" name="currentPassword" value="" placeholder="${message(code: 'user.current.password.label')}" required />
          <small class="error">You must enter your password to update your profile.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="newPassword"><g:message code="user.new.password.label" /></label>
          <input type="password" id="newPassword" name="newPassword" value="" placeholder="${message(code: 'user.new.password.label')}" />
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="newPasswordConfirmation"><g:message code="user.new.password.confirmation.label" /></label>
          <input type="password" id="newPasswordConfirmation" name="newPasswordConfirmation" value="" placeholder="${message(code: 'user.new.password.confirmation.label')}" />
        </div>
      </div>
      <sec:ifAllGranted roles="ROLE_ADMIN">
      <irb:isNotUser username="${userInstance?.username}">
        <div class="row">
          <div class="small-12 columns">
            <label for="role"><g:message code="user.role.label" />
              <select id="role" name="role">
                <g:each in="${roleInstanceList}" var="roleInstance">
                  <option value="${roleInstance?.id}"<g:if test="${userInstance?.role?.id == roleInstance?.id}"> selected</g:if>>${roleInstance}</option>
                </g:each>
              </select>
            </label>
          </div>
        </div>
      </irb:isNotUser>
      </sec:ifAllGranted>
    <g:submitButton id="submit" name="submit" class="button small radius" value="${message(code: 'user.profile.submit.button')}" />
    <sec:ifAllGranted roles="ROLE_ADMIN">
      <br><br><g:link action="manage">Return to User Management</g:link>
    </sec:ifAllGranted>
    </form>
  </div>
</div>
</body>
</html>