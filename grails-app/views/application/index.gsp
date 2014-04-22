<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="application.label" /></title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1><g:message code="application.label" /></h1>
      <g:render template="../shared/alerts" />
      <h3>Application List</h3>
      <g:if test="${applicationInstanceList.size() > 0}">
        <g:each in="${applicationInstanceList}" var="applicationInstance">

        </g:each>
      </g:if>
      <g:else>
        <div class="alert alert-info">
          <g:message code="application.no.records" />
        </div>
      </g:else>

      <h3>Options</h3>
      <g:link action="submit"><button class="btn btn-primary"><g:message code="application.submit.button" /></button></g:link>
    </div>
  </div>
</div>
</body>
</html>
