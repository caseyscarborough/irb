<html>
<head>
  <meta name='layout' content='main'/>
  <title><g:message code="application.show.label" /></title>
  <script>
    function getReviewCountFor(id) {
      $.ajax({
        type: "POST",
        url:  "${createLink(controller: 'user', action: 'reviewCount')}/" + id,
        success: function(data) { $("#application-review-count").html(data); },
        error: function(data) { alert("An error occurred. Please try again later."); }
      });
    }
    $(function() {
      $('.tooltip-link').tooltip({
        placement: 'right',
        container: 'body'
      });

      getReviewCountFor($("#reviewer option:first").val());

      $('#reviewer').change(function() {
        getReviewCountFor($(this).val());
      });
    });
  </script>
</head>

<body>
<g:render template="assignModal" />
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1><g:message code="application.show.label" /></h1>
      <g:render template="../shared/alerts" />
      <h3>Information</h3>
      <table class="table table-striped table-hover table-responsive">
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <g:if test="${applicationInstance?.assignedTo}"><th>Assigned To</th></g:if>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${applicationInstance?.title}</td>
            <td>${applicationInstance?.description ?: "None"}</td>
            <td><a title="${applicationInstance?.status?.description}" class="tooltip-link">${applicationInstance?.status}</a></td>
            <g:if test="${applicationInstance?.assignedTo}"><td>${applicationInstance?.assignedTo}</td></g:if>
          </tr>
        </tbody>
      </table>
      <h3><g:message code="application.files.label" /></h3>
      <g:if test="${applicationFileList?.size() > 0}">
        <table class="table table-hover table-striped table-responsive">
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
              <td><g:link controller="file" action="download" title="Download File" class="tooltip-link" params="${[fileHash: file?.hash]}">${file?.originalFilename}</g:link></td>
              <td>${file?.sizeString}</td>
              <td>${file?.extension?.toUpperCase()}</td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </g:if>
      <sec:ifAllGranted roles="ROLE_ADMIN">
        <h3>User Information</h3>
        <table width="100%" class="table table-striped table-hover hidden-sm hidden-xs">
        <thead>
        <tr>
          <th>Username</th>
          <th>Name</th>
          <th>Email</th>
          <th>Roles</th>
          <th>Active?</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><g:link action="profile" title="View Profile" class="tooltip-link" params="${[username: userInstance?.username]}">${userInstance?.username}</g:link></td>
          <td>${userInstance}</td>
          <td><a title="Email ${userInstance}" class="tooltip-link" href="mailto:${userInstance?.email}">${userInstance?.email}</a></td>
          <td>${userInstance?.authoritiesString}</td>
          <td>${userInstance?.enabled ? "Yes" : "No"}</td>
        </tr>
        </tbody>
        </table>
      </sec:ifAllGranted>
      <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_IRB_CHAIR">
        <h3>Options</h3>
        <p><button class="btn btn-primary" data-toggle="modal" data-target="#assignModal">Assign To Reviewer</button></p>
      </sec:ifAnyGranted>
    </div>
  </div>
</div>
</body>
</html>
