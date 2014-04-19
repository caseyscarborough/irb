<html>
<head>
  <meta name='layout' content='main'/>
  <title>Admin</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Administration</h1>
    <g:render template="../shared/alerts" />
    <g:link controller="user" action="manage">User Management</g:link><br>
    <g:link controller="status" action="manage">Status Management</g:link>
  </div>
</div>
</body>
</html>
