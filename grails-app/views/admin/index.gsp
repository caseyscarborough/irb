<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="administration.label" /></title>
</head>

<body>
<div class="row">
  <div class="col-md-1 hidden-sm"></div>
  <div class="col-md-10 col-sm-12">
    <h1><g:message code="administration.label" /></h1>
    <g:render template="../shared/alerts" />
    <g:link controller="user" action="manage"><g:message code="user.management.label" /></g:link><br>
    <g:link controller="status" action="manage"><g:message code="status.management.label" /></g:link>
  </div>
</div>
</body>
</html>
