<html>
<head>
  <meta name='layout' content='main'/>
  <title>Submit New Application</title>
</head>

<body>
<div class="row">
  <div class="medium-10 medium-offset-1 small-12 columns">
    <h1>Submit New Application</h1>
    <g:render template="../shared/alerts" />
    <p>Use the following form to upload files for your application. Supported filetypes are <irb:supportedFiletypes/>.</p>
    <form action="${createLink(controller: 'application', action: 'upload')}" method="post" enctype="multipart/form-data" data-abide>
      <div class="row">
        <div class="small-12 columns">
          <label><g:message code="application.title.label" /></label>
          <input type="text" name="title" id="title" placeholder="<g:message code="application.title.label" />" required />
          <small class="error">A title is required to submit an application.</small>
        </div>
      </div>
      <div class="row">
        <div class="small-12 columns">
          <label><g:message code="application.description.label" /></label>
          <textarea class="textarea-tall" name="description" id="description" placeholder="<g:message code="application.description.label" />"></textarea>
        </div>
      </div>
      <input type="file" name="file" />
      <input type="submit" class="button small radius" value="Submit Application"/>
    <form>

    <br><br><g:link action="index">Return to <g:message code="application.label" /></g:link>
  </div>
</div>
</body>
</html>
