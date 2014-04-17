class UrlMappings {

  static mappings = {
    "/$controller/$action?/$id?(.$format)?" {
      constraints {
        // apply constraints here
      }
    }

    "/user/profile/$username"(controller: "user", action: "profile")
    "/login"(controller: "login", action: "auth")
    "/"(controller: "home", action: "index")
    "500"(view: '/error')
  }
}
