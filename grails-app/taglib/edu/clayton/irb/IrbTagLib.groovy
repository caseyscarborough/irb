package edu.clayton.irb

class IrbTagLib {
  static defaultEncodeAs = 'html'
  //static encodeAsForTags = [tagName: 'raw']
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
}
