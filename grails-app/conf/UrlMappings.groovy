class UrlMappings {

  static mappings = {
    "/$controller/$action?/$id?(.$format)?" {
      constraints {
        // apply constraints here
      }
    }

    "/applications"(controller: "application", action: "index")
    "/user/profile/$username"(controller: "user", action: "profile")
    "/file/download/$fileHash"(controller: "file", action: "download")
    "/login"(controller: "login", action: "auth")
    "/logout"(controller: "logout", action: "index")
    "/"(controller: "home", action: "index")
    "500"(view: '/error')
    "404"(view: '/404')
  }
}
