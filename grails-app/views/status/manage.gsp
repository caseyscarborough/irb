<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="status.management.label" /></title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1><g:message code="status.management.label" /></h1>
    <g:render template="../shared/alerts" />
    <br><h3>Status List</h3>
    <g:if test="${statusInstanceList.size() > 0}">
      <g:each in="${statusInstanceList}" var="statusInstance">
        <ul class="vcard status">
          <li class="fn">${statusInstance}</li>
          <li>${statusInstance?.description}</li>
          <li>
            <g:link action="edit" params="${[id: statusInstance?.id]}">Edit</g:link> &middot;
            <g:link action="delete" params="${[id: statusInstance?.id]}" onclick="return confirm('Are you sure?')">Delete</g:link>
          </li>
        </ul>
      </g:each>
    </g:if>
    <g:else>
      <div class="alert-box">
        <g:message code="status.no.records" />
      </div>
    </g:else>

    <br><h3>Options</h3>
    <g:link action="create"><button class="button small radius">Create New Status</button></g:link>
  </div>
</div>
</body>
</html>
