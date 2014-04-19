<html>
<head>
  <meta name='layout' content='main'/>
  <title>Manage Statuses</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Manage Statuses</h1>
    <g:render template="../shared/alerts" />
    <br><h3>Status List</h3>
    <g:if test="${statusInstanceList.size() > 0}">
      <g:each in="${statusInstanceList}" var="statusInstance">
        ${statusInstance} - ${statusInstance?.type}<br>
      </g:each>
    </g:if>
    <g:else>
      <div class="alert-box">
        There are currently no statuses in the system.
      </div>
    </g:else>
  </div>
</div>
</body>
</html>
