package edu.clayton.irb

class IrbTagLib {

  def grailsApplication

  static defaultEncodeAs = 'raw'
  static namespace = "irb"

  def springSecurityService

  def welcomeMessage = { attrs ->
    if (springSecurityService.isLoggedIn()) {
      User user = springSecurityService.getCurrentUser()
      if (user.firstName) {
        out << "Welcome, ${user.firstName}!"
      } else {
        "Welcome!"
      }
    }
  }

  def isNotUser = { attrs, body ->
    if (springSecurityService.currentUser?.username != attrs.username) {
      out << body()
    }
  }

  def supportedFiletypes = { attrs ->
    def output = new StringBuilder()
    grailsApplication.config.irb.supportedFiletypes.eachWithIndex { ft, i ->
      if (i != 0) {
        output.append(', ')
      }
      output.append("<strong>${ft}</strong>")
    }

    out << output.toString()
  }
}
