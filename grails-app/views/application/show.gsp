<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="application.show.label" /></title>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1><g:message code="application.show.label" /></h1>
      <h3><g:message code="application.title.label" /></h3>
      <p>${applicationInstance?.title}</p>
      <h3><g:message code="application.description.label" /></h3>
      <p>${applicationInstance?.description}</p>
      <h3><g:message code="application.files.label" /></h3>
      <g:if test="${applicationFileList?.size() > 0}">
        <table class="table table-hover table-striped">
          <thead>
            <tr>
              <th>Filename</th>
              <th>File Size</th>
              <th>File Format</th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${applicationFileList}" var="file">
            <tr>
              <td><g:link controller="file" action="download" params="${[fileHash: file?.hash]}">${file?.filename}</g:link></td>
              <td>${Math.round(file?.size / 100000) / 10}MB</td>
              <td>${file?.extension?.toUpperCase()}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </g:if>
      <sec:ifAllGranted roles="ROLE_ADMIN">
        <h3>User Information</h3>
        <p>${applicationInstance?.user?.username}</p>
      </sec:ifAllGranted>
    </div>
  </div>
</div>
</body>
</html>
