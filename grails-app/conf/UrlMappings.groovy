class UrlMappings {

  static mappings = {
    "/$controller/$action?/$id?(.$format)?" {
      constraints {
        // apply constraints here
      }
    }

    "/applications/completed"(controller: "application", action: "completed")
    "/applications/pending"(controller: "application", action: "pending")
    "/applications/under-review"(controller: "application", action: "underReview")
    "/applications/assigned-to-me"(controller: "application", action: "assignedToMe")
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
