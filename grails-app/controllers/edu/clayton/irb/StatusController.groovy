package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional
class StatusController {

  @Secured('ROLE_ADMIN')
  def manage() {
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
      flash.message = message(code: 'status.create.success')
      redirect(action: 'manage')
      return
    }

    flash.error = message(code: 'status.create.error')
    log.info(message(code: 'status.create.error') + ":\n${statusInstance.errors}")
    render(view: 'create', model: [statusInstance: statusInstance, statusTypeList: StatusType.findAll()])
  }

  @Secured('ROLE_ADMIN')
  def edit(Status statusInstance) {
    if (!statusInstance) {
      redirect(action: 'manage')
      return
    }
    [statusInstance: statusInstance, statusTypeList: StatusType.findAll()]
  }

  @Secured('ROLE_ADMIN')
  def update(Status statusInstance) {
    if (!statusInstance) {
      redirect(action: 'manage')
      return
    }

    statusInstance.properties = params
    statusInstance.type = StatusType.findById(Integer.parseInt(params?.type))

    if (statusInstance.save(flush: true)) {
      flash.message = message(code: 'status.update.success')
      redirect(action: 'edit', params: [id: statusInstance.id])
      return
    }

    flash.error = message(code: 'status.update.error')
    log.info(message(code: 'status.update.error') + ":\n${statusInstance.errors}")
    render(view: 'edit', model: [statusInstance: statusInstance, statusTypeList: StatusType.findAll()])
  }

  @Secured('ROLE_ADMIN')
  def delete(Status statusInstance) {
    if (!statusInstance) {
      redirect(action: 'manage')
      return
    }

    try {
      statusInstance.delete(flush: true)
      flash.message = message(code: 'status.delete.success')
    } catch (DataIntegrityViolationException e) {
      flash.error = message(code: 'status.delete.error')
      log.error(message(code: 'status.delete.error'), e)
    }
    redirect(action: 'manage')
  }
}
