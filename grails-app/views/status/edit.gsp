<html>
<head>
  <meta name='layout' content='main'/>
  <title>Edit Status</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Edit Status</h1>
    <g:render template="../shared/alerts" />
    <form action="${createLink(controller: 'status', action: 'update')}" method="PUT" name="edit-status-form" id="edit-status-form" data-abide>
      <g:hiddenField name="id" id="id" value="${statusInstance?.id}" />
      <div class="row">
        <div class="small-12 columns">
          <label for="name"><g:message code="status.name.label" /></label>
          <input type="text" id="name" name="name" value="${statusInstance?.name}" placeholder="${message(code: 'status.name.label')}" required />
          <small id="username-error" class="error">A status must have a name.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="description"><g:message code="status.description.label" /></label>
          <textarea id="description" name="description" class="textarea-tall" placeholder="${message(code: 'status.description.label')}" >${statusInstance?.description}</textarea>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label for="type"><g:message code="status.type.label" />
            <select id="type" name="type">
              <g:each in="${statusTypeList}" var="statusType">
                <option value="${statusType?.id}"<g:if test="${statusInstance?.type == statusType}"> selected</g:if>>${statusType}</option>
              </g:each>
            </select>
          </label>
        </div>
      </div>
      <g:submitButton id="submit" name="submit" class="button small radius" value="${message(code: 'status.update.submit.button')}" /><br><br>
      <g:link action="manage">Return to Status Management</g:link>
    </form>
  </div>
</div>
</body>
</html>