package edu.clayton.irb

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

  def upload() {
    def f = request.getFile('file')
    def currentUser = springSecurityService.currentUser

    if (f.empty) {
      flash.message = 'File cannot be empty.'
      render "Error"
      return
    }

    File path = new File("/Users/Casey/Desktop/${currentUser?.username}")
    String filename = "${new Date().format('yyyyMMddHHmmss')}_${f?.originalFilename}"
    path.mkdirs()

    f.transferTo(new File("${path}/${filename}"))
    println params
    render "Success"
  }

}
