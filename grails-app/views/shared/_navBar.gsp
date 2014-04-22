<nav class="navbar navbar-default navbar-inverse" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <g:link controller="home" class="navbar-brand">Clayton IRB</g:link>
    </div>

    <div class="collapse navbar-collapse" id="navbar-collapse">
      <ul class="nav navbar-nav">
        <li<g:if test="${params.controller == 'home'}"> class="active"</g:if>><g:link controller="home">Home</g:link></li>
        <li<g:if test="${params.controller == 'application'}"> class="active"</g:if>><g:link controller="application">Applications</g:link></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <sec:ifAllGranted roles="ROLE_ADMIN">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Site Administration <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><g:link controller="user" action="manage"><g:message code="user.management.label" /></g:link></li>
            <li><g:link controller="status" action="manage"><g:message code="status.management.label" /></g:link></li>
          </ul>
        </li>
        </sec:ifAllGranted>
        <sec:ifLoggedIn>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><irb:welcomeMessage/> <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><g:link controller="user" action="profile">Update Profile</g:link></li>
            </ul>
          </li>
          <li><g:link controller="logout">Logout</g:link></li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
          <li <g:if test="${params.controller == 'login'}"> class="active"</g:if>><g:link controller="login" action="index">Login</g:link></li>
        </sec:ifNotLoggedIn>
      </ul>
    </div>
  </div>
</nav>