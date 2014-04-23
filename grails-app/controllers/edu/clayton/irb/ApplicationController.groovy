package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('IS_AUTHENTICATED_FULLY')
@Transactional
class ApplicationController {

  def grailsApplication
  def springSecurityService

  def index() {
    def currentUser = springSecurityService.currentUser
    def completedStatusTypes = [ Status.findByType(StatusType.APPROVED), Status.findByType(StatusType.DENIED), Status.findByType(StatusType.REVIEWED) ]

    def model = [applicationInstanceList: Application.findAllByUser(currentUser)]
    model
  }

  @Secured(['ROLE_ADMIN', 'ROLE_IRB_REVIEWER'])
  def assignedToMe() {
    def currentUser = springSecurityService.currentUser
    [applicationInstanceList: Application.findAllByAssignedTo(currentUser)]
  }

  @Secured(['ROLE_ADMIN', 'ROLE_IRB_CHAIR'])
  def pending() {
    [applicationInstanceList: Application.findAllByStatus(Status.findByType(StatusType.PENDING))]
  }

  @Secured(['ROLE_ADMIN', 'ROLE_IRB_CHAIR'])
  def underReview() {
    [applicationInstanceList: Application.findAllByStatus(Status.findByType(StatusType.UNDER_REVIEW))]
  }

  @Secured(['ROLE_ADMIN', 'ROLE_IRB_CHAIR'])
  def completed() {
    def completedStatusTypes = [ Status.findByType(StatusType.APPROVED), Status.findByType(StatusType.DENIED), Status.findByType(StatusType.REVIEWED) ]
    [applicationInstanceList: Application.findAllByStatusInList(completedStatusTypes)]
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

  def show(Application applicationInstance) {
    def currentUser = springSecurityService.currentUser
    if (applicationInstance && (applicationInstance.user == currentUser || currentUser.hasRoleByAuthority('ROLE_ADMIN'))) {
      def applicationFileList = applicationInstance?.files?.sort { it.filename }
      return [
          applicationInstance: applicationInstance,
          applicationFileList: applicationFileList,
          userInstance: applicationInstance?.user,
          reviewerInstanceList: User.findAllHavingRole(grailsApplication.config.irb.roles.names.reviewer).sort { it?.firstName }
      ]
    }

    flash.error = message(code: 'application.not.found.error', args: [params?.id])
    redirect(action: 'index')
  }

  def assign(Application applicationInstance) {
    if (applicationInstance) {
      def reviewer = User.get(params?.reviewer)

      if (reviewer) {
        applicationInstance?.assignedTo = reviewer
        applicationInstance?.status = Status.findByType(StatusType.ASSIGNED_TO_REVIEWER)

        if (applicationInstance.save(flush: true)) {
          flash.message = message(code: 'application.assign.success', args: [reviewer])
          redirect(action: 'show', id: applicationInstance?.id)
          return
        }
      }
    }
  }
}
