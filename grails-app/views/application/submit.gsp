<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta name='layout' content='main'/>
  <title>Submit New Application</title>
  <link rel="stylesheet" href="${resource(dir: 'js/uploader/css/', file: 'jquery.fileupload.css')}">
  <link rel="stylesheet" href="${resource(dir: 'js/uploader/css/', file: 'jquery.fileupload-ui.css')}">
  <noscript><link rel="stylesheet" href="${resource(dir: 'js/uploader/css', file: 'jquery.fileupload-noscript.css')}"></noscript>
  <noscript><link rel="stylesheet" href="${resource(dir: 'js/uploader/css', file: 'jquery.fileupload-ui-noscript.css')}"></noscript>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-1 hidden-sm"></div>
    <div class="col-md-10 col-sm-12">
      <h1>Submit New Application</h1>
      <g:render template="../shared/alerts" />
      <form id="fileupload" action="${createLink(controller: 'application', action: 'save')}" method="POST" enctype="multipart/form-data">
        <div class="form-group">
          <label for="title"><g:message code="application.title.label" /></label>
          <input id="title" class="form-control" name="title" value="${applicationInstance?.title}" placeholder="${message(code: 'application.title.label')}" />
        </div>
        <div class="form-group">
          <label for="description"><g:message code="application.description.label" /></label>
          <textarea id="description" class="form-control textarea-tall" name="description" title="description" placeholder="${message(code: 'application.description.label')}">${applicationInstance?.description}</textarea>
        </div>
        <p>Use the following form to upload files for your application. Supported filetypes are <irb:supportedFiletypes/>.</p>
        <div class="row fileupload-buttonbar">
          <div class="col-lg-7">
            <span class="btn btn-success fileinput-button">
              <i class="glyphicon glyphicon-plus"></i>
              <span>Add files...</span>
              <input type="file" name="files[]" multiple>
            </span>
            <button type="submit" class="btn btn-primary start">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Start upload</span>
            </button>
            <button type="reset" class="btn btn-warning cancel">
              <i class="glyphicon glyphicon-ban-circle"></i>
              <span>Cancel upload</span>
            </button>
            <button type="reset" class="btn btn-danger delete">
              <i class="glyphicon glyphicon-trash"></i>
              <span>Delete</span>
            </button>
            <input type="checkbox" class="toggle">

            <span class="fileupload-process"></span>
          </div>
          <div class="col-lg-5 fileupload-progress fade">
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
              <div class="progress-bar progress-bar-success" style="width:0%;"></div>
            </div>
            <div class="progress-extended">&nbsp;</div>
          </div>
        </div>
        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
        <g:submitButton name="Submit New Application" class="btn btn-primary btn-lg" />
      </form>
      <br>
    </div>
  </div>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name" style="margin-bottom: 0px;">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
                {% if (!file.error) { %}
                    &nbsp;&nbsp;<span class="label label-success">Success</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button title="Dismiss" class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-remove"></i>
                    <span>Dismiss</span>
                </a>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<script type="text/javascript" src="${resource(dir: 'js/uploader/js/vendor', file: 'jquery.ui.widget.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/uploader/js', file: 'tmpl.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/uploader/js', file: 'load-image.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js/uploader/js', file: 'canvas-to-blob.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.iframe-transport.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.fileupload.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.fileupload-process.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.fileupload-image.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.fileupload-validate.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/js/uploader/js', file: 'jquery.fileupload-ui.js')}"></script>
<script type="text/javascript" src="${createLink(controller: 'javascript', action: 'main')}"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${resource(dir: '/js/uploader/js/cors', file: 'jquery.xdr-transport.js')}" type="text/javascript"></script>
<![endif]-->
</body>
</html>
