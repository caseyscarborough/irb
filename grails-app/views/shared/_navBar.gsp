<nav class="top-bar" data-topbar>
  <ul class="title-area">
    <li class="name">
      <h1><g:link controller="home">Clayton IRB</g:link></h1>
    </li>
    <li class="toggle-topbar menu-icon"><a href="#"></a></li>
  </ul>

  <section class="top-bar-section">
    <!-- Left Nav Section -->
    <ul class="left">
      <li<g:if test="${params.controller == 'home'}"> class="active"</g:if>><g:link controller="home">Home</g:link></li>
    </ul>

    <!-- Right Nav Section -->
    <ul class="right">
      <sec:ifAllGranted roles="ROLE_ADMIN">
        <li class="has-dropdown<g:if test="${params.controller == 'admin'}"> active</g:if>">
          <g:link controller="admin">Site Administration</g:link>
          <ul class="dropdown">
            <li><g:link controller="user" action="manage"><g:message code="user.management.label" /></g:link></li>
            <li><g:link controller="status" action="manage"><g:message code="status.management.label" /></g:link></li>
          </ul>
        </li>
      </sec:ifAllGranted>
      <sec:ifLoggedIn>
        <li class="has-dropdown<g:if test="${params.controller == 'user'}"> active</g:if>">
          <a href="#"><irb:welcomeMessage/></a>
          <ul class="dropdown">
            <li><g:link controller="user" action="profile">Update Profile</g:link></li>
          </ul>
        </li>
        <li><g:link controller="logout">Logout</g:link></li>
      </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
        <li <g:if test="${params.controller == 'login'}"> class="active"</g:if>><g:link controller="login" action="index">Login</g:link></li>
      </sec:ifNotLoggedIn>
    </ul>
  </section>
</nav>