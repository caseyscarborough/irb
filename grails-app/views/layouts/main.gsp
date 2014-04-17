<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>IRB &middot; <g:layoutTitle /></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'foundation.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<g:layoutHead/>
    <g:javascript library="application" />
    <g:javascript library="jquery" />
    <r:layoutResources />
    <script src="${resource(dir: 'js', file: 'foundation.min.js')}" type="text/javascript"></script>
</head>
	<body>
    <g:render template="../shared/navBar" />
    <div class="wrapper">
      <g:layoutBody/>
    </div>
  <r:layoutResources />
  <script src="${resource(dir: 'js', file: 'fastclick.js')}" type="text/javascript"></script>
	</body>
</html>
