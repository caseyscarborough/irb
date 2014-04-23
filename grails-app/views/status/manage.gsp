<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="status.management.label" /></title>
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
    <div class="col-md-10 col-sm-1">
      <h1><g:message code="status.management.label" /></h1>
      <g:render template="../shared/alerts" />
      <h3>Status List</h3>
      <g:if test="${statusInstanceList.size() > 0}">
        <g:each in="${statusInstanceList}" var="statusInstance">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">${statusInstance}</h3>
            </div>
            <div class="panel-body">
              <p>${statusInstance?.description}</p>
              <g:link action="edit" params="${[id: statusInstance?.id]}"class="tooltip-link" title="Edit"><i class="glyphicon glyphicon-pencil"></i></g:link>&nbsp;
              <g:link action="delete" params="${[id: statusInstance?.id]}" onclick="return confirm('Are you sure?')" class="tooltip-link" title="Delete"><i class="glyphicon glyphicon-trash"></i></g:link>
            </div>
          </div>
        </g:each>
      </g:if>
      <g:else>
        <div class="alert alert-info">
          <g:message code="status.no.records" />
        </div>
      </g:else><br>

      <p>
        <h3>Options</h3>
        <g:link action="create"><button class="btn btn-primary">Create New Status</button></g:link>
      </p><br><br>
    </div>
  </div>
</div>
</body>
</html>
