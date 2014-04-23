<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="application.assigned.to.me.label" /></title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1><g:message code="application.label" /></h1>
      <g:render template="../shared/alerts" />
      <h3><g:message code="application.assigned.to.me.label" /></h3>
      <g:if test="${applicationInstanceList.size() > 0}">
        <g:each in="${applicationInstanceList}" var="applicationInstance">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><g:link action="show" id="${applicationInstance?.id}">${applicationInstance?.title}</g:link></h3>
            </div>
            <div class="panel-body">
              Description: ${applicationInstance?.description ?: "None"}<br>
              Current Status: ${applicationInstance?.status}
            </div>
          </div>
        </g:each>
      </g:if>
      <g:else>
        <div class="alert alert-info">
          <g:message code="application.assigned.to.me.no.records" />
        </div>
      </g:else>
    </div>
  </div>
</div>
</body>
</html>
