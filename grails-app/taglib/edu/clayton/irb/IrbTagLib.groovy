package edu.clayton.irb

class IrbTagLib {

  def grailsApplication

  static defaultEncodeAs = 'raw'
  static namespace = "irb"

  def springSecurityService

  def welcomeMessage = { attrs ->
    if (springSecurityService.isLoggedIn()) {
      User userInstance = springSecurityService.getCurrentUser()
      if (userInstance?.firstName) {
        out << "<img src='https://gravatar.com/avatar/${userInstance.email.encodeAsMD5()}/?s=100' alt='Gravatar for ${userInstance}' width='20' class='img img-circle'>&nbsp;&nbsp;"
        out << "Welcome, ${userInstance.firstName}!"
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
    grailsApplication.config.irb.supportedFiletypes.sort { it }.eachWithIndex { ft, i ->
      if (i != 0) {
        output.append(', ')
      }
      output.append("<strong>${ft}</strong>")
    }

    out << output.toString()
  }

  /**
   * Returns the gravatar url for a user
   *
   * @attr id REQUIRED the id of the user
   * @attr size the size in pixels of the gravatar
   * @attr class the css class to use for the image
   */
  def gravatar = { attrs ->
    def userInstance = User.get(attrs.id)
    if (userInstance) {
      out << "<img src='https://gravatar.com/avatar/${userInstance.email.encodeAsMD5()}/?s=${attrs.size?:400}} alt='Gravatar for ${userInstance}' class='${attrs.class}'>"
    }
  }
}
