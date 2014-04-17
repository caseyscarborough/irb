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
      <li<g:if test="${params.controller == 'user'}"> class="active"</g:if>><g:link controller="user" action="profile">Profile</g:link></li>
    </ul>

    <!-- Right Nav Section -->
    <ul class="right">
    <sec:ifLoggedIn>
      <g:form controller="logout" action="index" method="POST" name="logout-form" id="logout-form">
        <li><a onclick="document.getElementById('logout-form').submit()">Logout</a></li>
      </g:form>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
      <li><g:link controller="login" action="index">Login</g:link></li>
    </sec:ifNotLoggedIn>
    </ul>
  </section>
</nav>