<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Home</title>
	</head>
	<body>
    <div id="homepage">
      <div class="row">
        <g:render template="../shared/alerts" />
        <div class="small-12 medium-5 columns">
          <g:img dir="images" file="loch.png" class="logo" />
        </div>
        <div class="small-12 medium-7 columns">
          <h1>Clayton State University</h1>
          <h2>Institutional Review Board</h2>
          <p>Welcome to the Institutional Review Board application for Clayton State University.
             This application is used to approve, monitor, review, and track research done by
             faculty at Clayton State University.</p>
          <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth"><button class="button radius">Login Now</button></g:link>
          </sec:ifNotLoggedIn>
        </div>
      </div>
    </div>
	</body>
</html>
