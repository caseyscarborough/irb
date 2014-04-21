<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Home</title>
	</head>
	<body>
    <div id="homepage">
      <div class="container">
        <div class="row">
          <g:render template="../shared/alerts" />
          <div class="col-sm-12 col-md-5">
            <g:img dir="images" file="loch.png" class="logo" style="width: 100%" />
          </div>
          <div class="col-sm-12 col-md-7">
            <h1>Clayton State University</h1>
            <h2>Institutional Review Board</h2>
            <p>Welcome to the Institutional Review Board application for Clayton State University.
            This application is used to approve, monitor, review, and track research done by
            faculty at Clayton State University.</p>
            <sec:ifNotLoggedIn>
              <g:link controller="login" action="auth"><button class="btn btn-lg btn-primary">Login Now</button></g:link>
            </sec:ifNotLoggedIn>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>
