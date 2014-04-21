<!DOCTYPE HTML>
<html lang="en">
<head>
  <!-- Force latest IE rendering engine or ChromeFrame if installed -->
  <!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
  <meta charset="utf-8">
  <meta name='layout' content='main'/>
  <title>Submit New Application</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- blueimp Gallery styles -->
  <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
  <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
  <link rel="stylesheet" href="/irb/static/js/uploader/css/jquery.fileupload.css">
  <link rel="stylesheet" href="/irb/static/js/uploader/css/jquery.fileupload-ui.css">
  <!-- CSS adjustments for browsers with JavaScript disabled -->
  <noscript><link rel="stylesheet" href="/irb/static/js/uploader/css/jquery.fileupload-noscript.css"></noscript>
  <noscript><link rel="stylesheet" href="/irb/static/js/uploader/css/jquery.fileupload-ui-noscript.css"></noscript>
</head>
<body>
<div class="row">
  <div class="small-12 medium-10 medium-offset-1 columns">
    <h1>Submit New Application</h1>
    <form id="fileupload" action="/irb/application/upload/" method="POST" enctype="multipart/form-data">
      <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
      <div class="row fileupload-buttonbar">
        <div class="small-12 columns">
          <!-- The fileinput-button span is used to style the file input field as button -->
          <button class="button small radius fileinput-button">
            <span>Add files...</span>
            <input type="file" name="files[]" multiple>
          </button>
          <button type="submit" class="button small radius start">
            <i class="glyphicon glyphicon-upload"></i>
            <span>Start upload</span>
          </button>
          <button type="reset" class="button small radius cancel">
            <i class="glyphicon glyphicon-ban-circle"></i>
            <span>Cancel upload</span>
          </button>
          <button type="button" class="button small radius alert delete">
            <i class="glyphicon glyphicon-trash"></i>
            <span>Delete</span>
          </button>
          <input type="checkbox" class="toggle">
          <!-- The global file processing state -->
          <span class="fileupload-process"></span>
        </div>
        <!-- The global progress state -->
        <div class="col-lg-5 fileupload-progress fade">
        <br><br><br><br>
          <!-- The global progress bar -->
          <div class="progress success radius" role="progressbar" aria-valuemin="0" aria-valuemax="100">
            <span class="meter" style="width:0%;"></span>
          </div>
          <!-- The extended global progress state -->
          <div class="progress-extended">&nbsp;</div>
        </div>
      </div>
      <!-- The table listing the files available for upload/download -->
      <table role="presentation" class="table" style="width:100%; border:0"><tbody class="files"></tbody></table>
    </form>
    <br>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Demo Notes</h3>
      </div>
      <div class="panel-body">
        <ul>
          <li>The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).</li>
          <li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).</li>
          <li>Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).</li>
          <li>You can <strong>drag &amp; drop</strong> files from your desktop on this webpage (see <a href="https://github.com/blueimp/jQuery-File-Upload/wiki/Browser-support">Browser support</a>).</li>
          <li>Please refer to the <a href="https://github.com/blueimp/jQuery-File-Upload">project website</a> and <a href="https://github.com/blueimp/jQuery-File-Upload/wiki">documentation</a> for more information.</li>
          <li>Built with Twitter's <a href="http://twitter.github.com/bootstrap/">Bootstrap</a> CSS framework and Icons from <a href="http://glyphicons.com/">Glyphicons</a>.</li>
        </ul>
      </div>
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
            <div class="progress success radius active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><span class="meter" style="width:0%;"></div></div>
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
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
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
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/irb/static/js/uploader/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/irb/static/js/uploader/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="/irb/static/js/uploader/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="/irb/static/js/uploader/js/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="/irb/static/js/uploader/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
</body>
</html>
