<html>
<head>
  <meta name='layout' content='main'/>
  <title>Profile</title>
</head>

<body>
<div class="row">
  <div class="medium-8 medium-offset-2 small-12 columns">
    <h1>Update Profile</h1>
    <g:render template="../shared/alerts" />
    <form action="${createLink(controller: 'user', action: 'edit')}" method="POST" name="edit-user-form" id="edit-user-form" data-abide>
      <g:hiddenField name="userId" value="${userInstance?.id}" />
      <div class="row">
        <div class="small-12 columns">
          <label for="firstName"><g:message code="user.first.name.label" /></label>
          <input type="text" id="firstName" name="firstName" value="${userInstance?.firstName}" placeholder="${message(code: 'user.first.name.label')}" />
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="lastName"><g:message code="user.last.name.label" /></label>
          <input type="text" id="lastName" name="lastName" value="${userInstance?.lastName}" placeholder="${message(code: 'user.last.name.label')}" />
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="email"><g:message code="user.email.label" /></label>
          <input type="text" id="email" name="email" value="${userInstance?.email}" placeholder="${message(code: 'user.email.label')}" />
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
      <g:submitButton id="submit" name="submit" class="button radius" value="${message(code: 'user.profile.submit.button')}" />
    </form>
  </div>
</div>
</body>
</html>