<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="application.label" /></title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1><g:message code="application.label" /></h1>
    <g:render template="../shared/alerts" />
    <br><h3>Application List</h3>
    <g:if test="${applicationInstanceList.size() > 0}">
      <g:each in="${applicationInstanceList}" var="applicationInstance">

      </g:each>
    </g:if>
    <g:else>
      <div class="alert-box">
        <g:message code="application.no.records" />
      </div>
    </g:else>

    <br><h3>Options</h3>
    <g:link action="create"><button class="button small radius"><g:message code="application.submit.button" /></button></g:link>
  </div>
</div>
</body>
</html>
