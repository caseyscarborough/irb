<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="user.management.label" /></title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1><g:message code="user.management.label" /></h1>
      <g:render template="../shared/alerts" />
      <h3>User List</h3>
      <table width="100%" class="table table-striped table-hover hidden-sm hidden-xs">
        <thead>
        <tr>
          <th>Username</th>
          <th>Name</th>
          <th>Email</th>
          <th>Role</th>
          <th>Active?</th>
          <th style="width:15%">Options</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" var="userInstance">
          <tr<g:if test="${!userInstance?.enabled}"> class="warning"</g:if>>
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
      <div class="visible-xs visible-sm">
        <g:each in="${userInstanceList}" var="userInstance">
          <div class="panel <g:if test="${!userInstance?.enabled}">panel-warning</g:if><g:else>panel-default</g:else>">
            <div class="panel-heading">
              <h3 class="panel-title">${userInstance}</h3>
            </div>
            <div class="panel-body">
              <g:link action="profile" params="${[username: userInstance?.username]}">${userInstance?.username}</g:link><br>
              <a href="mailto:${userInstance?.email}">${userInstance?.email}</a><br>
              ${userInstance?.role}<br>
              <g:if test="${userInstance != currentUser}">
                <g:if test="${userInstance?.enabled}">
                  <g:link action="disable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Disable</g:link>
                </g:if><g:else>
                <g:link action="enable" id="${userInstance?.id}" onclick="return confirm('Are you sure?')">Enable</g:link>
              </g:else>
                &middot; <g:link action="delete" id="${userInstance?.id}" onclick="return confirm('Are you sure you would like to permanently delete this user and all information associated with them?')">Delete</g:link>
              </g:if>
            </div>
          </div>
        </g:each>
      </div>
      <br><h3>Options</h3>
      <g:link action="create"><button class="btn btn-primary">Create New User</button></g:link>
    </div>
  </div>
</div>
</body>
</html>
