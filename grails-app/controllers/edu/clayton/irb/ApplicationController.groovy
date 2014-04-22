package edu.clayton.irb

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import java.io.File

@Secured('IS_AUTHENTICATED_FULLY')
@Transactional
class ApplicationController {

  def springSecurityService

  def index() {
    def currentUser = springSecurityService.currentUser
    [applicationInstanceList: Application.findAllByUser(currentUser)]
  }

  def submit() { }

}
