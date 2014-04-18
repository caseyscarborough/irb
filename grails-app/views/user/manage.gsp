<html>
<head>
  <meta name='layout' content='main'/>
  <title>Manage Users</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Manage Users</h1>
    <g:render template="../shared/alerts" />
    <h3>User List</h3>
    <table width="100%">
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
        <tr<g:if test="${!userInstance?.enabled}"> style="background-color:pink"</g:if>>
          <td><g:link action="profile" params="${[username: userInstance?.username]}">${userInstance?.username}</g:link></td>
          <td>${userInstance}</td>
          <td><a href="mailto:${userInstance?.email}">${userInstance?.email}</a></td>
          <td>${userInstance?.role}</td>
          <td>${userInstance?.enabled ? "Yes" : "No"}</td>
          <g:if test="${userInstance?.enabled}">
            <td><g:link action="disable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Disable</g:link>
          </g:if><g:else>
            <td><g:link action="enable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Enable</g:link>
          </g:else>
          &middot; <g:link action="delete" id="${userInstance?.id}" onclick="return confirm('Are you sure you would like to permanently delete this user and all information associated with them?')">Delete</g:link></td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <h3>Options</h3>
    <g:link action="create"><button class="button">Create New User</button></g:link>
  </div>
</div>
</body>
</html>
