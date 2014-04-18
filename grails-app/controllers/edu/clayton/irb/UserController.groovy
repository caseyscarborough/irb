package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException

class UserController {

  def authenticationManager
  def springSecurityService

  @Secured('IS_AUTHENTICATED_FULLY')
  def profile(String username) {
    User loggedInUser = springSecurityService.getCurrentUser()
    // If the user is admin, allow them to see any user's profile.
    if (loggedInUser.hasRole('ROLE_ADMIN')) {
      User userInstance = User.findByUsername(username) ?: loggedInUser
      return [userInstance: userInstance]
    }

    // Otherwise, show the logged in user's profile.
    def userInstance = springSecurityService.getCurrentUser()
    [userInstance: userInstance]
  }

  @Secured('IS_AUTHENTICATED_FULLY')
  def edit() {
    User loggedInUser = springSecurityService.getCurrentUser()
    User userInstance = User.get(params?.userId)

    boolean valid = true
    try {
      // Check if credentials are correct.
      authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loggedInUser.username, params?.currentPassword))
    } catch (AuthenticationException e) {
      valid = false
    }

    if (valid) {
      if (userInstance) {
        if ((loggedInUser == userInstance) || loggedInUser.hasRole('ROLE_ADMIN')) {
          userInstance.firstName = params?.firstName
          userInstance.lastName  = params?.lastName
          userInstance.email     = params?.email

          // If new password exists, and it matches the confirmation, update the user's password.
          if (params.newPassword && (params?.newPassword == params?.newPasswordConfirmation)) {
            userInstance.password = params.newPassword
          }

          userInstance.save(flush: true)
          flash.message = "Successfully updated user information."
          redirect(action: 'profile', params: [username: userInstance?.username])
          return
        }
      }
      // Unauthorized update was attempted.
      redirect(action: 'profile')
      return
    }
    // An incorrect password was entered.
    flash.error = "The password you entered is incorrect."
    redirect(action: 'profile', params: [username: userInstance?.username])
    return
  }
}
