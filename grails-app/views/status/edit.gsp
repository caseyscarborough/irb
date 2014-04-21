<html>
<head>
  <meta name='layout' content='main'/>
  <title>Edit Status</title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1>Edit Status</h1>
      <g:render template="../shared/alerts" />
      <form action="${createLink(controller: 'status', action: 'update')}" method="PUT" name="edit-status-form" id="edit-status-form" data-abide>
        <g:hiddenField name="id" id="id" value="${statusInstance?.id}" />
        <div class="form-group">
          <label for="name"><g:message code="status.name.label" /></label>
          <input type="text" id="name" class="form-control" name="name" value="${statusInstance?.name}" placeholder="${message(code: 'status.name.label')}" required />
        </div>
        <div class="form-group">
          <label for="description"><g:message code="status.description.label" /></label>
          <textarea id="description" class="form-control textarea-tall" name="description" placeholder="${message(code: 'status.description.label')}" >${statusInstance?.description}</textarea>
        </div>
        <div class="form-group">
          <label for="type"><g:message code="status.type.label" /></label>
          <select id="type" name="type" class="form-control">
            <g:each in="${statusTypeList}" var="statusType">
              <option value="${statusType?.id}"<g:if test="${statusInstance?.type == statusType}"> selected</g:if>>${statusType}</option>
            </g:each>
          </select>
        </div>
        <g:submitButton id="submit" name="submit" class="btn btn-primary" value="${message(code: 'status.update.submit.button')}" /><br><br>
        <g:link action="manage">Return to <g:message code="status.management.label" /></g:link>
      </form>
    </div>
  </div>
</div>
</body>
</html>