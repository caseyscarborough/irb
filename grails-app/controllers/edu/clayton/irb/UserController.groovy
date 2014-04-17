package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException

class UserController {

  def authenticationManager
  def springSecurityService

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def profile(String username) {
    User loggedInUser = springSecurityService.getCurrentUser()
    if (loggedInUser.hasRole('ROLE_ADMIN')) {
      User userInstance = User.findByUsername(username) ?: loggedInUser
      return [userInstance: userInstance]
    }
    def userInstance = springSecurityService.getCurrentUser()
    [userInstance: userInstance]
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def edit() {
    User loggedInUser = springSecurityService.getCurrentUser()
    User userInstance = User.get(params?.userId)

    boolean valid = true
    try {
      authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userInstance.username, params?.currentPassword))
    } catch (AuthenticationException e) {
      valid = false
    }

    if (valid) {
      if (userInstance) {
        if ((loggedInUser == userInstance) || loggedInUser.hasRole('ROLE_ADMIN')) {
          userInstance.firstName = params?.firstName
          userInstance.lastName = params?.lastName

          if (params.newPassword && (params?.newPassword == params?.newPasswordConfirmation)) {
            userInstance.password = params.newPassword
          }

          userInstance.save(flush: true)
          flash.message = "Successfully updated user information."
          redirect(action: 'profile', params: [username: userInstance?.username])
          return
        }
      }
    }
    flash.error = "The password you entered is incorrect."
    redirect(action: 'profile', params: [username: userInstance?.username])
  }
}
