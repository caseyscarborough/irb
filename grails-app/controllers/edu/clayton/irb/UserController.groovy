package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException

@Transactional
class UserController {

  def authenticationManager
  def springSecurityService

  @Secured('IS_AUTHENTICATED_FULLY')
  def profile(String username) {
    User loggedInUser = springSecurityService.getCurrentUser()
    // If the user is admin, allow them to see any user's profile.
    if (loggedInUser.hasRoleByAuthority('ROLE_ADMIN')) {
      User userInstance = User.findByUsername(username) ?: loggedInUser
      return [userInstance: userInstance, roleInstanceList: Role.all]
    }

    // Otherwise, show the logged in user's profile.
    def userInstance = springSecurityService.getCurrentUser()
    [userInstance: userInstance, roleInstanceList: Role.all]
  }

  @Secured('IS_AUTHENTICATED_FULLY')
  @Transactional
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
        if ((loggedInUser == userInstance) || loggedInUser.hasRoleByAuthority('ROLE_ADMIN')) {
          userInstance.firstName = params?.firstName
          userInstance.lastName  = params?.lastName
          userInstance.email     = params?.email

          if (loggedInUser.hasRoleByAuthority('ROLE_ADMIN')) {
            // Remove previous roles and create new ones.
            UserRole.findAllByUser(userInstance).each { r -> r.delete(flush: true) }
            Role.all.each { r ->
              if (params["role-${r?.id}"] == 'on') {
                UserRole.create(userInstance, r, true)
              }
            }
          }

          // If new password exists, and it matches the confirmation, update the user's password.
          if (params.newPassword && (params?.newPassword == params?.newPasswordConfirmation)) {
            userInstance.password = params.newPassword
          }

          userInstance.save(flush: true)
          flash.message = message(code: 'user.update.success')
          redirect(action: 'profile', params: [username: userInstance?.username])
          return
        }
      }
      // Unauthorized update was attempted.
      redirect(action: 'profile')
      return
    }
    // An incorrect password was entered.
    flash.error = message(code: 'user.update.password.error')
    redirect(action: 'profile', params: [username: userInstance?.username])
    return
  }

  @Secured('ROLE_ADMIN')
  def manage() {
    [userInstanceList: User.list(sort: 'username'), currentUser: springSecurityService?.currentUser]
  }

  @Secured('ROLE_ADMIN')
  def create() {
    [userInstance: new User(), roleInstanceList: Role.all]
  }

  @Secured('ROLE_ADMIN')
  def checkUsername() {
    def user = User.findByUsername(params?.username)
    response.status = user ? 500 : 200
  }

  @Secured('ROLE_ADMIN')
  @Transactional
  def save() {
    def userInstance = User.findByUsername(params?.username)

    // The username already exists
    if (userInstance) {
      flash.error = message(code: 'user.save.username.error')
      render(view: 'create', model: [userInstance: userInstance, roleInstanceList: Role.all])
      return
    }

    userInstance = new User()
    userInstance.properties = params

    // If the save was successful
    if (userInstance.save(flush: true)) {
      // Create the roles for the user and redirect to the manage users page.
      Role.all.each { r ->
        if (params["role-${r?.id}"] == 'on') {
          UserRole.create(userInstance, r, true)
        }
      }

      flash.message = message(code: 'user.create.success')
      redirect(action: 'manage')
      return
    }

    flash.error = message(code: 'user.create.error')
    render(view: 'create', model: [userInstance: userInstance, roleInstanceList: Role.all])
  }

  @Secured('ROLE_ADMIN')
  @Transactional
  def enable(Long id) {
    User userInstance = User.get(id)

    if (userInstance) {
      // Enable the user.
      userInstance.enabled = true
      userInstance.save(flush: true)

      flash.message = message(code: 'user.enable.success', args: [userInstance?.username])
    } else {
      flash.error = message(code: 'user.enable.error', args: [id])
    }

    redirect(action: 'manage')
  }

  @Secured('ROLE_ADMIN')
  @Transactional
  def disable(Long id) {
    User userInstance = User.get(id)

    if (userInstance) {
      if (userInstance != springSecurityService.currentUser) {
        // Disable the user.
        userInstance.enabled = false
        userInstance.save(flush: true)

        flash.message = message(code: 'user.disable.success', args: [userInstance?.username])
      } else {
        flash.error = message(code: 'user.disable.self.error')
      }
    } else {
      flash.error = message(code: 'user.disable.error', args: [id])
    }

    redirect(action: 'manage')
  }

  @Secured('ROLE_ADMIN')
  @Transactional
  def delete(Long id) {
    User userInstance = User.get(id)

    if (userInstance) {
      // Delete all of this user's role pairs, then delete the user.
      UserRole.findAllByUser(userInstance).each { r -> r.delete() }
      userInstance.delete(flush: true)

      flash.message = message(code: 'user.delete.success', args: [userInstance?.username])
    } else {
      flash.error = message(code: 'user.delete.error', args: [id])
    }

    redirect(action: 'manage')
  }

}
