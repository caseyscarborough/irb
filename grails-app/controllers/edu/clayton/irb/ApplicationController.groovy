package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('IS_AUTHENTICATED_FULLY')
@Transactional
class ApplicationController {

  def springSecurityService

  def index() {
    def currentUser = springSecurityService.getCurrentUser()
    [applicationInstanceList: Application.findAllByUser(currentUser)]
  }

}
