<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="user.management.label" /></title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1><g:message code="user.management.label" /></h1>
    <g:render template="../shared/alerts" />
    <br><h3>User List</h3>
    <table width="100%" class="show-for-medium-up">
      <thead>
      <tr>
        <th>Username</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Active?</th>
        <th style="width:30%">Options</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${userInstanceList}" var="userInstance">
        <tr<g:if test="${!userInstance?.enabled}"> class="users disabled"</g:if>>
          <td><g:link action="profile" params="${[username: userInstance?.username]}">${userInstance?.username}</g:link></td>
          <td>${userInstance}</td>
          <td><a href="mailto:${userInstance?.email}">${userInstance?.email}</a></td>
          <td>${userInstance?.role}</td>
          <td>${userInstance?.enabled ? "Yes" : "No"}</td>
          <td>
            <g:if test="${userInstance != currentUser}">
              <g:if test="${userInstance?.enabled}">
                <g:link action="disable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Disable</g:link>
              </g:if><g:else>
                <g:link action="enable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Enable</g:link>
              </g:else>
              &middot; <g:link action="delete" id="${userInstance?.id}" onclick="return confirm('Are you sure you would like to permanently delete this user and all information associated with them?')">Delete</g:link>
            </g:if>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="show-for-small-only">
      <g:each in="${userInstanceList}" var="userInstance">
        <ul class="vcard users<g:if test="${!userInstance?.enabled}"> disabled</g:if>">
          <li class="fn">${userInstance}</li>
          <li class="smaller"><g:link action="profile" params="${[username: userInstance?.username]}">${userInstance?.username}</g:link></li>
          <li class="smaller"><a href="mailto:${userInstance?.email}">${userInstance?.email}</a></li>
          <li class="smaller">${userInstance?.role}</li>
          <li class="smaller">
            <g:if test="${userInstance != currentUser}">
              <g:if test="${userInstance?.enabled}">
                <g:link action="disable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Disable</g:link>
              </g:if><g:else>
              <g:link action="enable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Enable</g:link>
            </g:else>
              &middot; <g:link action="delete" id="${userInstance?.id}" onclick="return confirm('Are you sure you would like to permanently delete this user and all information associated with them?')">Delete</g:link>
            </g:if>
          </li>
        </ul><br>
      </g:each>
    </div>
    <br><h3>Options</h3>
    <g:link action="create"><button class="button small radius">Create New User</button></g:link>
  </div>
</div>
</body>
</html>
