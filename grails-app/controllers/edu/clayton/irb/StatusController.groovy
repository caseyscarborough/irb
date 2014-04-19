package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional
class StatusController {

  @Secured('ROLE_ADMIN')
  def manage() {
    Status.list(sort: 'name').each { s ->
      println s
    }
    [statusInstanceList: Status.list(sort: 'name')]
  }

  @Secured('ROLE_ADMIN')
  def create() {
    [statusInstance: new Status(), statusTypeList: StatusType.findAll()]
  }

  @Secured('ROLE_ADMIN')
  @Transactional
  def save() {
    def statusInstance = new Status()

    statusInstance.properties = params
    statusInstance.type = StatusType.findById(Integer.parseInt(params?.type))

    if (statusInstance.save(flush: true)) {
      flash.message = "Successfully created new status type."
      redirect(action: 'manage')
      return
    }

    flash.error = "An error occurred creating the status type."
    log.info("An error occurred creating the status type:\n${statusInstance.errors}")
    render(view: 'create', model: [statusInstance: statusInstance, statusTypeList: StatusType.findAll()])
  }
}
