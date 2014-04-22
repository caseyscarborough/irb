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

  def submit() {
    [applicationInstance: new Application()]
  }

  def save() {
    def currentUser = springSecurityService.currentUser
    def applicationInstance = new Application(user: currentUser, title: params?.title, description: params?.description, status: Status.findByType(StatusType.PENDING))

    if (applicationInstance.save(flush: true)) {
      flash.message = message(code: 'application.submit.success')
      ApplicationFile.findAllByUserAndApplication(currentUser, null).each { file ->
        // Associate the file and the application with each other
        file.application = applicationInstance
        applicationInstance.files.add(file)
      }
      redirect(action: 'index')
      return
    }

    flash.error = message(code: 'application.submit.error')
    log.error("An error occurred submitting the application:\n${applicationInstance.errors}")
    render(view: 'submit', model: [applicationInstance: applicationInstance])
  }

}
